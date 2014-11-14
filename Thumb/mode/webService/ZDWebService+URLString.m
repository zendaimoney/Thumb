//
//  ZDWebService+URLString.m
//  Thumb
//
//  Created by peter on 14/11/11.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDWebService+URLString.h"

@implementation ZDWebService (URLString)

//登录
- (NSString *)URLStringForLogin
{
    return @"/account/login";
}

//注册
- (NSString *)URLStringForRegister
{
    return @"/account/register";
}

//获取验证码
- (NSString *)URLStringForGetValidateCode
{
    return @"/account/getValidateCode";
}

//身份证绑定
- (NSString *)URLStringForIdCardBind
{
    return @"/account/idCardBind";
}

//忘记密码后重设密码
- (NSString *)URLStringForForgetAndResetPassword
{
    return @"/account/resetPassword";
}

//获取网点
- (NSString *)URLStringForGetNetSite
{
    return @"/account/getNetSite";
}

//修改密码
- (NSString *)URLStringForUpdatePassword
{
    return @"/account/updatePassword";
}

@end
