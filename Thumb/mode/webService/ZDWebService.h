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

- (void)loginWithUserName:(NSString *)userName
                 password:(NSString *)password
               completion:(void(^)(NSError *error,NSDictionary *resultDic))handler;

+(ZDWebService *)sharedWebService;
@end
