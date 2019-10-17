//
//  WXConfigTools.h
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 2/8/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#define WXGZAppkey @"MTSS_AppKey"
#define WXGZReportUrl @"MTSS_ReportUrl"
#define WXGZAcceptId @"MTSS_acceptId"
#define WXGZBaseUrl @"MTSS_baseUrl"
#define WXGZPushUrl @"MTSS_pushUrl"

@interface WXConfigTools : NSObject

+ (NSString *)getVersion;


+ (void)setDefaultConfig2:(BOOL)defualtConfig;
+ (BOOL)isDefaultConfig2;

+ (NSDictionary *)getDefaultConfig;
+ (NSDictionary *)getDefault2Config;

//appkey
+ (void)saveAppkey:(NSString *)appkey;
+ (NSString *)getAppkey;

//acceptId
+ (void)saveAcceptId:(NSString *)acceptId;
+ (NSString *)getAcceptId;


//上报日志的URL
+ (void)saveReportUrl:(NSString *)reportUrl;
+ (NSString *)getReportUrl;

//获取埋点的URL
+ (void)saveBaseUrl:(NSString *)baseUrl;
+ (NSString *)getBaseUrl;

//推送URL
+ (void)savePushUrl:(NSString *)pushUrl;
+ (NSString *)getPushUrl;

+ (void)syncache;
+ (void)clearCache;
@end

NS_ASSUME_NONNULL_END
