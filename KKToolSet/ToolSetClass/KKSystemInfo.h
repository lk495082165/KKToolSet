//
//  KKSystermInfo.h
//  GCDDemo
//
//  Created by 李坤 on 2020/4/14.
//  Copyright © 2020 程强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKSystemInfo : NSObject
+ (NSString *)getAppBuildVersion;
+ (NSString *)getAppVersion;
+ (NSString *)getAppBundleIdentifier;
+(NSString*)getDeviceSystemName;
+(NSString*) getDeviceSystemVersion;
+(NSString *)getUUID;
+ (void)callTelephoneNumber:(NSString *)num handler:(void(^)(UIView *web))block;
@end

NS_ASSUME_NONNULL_END
