//
//  OperationTool.h
//  OperationToolSDK
//
//  Created by DOUBLE Q on 2017/12/6.
//  Copyright © 2017年 DOUBLE Q. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface OperationSDK : NSObject

+ (OperationSDK *)instance;

//网络请求接口
@property (nonatomic, copy) NSString * baseURL;

///acceptId
@property(nonatomic,strong)NSString * acceptId;


/*
 *保存
 */
- (void)saveAcceptId:(NSString *)acceptId withUrl:(NSString *)url;

/**
 *注册通知
 */
-(void)dy_registerForRemoteNotifications:(NSString *)deviceToken;

/*
 *是否本系统的远程推送
 */
- (BOOL)isOTRemoteNotifications:(NSDictionary *)userInfo;

/*
 *收到远程的推送
 */
- (void)dy_didReceiveRemoteNotification:(NSDictionary *)userInfo;

/*
 *程序唤醒
 */
- (void)applicationDidBecomeActive;

@end
