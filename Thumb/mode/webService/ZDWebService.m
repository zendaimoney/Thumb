//
//  ZDWebService.m
//  Thumb
//
//  Created by peter on 14/11/10.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDWebService.h"
#import "ZDNSURLSession.h"
#import "ZDWebService+URLString.h"
#import "ZDWebserviceDataParse.h"

#define DefaultCRMPublishService  @"300001"//crm公共接口转发
#define DefaultProjectNo    @"D"
#define secret @"bb369ff752074e2ba055f32da6bc3114"

@interface ZDWebService ()

@end

@implementation ZDWebService

- (void)loginWithUserName:(NSString *)userName
                 password:(NSString *)password
               completion:(void(^)(NSError *error,NSDictionary *resultDic))handler
{
    password = [NSString md5:password];
    NSDictionary * oriDic = @{
                           @"userName": userName,
                           @"password": password
                           };
    NSString *urlString = [self URLStringForLogin];
    
    [self fetchByWebserviceURLString:urlString dictionary:oriDic handler:handler];
    
}

#pragma mark - 共用请求方法

// webservice的接口请求设置
- (void)fetchByWebserviceURLString:(NSString *)urlString dictionary:(NSDictionary *)dic handler:(void(^)(NSError *error,NSDictionary *resultDic))handler
{
    NSString *projectNo = DefaultProjectNo;
    NSString *reqUrl = urlString;
    NSString *reqParam = [self translateToJsonStringWithDictionaryUnnormal:dic];
    NSString *reqParam2 = [self translateToJsonStringWithDictionaryNormal:dic];//用于生成校验码
    
    NSString *userAgent = [NSString stringWithFormat:@"iOS,%@,iPhone",[[UIDevice currentDevice] systemVersion]];
    NSDictionary *httpHeadDic = @{
                                  @"token":@"",
                                  @"User-Agent":userAgent,
                                  @"netmac":@"",
                                  @"version":[self currentAppVersion]
                                  };
    NSString *reqHeadParm = [self translateToJsonStringWithDictionaryUnnormal:httpHeadDic];
    
    long long time = (long long)([[NSDate date] timeIntervalSince1970] * 1000);
    NSString * reqTimestamp = [NSString stringWithFormat:@"%lld",time];
    
    NSString * dateString = [[NSString stringTranslatedFromDate:[NSDate date]] stringByReplacingOccurrencesOfString:@" " withString:@""];
    dateString = [dateString stringByReplacingOccurrencesOfString:@"-" withString:@""];
    dateString = [dateString stringByReplacingOccurrencesOfString:@":" withString:@""];
    NSString * sn = [NSString stringWithFormat:@"%@-%@",DefaultProjectNo,dateString];
    
    NSString * signOri = [NSString stringWithFormat:@"%@%@%@%@%@%@",projectNo,reqUrl,reqParam2,reqTimestamp,sn,secret];
    NSString * sign = [NSString md5StringFromString:signOri];
    
    NSDictionary *paramDic = @{@"projectNo":projectNo,
                           @"reqUrl":reqUrl,
                           @"reqParam":reqParam,
                           @"reqHeadParm":reqHeadParm,
                           @"reqTimestamp":reqTimestamp,
                           @"sn":sn,
                           @"sign":sign
                           };
    NSString * dataString = [self translateToJsonStringWithDictionaryNormal:paramDic];
    
    NSString *soapMsg = [NSString stringWithFormat:
                         @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://websvc/\">"
                         "<soapenv:Header/>"
                         "<soapenv:Body>"
                         "<web:dispatchCommand>"
                         "<!--Optional:-->"
                         "<web:arg0>%@</web:arg0>"
                         "<!--Optional:-->"
                         "<web:arg1>%@</web:arg1>"
                         "</web:dispatchCommand>"
                         "</soapenv:Body>"
                         "</soapenv:Envelope>",DefaultCRMPublishService,dataString];
    
    NSURL *url = [NSURL URLWithString: TranslateWebURL];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody: [soapMsg dataUsingEncoding:NSUTF8StringEncoding]];
    
//    ZDNSURLSession *session = [[ZDNSURLSession alloc] initWithRequest:req completionHandler:handler];
//    [session startSession];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            handler(error,nil);
        } else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            if (httpResponse.statusCode == 200) {
                NSString *resultString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                ZDWebserviceDataParse *dataParse = [[ZDWebserviceDataParse alloc] initWithParseString:resultString completion:handler];
                [dataParse startParse];
            } else {
                NSError *error = [[NSError alloc] init];
                handler(error,nil);
            }
        }
    }] resume];
}

#pragma mark - translateToJsonString

- (NSString *)translateToJsonStringWithDictionaryUnnormal:(NSDictionary *)dic
{
    NSArray *keys = [dic allKeys];
    NSArray *values = [dic allValues];
    NSString *jsonString = @"{";
    for (int i = 0; i < keys.count; i ++) {
        if (i != (keys.count - 1)) {
            jsonString = [jsonString stringByAppendingString:[NSString stringWithFormat:@"\\\"%@\\\":\\\"%@\\\",",keys[i],values[i]]];
        } else {
            jsonString = [jsonString stringByAppendingString:[NSString stringWithFormat:@"\\\"%@\\\":\\\"%@\\\"",keys[i],values[i]]];
        }
    }
    jsonString = [jsonString stringByAppendingString:@"}"];
    return jsonString;
}

- (NSString *)translateToJsonStringWithDictionaryNormal:(NSDictionary *)dic
{
    NSArray *keys = [dic allKeys];
    NSArray *values = [dic allValues];
    NSString *jsonString = @"{";
    for (int i = 0; i < keys.count; i ++) {
        if (i != (keys.count - 1)) {
            jsonString = [jsonString stringByAppendingString:[NSString stringWithFormat:@"\"%@\":\"%@\",",keys[i],values[i]]];
        } else {
            jsonString = [jsonString stringByAppendingString:[NSString stringWithFormat:@"\"%@\":\"%@\"",keys[i],values[i]]];
        }
    }
    jsonString = [jsonString stringByAppendingString:@"}"];
    return jsonString;
}

#pragma mark - about version

- (NSString *)currentAppVersion
{
    NSDictionary * info = [[NSBundle mainBundle] infoDictionary];
    return info[@"CFBundleShortVersionString"];
}

#pragma mark - sharedWebService

+ (ZDWebService *)sharedWebService
{
    static dispatch_once_t once;
    static ZDWebService *sharedWebService;
    dispatch_once(&once, ^{
        sharedWebService = [[self alloc] init];
    });
    return sharedWebService;
}

@end
