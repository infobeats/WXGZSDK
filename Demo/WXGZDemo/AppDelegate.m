//
//  AppDelegate.m
//  WXGZDemo
//
//  Created by Rachel on 2017/12/28.
//  Copyright © 2017年 ijiami. All rights reserved.
//

#import "AppDelegate.h"
#import "WXUITabbarVC.h"


#import "WXGZ_SDK/WXGZ_SDK.h"
#import "AppDelegate+push.h"

@interface AppDelegate () <UNUserNotificationCenterDelegate>
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /*saas平台*/
    #define MTSSAPPKEY @"64c50764d5687e5ca422bb8a"
    #define MTSSACCEPTID @"e68e6fe423a7947f"
    #define MTSSBASEURL @"http://wxgz.server.ineice.cn:8888"
    #define MTSSREPORTEDURL @"http://wxgz.server.ineice.cn:8080"
    #define MTSSPUSHURL @"http://subscribe.manager.ineice.cn:8080"

    //1、威胁感知SDK初始化
    [MTSS startWithBuryingURL:MTSSBASEURL
                  reportedURL:MTSSREPORTEDURL
                      pushURL:MTSSPUSHURL
                     acceptId:MTSSACCEPTID
                       appKey:MTSSAPPKEY];

    
    //2、开启log，仅仅用于测试使用。
    [MTSS setLogEnable:NO];
    
    //3、检测用户未授权推送时，设置是否每次启动开启授权弹框（可根据业务需求选择是否配置）
    [MTSS setDetecteAndAuthorizedEveryLauchTime:YES
                             withAuthorizedType:MTSSUserNotificationType];
    //4、初始化推送通知
    [self initNotification:application];

   
    [self configWindow];
 
    return YES;
}

#pragma mark - SDK配置无关
- (void)configWindow
{
    WXUITabbarVC *tabBarVC = [[WXUITabbarVC alloc] init];
    self.window.rootViewController = tabBarVC;
    
}

#pragma mark -- 开启后台任务运行几秒即可
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    [[UIApplication sharedApplication] setIdleTimerDisabled:NO];
    __block UIBackgroundTaskIdentifier taskId;
    taskId = [application beginBackgroundTaskWithExpirationHandler:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [application endBackgroundTask:taskId];
            taskId = UIBackgroundTaskInvalid;
        });
    }];
}
@end


