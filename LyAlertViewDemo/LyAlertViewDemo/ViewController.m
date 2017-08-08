//
//  ViewController.m
//  LyAlertViewDemo
//
//  Created by Lying on 2017/8/7.
//  Copyright © 2017年 Lying. All rights reserved.
//

#import "ViewController.h"
#import "LyAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn1:(id)sender {
    LyAlertView *alert = [[LyAlertView alloc]initWithTitile:@"一个按键的样式" Message:nil ClickBlock:^(NSString *ButtonTitle) {
        
    } ButtonTitles:@"我知道啦", nil];
    [alert show];
}
- (IBAction)btn2:(id)sender {
    LyAlertView *alert = [[LyAlertView alloc]initWithTitile:@"两个按键的样式" Message:@"啦啦啦，这是内容，啦啦啦" ClickBlock:^(NSString *ButtonTitle) {
        
    } ButtonTitles:@"取消", @"确定", nil];
    [alert show];
}
- (IBAction)btn3:(id)sender {
}

@end
