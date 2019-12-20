//
//  WXConfigTools.m
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 2/8/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import "WXConfigTools.h"

#define userDef [NSUserDefaults standardUserDefaults]
#define WXGZCurrentConfig2 @"WXGZCurrentConfig2"

@implementation WXConfigTools

+ (void)setDefaultConfig2:(BOOL)defualtConfig
{
    [userDef setBool:defualtConfig forKey:WXGZCurrentConfig2];
}
+ (BOOL)isDefaultConfig2
{
    return [userDef boolForKey:WXGZCurrentConfig2];
}
+ (NSString *)getVersion
{
    id MTSSVersionManage = [NSClassFromString(@"WXGZVersionManage") performSelector:@selector(sharedInstance)];
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
        [userDef setValue:appkey forKey:WXGZAppkey];
    }
}
//获取保存的appkey
+ (NSString *)getAppkey
{
    return [userDef valueForKey:WXGZAppkey];
}

//保存URL
+ (void)saveReportUrl:(NSString *)reportUrl
{
    if (reportUrl.length) {
        [userDef setValue:reportUrl forKey:WXGZReportUrl];
    }
}
//获取保存的URL
+ (NSString *)getReportUrl
{
    return  [userDef valueForKey:WXGZReportUrl];
}

//acceptId
+ (void)saveAcceptId:(NSString *)acceptId
{
    if (acceptId.length) {
        [userDef setValue:acceptId forKey:WXGZAcceptId];
    }
}
+ (NSString *)getAcceptId
{
    return [userDef valueForKey:WXGZAcceptId];
}




//获取埋点的URL
+ (void)saveBaseUrl:(NSString *)baseUrl{
    if (baseUrl.length) {
        [userDef setValue:baseUrl forKey:WXGZBaseUrl];
    }
}
+ (NSString *)getBaseUrl
{
    return [userDef valueForKey:WXGZBaseUrl];
}

//推送URL
+ (void)savePushUrl:(NSString *)pushUrl{
    if (pushUrl.length) {
        [userDef setValue:pushUrl forKey:WXGZPushUrl];
    }
}
+ (NSString *)getPushUrl
{
    return [userDef valueForKey:WXGZPushUrl];
}


+ (void)syncache
{

    [userDef synchronize];
}
+ (void)clearCache
{
    [userDef setValue:NULL forKey:WXGZReportUrl];
    [userDef setValue:NULL forKey:WXGZAppkey];
    [userDef setValue:NULL forKey:WXGZPushUrl];
    [userDef setValue:NULL forKey:WXGZAcceptId];
    [userDef setValue:NULL forKey:WXGZBaseUrl];
    [userDef synchronize];
}
@end
