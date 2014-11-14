//
//  ZDWebService+URLString.h
//  Thumb
//
//  Created by peter on 14/11/11.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDWebService.h"
#define API_URL @"https://180.166.169.132:8444/hera/"//公网测试，crm
#define TranslateWebURL @"http://180.166.169.132:8089/message_webservice/services/DealProcessor?wsdl=DealProcessorService.wsdl"//公网测试,许峰转发172.16.73.117
//#define PushWebURL @"http://172.16.73.117:8080/message_webservice/services/DealProcessor?wsdl=DealProcessorService.wsdl"

@interface ZDWebService (URLString)

- (NSString *)URLStringForLogin;
- (NSString *)URLStringForRegister;
- (NSString *)URLStringForGetValidateCode;
- (NSString *)URLStringForIdCardBind;
- (NSString *)URLStringForForgetAndResetPassword;
- (NSString *)URLStringForGetNetSite;
- (NSString *)URLStringForUpdatePassword;

@end
