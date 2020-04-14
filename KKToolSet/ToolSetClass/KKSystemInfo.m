//
//  KKSystermInfo.m
//  GCDDemo
//
//  Created by 李坤 on 2020/4/14.
//  Copyright © 2020 程强. All rights reserved.
//

#import "KKSystemInfo.h"

@implementation KKSystemInfo
+ (NSString *)getAppBuildVersion
{
    NSString *infoPlistPath = [ [NSBundle mainBundle] pathForResource:@"Info"ofType:@"plist"];
    NSDictionary *infoDic = [NSDictionary dictionaryWithContentsOfFile:infoPlistPath];
    return [infoDic objectForKey:@"CFBundleVersion"];
}
+ (NSString *)getAppVersion
{
    NSDictionary *bundleDic = [[NSBundle mainBundle] infoDictionary];
    NSString *versionNum = [bundleDic objectForKey:@"CFBundleShortVersionString"];//CFBundleShortVersionString
    return versionNum;
}
+ (NSString *)getAppBundleIdentifier
{
    NSDictionary *bundleDic = [[NSBundle mainBundle] infoDictionary];
    NSString *Identifier = [bundleDic objectForKey:@"CFBundleIdentifier"];
    return Identifier;
}
+(NSString*)getDeviceSystemName
{
    return [[UIDevice currentDevice] systemName];
}
+(NSString*) getDeviceSystemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}
+(NSString *)getUUID
{
    CFUUIDRef guid_ref = CFUUIDCreate(NULL);
    CFStringRef guid_string_ref= CFUUIDCreateString(NULL, guid_ref);
    CFRelease(guid_ref);
    NSString *guid = [NSString stringWithString:(__bridge NSString*)guid_string_ref];
    CFRelease(guid_string_ref);
    return guid;
}
+ (void)callTelephoneNumber:(NSString *)num handler:(void(^)(UIView *web))block
{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",num];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    block(callWebview);
}
@end
