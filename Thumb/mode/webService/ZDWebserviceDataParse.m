//
//  ZDWebserviceDataParse.m
//  Thumb
//
//  Created by peter on 14/11/11.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDWebserviceDataParse.h"

@interface ZDWebserviceDataParse () <NSXMLParserDelegate>

@property (strong, nonatomic) NSString *parseString;
@property (strong, nonatomic) void(^completionHandler)(NSError *error, NSDictionary *resultDic);
@property (strong, nonatomic) NSString *xmlString;
@end

@implementation ZDWebserviceDataParse

- (id)initWithParseString:(NSString *)parseString
               completion:(void (^)(NSError *, NSDictionary *))handler
{
    self = [super init];
    if (self) {
        self.parseString = parseString;
        self.completionHandler = handler;
    }
    return self;
}

- (void)startParse
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:[self.parseString dataUsingEncoding:NSUTF8StringEncoding]];
    parser.delegate = self;
    [parser parse];
}

#pragma mark - xmlParser

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    self.xmlString = [[NSString alloc] init];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    self.xmlString = [self.xmlString stringByAppendingString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"return"]) {
        NSError *error = nil;
        NSData *receiveData = [self.xmlString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:receiveData options:NSJSONReadingMutableContainers error:&error];
        
        if ([responseDic[@"code"] isEqualToString:@"0000"]) {
            NSString *realResultString = responseDic[@"msg"];
            NSDictionary *realResultDic = [NSJSONSerialization JSONObjectWithData:[realResultString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
            if ([realResultDic[@"status"] isEqualToString:@"0"]) {
                self.completionHandler(nil,realResultDic);
            } else {
                self.completionHandler(nil,realResultDic);
            }
        } else {
            NSError *error = [[NSError alloc] init];
            self.completionHandler(error,nil);
        }
    }
}

@end
