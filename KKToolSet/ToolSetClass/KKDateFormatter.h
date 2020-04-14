//
//  KKDateFormatter.h
//  GCDDemo
//
//  Created by 李坤 on 2020/4/14.
//  Copyright © 2020 程强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKDateFormatter : NSObject
+ (NSString *)getCurrentTimeStamp;
+ (NSString *)getTimeStampByDate:(NSDate *)date;
+ (CGFloat)intervalFromStamp:(NSString *)stmp1 toStamp:(NSString *)stmp2;
+ (NSString *)dateToString:(NSDate *)date withFormatter:(NSString *)format;
+ (NSString *)timeStampToDateString:(NSString *)timeStamp withFormatter:(NSString *)format;
+ (NSString *)getTomorrowDay:(NSDate *)aDate;
@end

NS_ASSUME_NONNULL_END
