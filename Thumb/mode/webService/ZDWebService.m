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
#define DefaultProjectNo    @"D"//大拇指项目
#define secret @"bb369ff752074e2ba055f32da6bc3114"//密钥匙

@interface ZDWebService ()

@end

@implementation ZDWebService

//登陆
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

//注册
- (void)registerWithValidateCode:(NSString *)validateCode
                          mobile:(NSString *)mobile
                        password:(NSString *)password
                      completion:(void(^)(NSError *error,NSDictionary *resultDic))handler
{
    password = [NSString md5:password];
    NSDictionary *oriDic = @{
                             @"validateCode":validateCode,
                             @"mobile":mobile,
                             @"password":password
                             };
    NSString *urlString = [self URLStringForRegister];
    
    [self fetchByWebserviceURLString:urlString dictionary:oriDic handler:handler];
}

//获取验证码,oprType:操作类型(”0”:注册, ”1”:重置密码)
- (void)getValidateCodeWithMobile:(NSString *)mobile
                          oprType:(NSString *)oprType
                       completion:(void(^)(NSError *error,NSDictionary *resultDic))handler
{
    NSDictionary *oriDic = @{
                             @"mobile":mobile,
                             @"oprType":oprType
                             };
    NSString *urlString = [self URLStringForGetValidateCode];
    
    [self fetchByWebserviceURLString:urlString dictionary:oriDic handler:handler];
}

//身份证绑定
- (void)idCardBindWithMobile:(NSString *)mobile
                        name:(NSString *)name
                  idCardBind:(NSString *)idCardBind
                completion:(void(^)(NSError *error,NSDictionary *resultDic))handler
{
    NSDictionary *oriDic = @{
                             @"mobile":mobile,
                             @"name":name,
                             @"idCardBind":idCardBind
                             };
    NSString *urlString = [self URLStringForIdCardBind];
    
    [self fetchByWebserviceURLString:urlString dictionary:oriDic handler:handler];
}

//忘记密码后重设密码
- (void)resetPasswordWithValidateCode:(NSString *)validateCode
                               mobile:(NSString *)mobile
                             password:(NSString *)password
                           completion:(void (^)(NSError *, NSDictionary *))handler
{
    password = [NSString md5:password];
    NSDictionary *oriDic = @{
                             @"validateCode":validateCode,
                             @"mobile":mobile,
                             @"password":password
                             };
    NSString *urlString = [self URLStringForForgetAndResetPassword];
    
    [self fetchByWebserviceURLString:urlString dictionary:oriDic handler:handler];
}

//获取网点
/*
    netSiteType:网点类型(“-1”所有网点，”0”理财网点，”1”贷款网点) 我们传0
    mapType:地图类型(“00”google，”01”baidu)
    pageNo:页码
    pageSize:每页显示数量
    longitude:当前经度
    latitude:当前纬度
 */
- (void)getNetSiteWithNetSiteType:(NSString *)netSiteType
                          mapType:(NSString *)mapType
                           pageNo:(NSString *)pageNo
                         pageSize:(NSString *)pageSize
                        longitude:(NSString *)longitude
                         latitude:(NSString *)latitude
                       completion:(void (^)(NSError *, NSDictionary *))handler
{
    NSDictionary *oriDic = @{
                             @"netSiteType":netSiteType,
                             @"mapType":mapType,
                             @"pageNo":pageNo,
                             @"pageSize":pageSize,
                             @"x":longitude,
                             @"y":latitude
                             };
    NSString *urlString = [self URLStringForGetNetSite];
    
    [self fetchByWebserviceURLString:urlString dictionary:oriDic handler:handler];
}

//修改密码
- (void)modifyPasswordWithMobile:(NSString *)mobile
                          oldpwd:(NSString *)oldpwd
                          newpwd:(NSString *)newpwd
                      completion:(void(^)(NSError *error,NSDictionary *resultDic))handler
{
    oldpwd = [NSString md5:oldpwd];
    newpwd = [NSString md5:newpwd];
    
    NSDictionary *oriDic = @{
                             @"mobile":mobile,
                             @"oldpwd":oldpwd,
                             @"newpwd":newpwd
                             };
    NSString *urlString = [self URLStringForUpdatePassword];
    
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
