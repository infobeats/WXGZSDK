//
//  WXConfigTools.m
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 2/8/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import "WXConfigTools.h"

#define userDef [NSUserDefaults standardUserDefaults]
#define mtssCurrentConfig2 @"mtssCurrentConfig2"

@implementation WXConfigTools

+ (void)setDefaultConfig2:(BOOL)defualtConfig
{
    [userDef setBool:defualtConfig forKey:mtssCurrentConfig2];
}
+ (BOOL)isDefaultConfig2
{
    return [userDef boolForKey:mtssCurrentConfig2];
}
+ (NSString *)getVersion
{
    id MTSSVersionManage = [NSClassFromString(@"MTSSVersionManage") performSelector:@selector(sharedInstance)];
    return [NSString stringWithFormat:@"%@",[MTSSVersionManage valueForKey:@"sdkVersion"]];
}
+ (NSDictionary *)getDefaultConfig
{
     return @{
             @"appkey":@"64c50764d5687e5ca422bb8a",
             @"acceptId":@"e68e6fe423a7947f",
             @"reportUrl":@"http://wxgz.server.ineice.cn:8080",
             @"pushUrl":@"http://subscribe.manager.ineice.cn:8080",
             @"baseUrl":@"http://wxgz.server.ineice.cn:8888",
             };
}
+ (NSDictionary *)getDefault2Config
{
    return @{
             @"appkey":@"64c50764d5687e5c0d72ac01",
             @"acceptId":@"e68e6fe423a7947f",
             @"reportUrl":@"http://reportapi.infobeats.cn:6060",
             @"pushUrl":@"http://server.infobeats.cn:8888",
             @"baseUrl":@"http://server.infobeats.cn:8888",
             };
}
//保存appkey
+ (void)saveAppkey:(NSString *)appkey
{
    if (appkey.length) {
        [userDef setValue:appkey forKey:mtssAppkey];
    }
}
//获取保存的appkey
+ (NSString *)getAppkey
{
    return [userDef valueForKey:mtssAppkey];
}

//保存URL
+ (void)saveReportUrl:(NSString *)reportUrl
{
    if (reportUrl.length) {
        [userDef setValue:reportUrl forKey:mtssReportUrl];
    }
}
//获取保存的URL
+ (NSString *)getReportUrl
{
    return  [userDef valueForKey:mtssReportUrl];
}

//acceptId
+ (void)saveAcceptId:(NSString *)acceptId
{
    if (acceptId.length) {
        [userDef setValue:acceptId forKey:mtssAcceptId];
    }
}
+ (NSString *)getAcceptId
{
    return [userDef valueForKey:mtssAcceptId];
}




//获取埋点的URL
+ (void)saveBaseUrl:(NSString *)baseUrl{
    if (baseUrl.length) {
        [userDef setValue:baseUrl forKey:mtssBaseUrl];
    }
}
+ (NSString *)getBaseUrl
{
    return [userDef valueForKey:mtssBaseUrl];
}

//推送URL
+ (void)savePushUrl:(NSString *)pushUrl{
    if (pushUrl.length) {
        [userDef setValue:pushUrl forKey:mtssPushUrl];
    }
}
+ (NSString *)getPushUrl
{
    return [userDef valueForKey:mtssPushUrl];
}


+ (void)syncache
{

    [userDef synchronize];
}
+ (void)clearCache
{
    [userDef setValue:NULL forKey:mtssReportUrl];
    [userDef setValue:NULL forKey:mtssAppkey];
    [userDef setValue:NULL forKey:mtssPushUrl];
    [userDef setValue:NULL forKey:mtssAcceptId];
    [userDef setValue:NULL forKey:mtssBaseUrl];
    [userDef synchronize];
}
@end
