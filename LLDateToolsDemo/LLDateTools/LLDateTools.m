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
    [newComponents setDay:dateComponents.day];
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
    
    NSArray *weekdays = [NSArray arrayWithObjects:@"",@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
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

/**
 *  获取星座
 *
 *  @param date 输入时间
 *
 *  @return 星座字符串
 */
- (NSString *)getXingzuo:(NSDate *)date
{
    //计算星座
    NSString *retStr=@"";
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM"];
    int i_month=0;
    NSString *theMonth = [dateFormat stringFromDate:date];
    if([[theMonth substringToIndex:0] isEqualToString:@"0"]){
        i_month = [[theMonth substringFromIndex:1] intValue];
    }else{
        i_month = [theMonth intValue];
    }
    
    [dateFormat setDateFormat:@"dd"];
    int i_day=0;
    NSString *theDay = [dateFormat stringFromDate:date];
    if([[theDay substringToIndex:0] isEqualToString:@"0"]){
        i_day = [[theDay substringFromIndex:1] intValue];
    }else{
        i_day = [theDay intValue];
    }
    /*
     摩羯座 12月22日------1月19日
     水瓶座 1月20日-------2月18日
     双鱼座 2月19日-------3月20日
     白羊座 3月21日-------4月19日
     金牛座 4月20日-------5月20日
     双子座 5月21日-------6月21日
     巨蟹座 6月22日-------7月22日
     狮子座 7月23日-------8月22日
     处女座 8月23日-------9月22日
     天秤座 9月23日------10月23日
     天蝎座 10月24日-----11月21日
     射手座 11月22日-----12月21日
     */
    switch (i_month) {
        case 1:
            if(i_day>=20 && i_day<=31){
                retStr=@"水瓶座";
            }
            if(i_day>=1 && i_day<=19){
                retStr=@"摩羯座";
            }
            break;
        case 2:
            if(i_day>=1 && i_day<=18){
                retStr=@"水瓶座";
            }
            if(i_day>=19 && i_day<=31){
                retStr=@"双鱼座";
            }
            break;
        case 3:
            if(i_day>=1 && i_day<=20){
                retStr=@"双鱼座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"白羊座";
            }
            break;
        case 4:
            if(i_day>=1 && i_day<=19){
                retStr=@"白羊座";
            }
            if(i_day>=20 && i_day<=31){
                retStr=@"金牛座";
            }
            break;
        case 5:
            if(i_day>=1 && i_day<=20){
                retStr=@"金牛座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"双子座";
            }
            break;
        case 6:
            if(i_day>=1 && i_day<=21){
                retStr=@"双子座";
            }
            if(i_day>=22 && i_day<=31){
                retStr=@"巨蟹座";
            }
            break;
        case 7:
            if(i_day>=1 && i_day<=22){
                retStr=@"巨蟹座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"狮子座";
            }
            break;
        case 8:
            if(i_day>=1 && i_day<=22){
                retStr=@"狮子座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"处女座";
            }
            break;
        case 9:
            if(i_day>=1 && i_day<=22){
                retStr=@"处女座";
            }
            if(i_day>=23 && i_day<=31){
                retStr=@"天秤座";
            }
            break;
        case 10:
            if(i_day>=1 && i_day<=23){
                retStr=@"天秤座";
            }
            if(i_day>=24 && i_day<=31){
                retStr=@"天蝎座";
            }
            break;
        case 11:
            if(i_day>=1 && i_day<=21){
                retStr=@"天蝎座";
            }
            if(i_day>=22 && i_day<=31){
                retStr=@"射手座";
            }
            break;
        case 12:
            if(i_day>=1 && i_day<=21){
                retStr=@"射手座";
            }
            if(i_day>=21 && i_day<=31){
                retStr=@"摩羯座";
            }
            break;
    }
    return retStr;
}

@end
