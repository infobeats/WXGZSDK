//
//  OperationTool.h
//  OperationToolSDK
//
//  Created by DOUBLE Q on 2017/12/6.
//  Copyright © 2017年 DOUBLE Q. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface OperationSDK : NSObject

//网络请求接口
@property (nonatomic, copy) NSString *baseURL;

+ (OperationSDK *)instance;

/*
 *提交AcceptId
 */
- (void)registerAcceptId:(NSString *)acceptId withUrl:(NSString *)url;

/**
 *注册通知
 */
-(void)registerForRemoteNotifications:(NSString *)deviceToken;

/*
 *是否本系统的远程推送
 */
- (BOOL)isOTRemoteNotifications:(NSDictionary *)userInfo;

/*
 *收到远程的推送
 */
- (void)op_didReceiveRemoteNotification:(NSDictionary *)userInfo;

/*
 *程序唤醒
 */
- (void)applicationDidBecomeActive;

@end
