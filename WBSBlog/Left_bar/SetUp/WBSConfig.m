//
//  WBSConfig.m
//  WBSBlog
//
//  Created by Weberson on 16/7/20.
//  Copyright © 2016年 Weberson. All rights reserved.
//

#import "WBSConfig.h"

@implementation WBSConfig

/**
 *  获取是否夜间模式
 */
+ (BOOL)getMode
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    return [[userDefaults objectForKey:WBSIs_NightMode] boolValue];
}

/**
 *  获取MetaWeblog API的授权信息
 */
+(WBSApiInfo *)getAuthoizedApiInfo
{
    //获取相关存储信息
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isJSONAPIEnable = [[userDefaults objectForKey:WBSIs_JSONAPI] boolValue];
    NSString *baseURL = [userDefaults objectForKey:WBSSiteBaseURL];
    NSString *username = [userDefaults objectForKey:WBSUserUserName];
    NSString *password = [userDefaults objectForKey:WBSUserPassWord];
    NSString *cookie = [userDefaults objectForKey:WBSSiteAuthCookie];
    //初始化ApiInfo
    WBSApiInfo *apiInfo = nil;
    if (isJSONAPIEnable) {
        apiInfo = [[WBSApiInfo alloc]initWithBaseURL:baseURL andGenerateAuthCookie:cookie];
    }else{
        apiInfo = [[WBSApiInfo alloc] initWithXmlrpc:baseURL username:username password:password];
    }
    //结果处理
    return apiInfo;
}

/**
 *  是否启用JSON API
 */
+(BOOL)isJSONAPIEnable {
    //获取相关存储信息
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isJSONAPIEnable = [[userDefaults objectForKey:WBSIs_JSONAPI] boolValue];
    return isJSONAPIEnable;
}

/**
 *  是否显示页面（默认只显示文章）
 */
+(BOOL)isShowPage{
    //获取相关存储信息
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isShowPage = [[userDefaults objectForKey:WBSIs_ShowPage] boolValue];
    return isShowPage;
}

/**
 *  是否针对Wordpress优化
 */
+(BOOL)isWordpressOptimization{
    //获取相关存储信息
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isWordpressOptimization = [[userDefaults objectForKey:WBSIs_WP_Optimization] boolValue];
    return isWordpressOptimization;

}

@end