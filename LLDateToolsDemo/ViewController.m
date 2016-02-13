//
//  ViewController.m
//  LLDateToolsDemo
//
//  Created by 刘李治东 on 16/2/3.
//  Copyright © 2016年 刘李治东. All rights reserved.
//

#import "LLDateTools.h"
#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *logTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)locationTimeClicked:(id)sender {
    NSDate *now = [[LLDateTools sharedTools] locationTime:[NSDate date]];
    _logTextView.text = [NSString stringWithFormat:@"%@", now];
}

- (IBAction)zeroTimeClicked:(id)sender {
    NSDate *zero = [[LLDateTools sharedTools] zeroToday:[NSDate date]];
    _logTextView.text = [NSString stringWithFormat:@"%@", zero];
}

- (IBAction)getWeek:(id)sender {
    _logTextView.text = [[LLDateTools sharedTools] weekdayStringWithDate:[NSDate date]];
}

- (IBAction)getDetailsDate:(id)sender {
    _logTextView.text = [[LLDateTools sharedTools] monthDayStringWithDate:[NSDate date]];
}

- (IBAction)getConstellation:(id)sender {
    _logTextView.text = [[LLDateTools sharedTools] getXingzuo:[NSDate date]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
