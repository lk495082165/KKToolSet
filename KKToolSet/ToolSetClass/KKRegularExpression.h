//
//  KKRegularExpression.h
//  GCDDemo
//
//  Created by 李坤 on 2020/4/14.
//  Copyright © 2020 程强. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKRegularExpression : NSObject
+ (BOOL)validateMobile:(NSString *)mobile;
+ (BOOL)validateEmail:(NSString *)email;
+ (NSString *)validateString:(NSString *)string;
+ (BOOL)validatePassword:(NSString *)passWord;
+ (BOOL)validEnglish:(NSString *)str;
+ (BOOL)validNumber:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
