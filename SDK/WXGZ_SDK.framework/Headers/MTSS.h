//
//  MTSS.h
//
//  Created by ijiami on 2017/11/16.
//  Copyright © 2017年 ijiami. All rights reserved.
//

#import <Foundation/Foundation.h>


//授权类型
typedef NS_ENUM(NSInteger, MTSSAuthorizationType)
{
    MTSSUserNotificationType = 1,     // 用户推送授权
    MTSSUserLocationType = 2,         // 用户定位授权
    MTSSAllAuthorizationType = 3,     // 所有授权类型（定位&推送）
};

@interface MTSS : NSObject

/**
 服务器提供埋点API访问的地址
 */
@property (nonatomic, copy, readonly) NSString *buryingURL;

/**
 服务器提供数据上报API访问的地址
 */
@property (nonatomic, copy, readonly) NSString *reportedURL;

/**
 服务器提供pushAPI访问的地址
 */
@property (nonatomic, copy, readonly) NSString *pushURL;

/**
 上传应用后生成的acceptId
 */
@property (nonatomic, copy, readonly) NSString *acceptId;

/**
 上传应用后生成的appKey
 */
@property (nonatomic, copy, readonly) NSString *appKey;


/**
 单例
 */
+ (MTSS *)sharedInstance;

/**
 *  设置服务器埋点、采集上报的URL、激活推送URL、appkey、AcceptId
 *  @param buryingURL       服务器提供埋点API访问的地址
    格式：协议://IP或域名:端口 (没有使用埋点功能可以填写为nil)
 *  @param reportedURL      服务器提供威胁感知数据上报访问的地址
    格式：协议://IP或域名:端口
 *  @param pushURL          服务器提供推送API访问的地址
    格式：协议://IP或域名:端口
 *  @param acceptId         上传应用后生成的acceptId
 *  @param appKey           上传应用后生成的appKey
 */
+ (void)startWithBuryingURL:(NSString *)buryingURL reportedURL:(NSString *)reportedURL pushURL:(NSString *)pushURL acceptId:(NSString *)acceptId appKey:(NSString *) appKey;



/**
 *  注册推送token
 *  @param token  回调data
 */
+ (void)registerForRemoteNotifications:(NSData*)token;


/**
 *  处理推送
 *  @param userInfo  推送消息内容字典
 */
+ (void)didReceiveRemoteNotification:(NSDictionary*)userInfo;


/**
 *  检测授权
 *
 *  @param enable  是否每次启动检测并弹出授权框
 *  @param type    授权类型
 */
+ (void)setDetecteAndAuthorizedEveryLauchTime:(BOOL)enable withAuthorizedType:(MTSSAuthorizationType)type;


/**
 *  检测是否是威胁感知远程的推送通知
 *
 *  @param userInfo   消息内容
 *  @return BOOL      返回bool值
 */
+ (BOOL)ifMTSSRemoteNotifications:(NSDictionary*)userInfo;


/**
 是否开启日志打印
 */
+ (void)setLogEnable:(BOOL)logEnable;

/**
 功能：上传用户信息和SDK获取的信息关联 ps：中文key值不支持
 @param userInfo 用户信息字典
 */
+ (void)addUserInfoWithDic:(NSDictionary *)userInfo;














@end

