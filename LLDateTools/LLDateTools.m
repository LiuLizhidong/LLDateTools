//
//  LLDateTools.m
//  LLDateToolsDemo
//
//  Created by 刘李治东 on 16/2/3.
//  Copyright © 2016年 刘李治东. All rights reserved.
//

#import "LLDateTools.h"

@implementation LLDateTools

+ (instancetype)sharedTools {
    static id instance;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        if (!instance) {
            instance = [[self alloc] init];
        }
    });
    return instance;
}

/**
 *  获取本地时间
 *
 *  @param today 输入时间
 *
 *  @return 本地时间
 */
- (NSDate *)locationTime:(NSDate *)today {
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:today];
    NSDate *locationTime = [today dateByAddingTimeInterval:interval];
    return locationTime;
}

/**
 *  获取零点时间
 *
 *  @param today 输入时间
 *
 *  @return 零点时间
 */
- (NSDate *)zeroToday:(NSDate *)today {
    NSDate *now = [self locationTime:today];
    
    // 创建日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 获取时间详情
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitWeekday|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:now];
    // 更改时间详情
    NSDateComponents *newComponents = [[NSDateComponents alloc] init];
    [newComponents setYear:dateComponents.year];
    [newComponents setMonth:dateComponents.month];
    [newComponents setWeekday:dateComponents.weekday];
    [newComponents setDay:dateComponents.day-1];
    [newComponents setHour:0];
    [newComponents setMinute:0];
    [newComponents setSecond:0];
    // 返回新的时间
    NSDate *date = [calendar dateFromComponents:newComponents];
    // 本地化
    NSDate *newDate = [self locationTime:date];
    
    return newDate;
}

/**
 *  获取当前时间的星期
 *
 *  @param today 输入时间
 *
 *  @return 星期字符串
 */
- (NSString*)weekdayStringWithDate:(NSDate *)today {
    NSDate *now = [self locationTime:today];
    
    NSArray *weekdays = [NSArray arrayWithObjects:@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger unitFlags = kCFCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:unitFlags fromDate:now];
    
    return [weekdays objectAtIndex:theComponents.weekday];
}

/**
 *  获取年月日
 *
 *  @param today 输入时间
 *
 *  @return 返回年月日字符串
 */
- (NSString *)monthDayStringWithDate:(NSDate *)today {
    NSDate *now = [self locationTime:today];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger unitFlags = kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay;
    NSDateComponents *theComponents = [calendar components:unitFlags fromDate:now];
    
    NSInteger year = [theComponents year];
    NSInteger month = [theComponents month];
    NSInteger day = [theComponents day];
    
    NSString *dates = [NSString stringWithFormat:@"%ld年%ld月%ld日", year, month, day];
    return dates;
}


@end
