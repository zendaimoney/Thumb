//
//  ZDWebService.h
//  Thumb
//
//  Created by peter on 14/11/10.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllCustomerCategoryHeaders.h"

@interface ZDWebService : NSObject<NSXMLParserDelegate>

//登录
- (void)loginWithUserName:(NSString *)userName
                 password:(NSString *)password
               completion:(void(^)(NSError *error,NSDictionary *resultDic))handler;

//注册 
- (void)registerWithValidateCode:(NSString *)validateCode
                          mobile:(NSString *)mobile
                        password:(NSString *)password
                      completion:(void(^)(NSError *error,NSDictionary *resultDic))handler;

//获取验证码,oprType:操作类型(”0”:注册, ”1”:重置密码)
- (void)getValidateCodeWithMobile:(NSString *)mobile
                          oprType:(NSString *)oprType
                       completion:(void(^)(NSError *error,NSDictionary *resultDic))handler;

//身份证绑定
- (void)idCardBindWithMobile:(NSString *)mobile
                        name:(NSString *)name
                  idCardBind:(NSString *)idCardBind
                  completion:(void(^)(NSError *error,NSDictionary *resultDic))handler;

//忘记密码后重设密码
- (void)resetPasswordWithValidateCode:(NSString *)validateCode
                               mobile:(NSString *)mobile
                             password:(NSString *)password
                           completion:(void(^)(NSError *error,NSDictionary *resultDic))handler;

//获取网点
- (void)getNetSiteWithNetSiteType:(NSString *)netSiteType
                          mapType:(NSString *)mapType
                           pageNo:(NSString *)pageNo
                         pageSize:(NSString *)pageSize
                        longitude:(NSString *)longitude
                         latitude:(NSString *)latitude
                       completion:(void(^)(NSError *error,NSDictionary *resultDic))handler;

//修改密码
- (void)modifyPasswordWithMobile:(NSString *)mobile
                          oldpwd:(NSString *)oldpwd
                          newpwd:(NSString *)newpwd
                      completion:(void(^)(NSError *error,NSDictionary *resultDic))handler;

+(ZDWebService *)sharedWebService;
@end
