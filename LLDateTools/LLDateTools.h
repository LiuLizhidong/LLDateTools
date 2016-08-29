//
//  LLDateTools.h
//  LLDateToolsDemo
//
//  Created by 刘李治东 on 16/2/3.
//  Copyright © 2016年 刘李治东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLDateTools : NSObject

+ (instancetype)sharedTools;

// 转Unix时间戳字符串
NSString* formatUnixTime(NSDate* date);
// 转Unix时间
NSNumber* toUnixTime(NSDate *date);
// 是否为今天
BOOL isToday(NSDate* time);
// 是否闰年
BOOL isLeapYear(NSInteger year);
// 指定月份天数（传入年月值）
NSInteger daysOfMonth(NSInteger month, NSInteger year);
// 指定日期当月天数（传入NSDate）
NSInteger daysOfMonthFromTime(NSDate* time);


// 转换本地时间
+ (NSDate *)locationTime:(NSDate *)today;
// 获取今日零点时间
+ (NSDate *)zeroToday:(NSDate *)today;
// 获取今日周几
+ (NSString*)weekdayStringWithDate:(NSDate *)today;
// 获取月份
+ (int)getMonthFromDate:(NSDate *)date;
// 获取今日年月日
+ (NSString *)monthDayStringWithDate:(NSDate *)today;
// 获取星座
+ (NSString *)getXingzuo:(NSDate *)date;

@end
