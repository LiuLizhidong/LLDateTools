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
// 转换本地时间
- (NSDate *)locationTime:(NSDate *)today;
// 获取今日零点时间
- (NSDate *)zeroToday:(NSDate *)today;
// 获取今日周几
- (NSString*)weekdayStringWithDate:(NSDate *)today;
// 获取今日年月日
- (NSString *)monthDayStringWithDate:(NSDate *)today;
// 获取星座
- (NSString *)getXingzuo:(NSDate *)date;

@end
