//
//  MTSS+attackCheck.h
//  WXGZ_SDK
//
//  Created by songxuhua on 2019/7/23.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import <WXGZ_SDK/WXGZ_SDK.h>

typedef void(^ResultBlock)(NSDictionary * _Nullable result);

NS_ASSUME_NONNULL_BEGIN

@interface MTSS (attackCheck)


/**
 检测调试攻击
 */
+ (void)debugAttackCheck:(ResultBlock)result;

/**
 检测frida攻击
 */
+ (void)fridaAttackCheck:(ResultBlock)result;

/**
 检测Cycript注入攻击
 */
+ (void)injectionCycriptCheck:(ResultBlock)result;

/**
 请在初始化的之前设置回调，检测位置欺诈,如发生欺诈只回调一次
 */
+ (void)setPositionCheatResult:(ResultBlock)result;

/**
 请在初始化的之前设置回调，设置域名风险回调
 */
+ (void)setDomainRiskResult:(ResultBlock)result;
/**
 检测敏感配置
 */
+ (void)sensitiveConfigCheck:(ResultBlock)result;

/**
 检测substrate框架攻击
 */
+ (void)substrateDetector:(ResultBlock)result;

/**
 检测黑名单应用,只支持iOS8、iOS9系统应用、cydia
 */
+ (void)checkMaliceApps:(ResultBlock)result;

@end

NS_ASSUME_NONNULL_END
