//
//  AppDelegate+push.m
//  WXGZDemo
//
//  Created by 谭建中 on 4/1/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "AppDelegate+push.h"
#import <UserNotifications/UserNotifications.h>

#import <WXGZ_SDK/WXGZ_SDK.h>

@implementation AppDelegate (push)
#pragma mark - 初始化推送
-(void)initNotification:(UIApplication *)application
{
#ifdef __IPHONE_11_0
    if (@available(iOS 10.0, *))
    {
        UNUserNotificationCenter * center = [UNUserNotificationCenter currentNotificationCenter];
        [center setDelegate:self];
        UNAuthorizationOptions type = UNAuthorizationOptionBadge|UNAuthorizationOptionSound|UNAuthorizationOptionAlert;
        [center requestAuthorizationWithOptions:type completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (!granted) {
                NSLog(@"推送注册失败");
            }
        }];
    } else
#endif
    {
        // Fallback on earlier versions
        UIUserNotificationType notificationTypes = UIUserNotificationTypeBadge |
        UIUserNotificationTypeSound |
        UIUserNotificationTypeAlert;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:notificationTypes categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    [application registerForRemoteNotifications];
}

#pragma mark - 注册deviceToken
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    //将得到的deviceToken传给SDK
    [MTSS registerForRemoteNotifications:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"error -- %@",error);
}

#pragma mark - 收到推送消息
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary * _Nonnull)userInfo fetchCompletionHandler:(void (^ _Nonnull)(UIBackgroundFetchResult))completionHandler{
    //适配iOS 10以上 的推送
    if ([MTSS ifMTSSRemoteNotifications:userInfo] &&  ([[UIDevice currentDevice].systemVersion floatValue] <= 10.0f)){
        [MTSS didReceiveRemoteNotification:userInfo];
    }
    completionHandler(UIBackgroundFetchResultNewData);
}

//适配iOS 10以上 的推送
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler API_AVAILABLE(ios(10.0))
{
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if ([MTSS ifMTSSRemoteNotifications:userInfo]){
        [MTSS didReceiveRemoteNotification:userInfo];
    }
}


@end
