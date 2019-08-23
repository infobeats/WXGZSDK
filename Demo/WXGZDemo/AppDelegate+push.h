//
//  AppDelegate+push.h
//  WXGZDemo
//
//  Created by 谭建中 on 4/1/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "AppDelegate.h"
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
#import <UserNotifications/UserNotifications.h>
#endif
NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (push)<UNUserNotificationCenterDelegate>
/*
 注册推送
 */
-(void)initNotification:(UIApplication *)application;

@end

NS_ASSUME_NONNULL_END
