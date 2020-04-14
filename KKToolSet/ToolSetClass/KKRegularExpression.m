//
//  KKRegularExpression.m
//  GCDDemo
//
//  Created by 李坤 on 2020/4/14.
//  Copyright © 2020 程强. All rights reserved.
//

#import "KKRegularExpression.h"

@implementation KKRegularExpression
+ (BOOL)validateMobile:(NSString *)mobile
{
    //手机号以13，15，18，17，19开头，八个 \d 数字字符
    NSString * phoneRegex = @"^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
+ (BOOL)validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
+ (NSString *)validateString:(NSString *)string
{
    if (string == nil || string == NULL || [string isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    if ([string isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@",string];
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0)
    {
        return @"";
    }
    return string;
}
+ (BOOL)validatePassword:(NSString *)passWord
{
    //用户密码需为6-16为数字或字符组成，不能包含特殊符号
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}
+ (BOOL)validEnglish:(NSString *)str
{
    NSString *enRegex = @"^[A-Za-z0-9]+$";
    NSPredicate *enTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",enRegex];
    return [enTest evaluateWithObject:str];
}
+ (BOOL)validNumber:(NSString *)str
{
    //正数
    NSString *number = @"^[+]?[\\d]+(([\\.]{1}[\\d]+)|([\\d]*))$";
    NSPredicate *enTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [enTest evaluateWithObject:str];
}
@end
