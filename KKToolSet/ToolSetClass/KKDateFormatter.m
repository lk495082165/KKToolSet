//
//  KKDateFormatter.m
//  GCDDemo
//
//  Created by 李坤 on 2020/4/14.
//  Copyright © 2020 程强. All rights reserved.
//

#import "KKDateFormatter.h"

@implementation KKDateFormatter
+ (NSString *)getCurrentTimeStamp
{
    NSDate *dateNow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%f", [dateNow timeIntervalSince1970]];
    if (timeSp.length>=10) {
        timeSp = [timeSp substringToIndex:10];
    }
    return timeSp;
}
+ (NSString *)getTimeStampByDate:(NSDate *)date
{
    NSString *timeSp = [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    if (timeSp.length>=10) {
        timeSp = [timeSp substringToIndex:10];
    }
    return timeSp;
}
+ (CGFloat)intervalFromStamp:(NSString *)stmp1 toStamp:(NSString *)stmp2
{
    CGFloat stp1 = [stmp1 floatValue];
    CGFloat stp2 = [stmp2 floatValue];
    float days = (stp2 -stp1)/3600.0/24.0;
    return days;
}
+ (NSString *)dateToString:(NSDate *)date withFormatter:(NSString *)format
{
    //yyyy-MM-dd HH:mm:ss
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:format];
    return [dateFormater stringFromDate:date];
}
+ (NSString *)timeStampToDateString:(NSString *)timeStamp withFormatter:(NSString *)format
{
    if (timeStamp.length>10) {
        timeStamp = [timeStamp substringWithRange:NSMakeRange(0, 10)];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:[timeStamp doubleValue]];
    NSString *currentDateStr = [formatter stringFromDate: detaildate];
    return currentDateStr;
}
+ (NSString *)getTomorrowDay:(NSDate *)aDate
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:aDate];
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateday stringFromDate:beginningOfWeek];
}
@end
