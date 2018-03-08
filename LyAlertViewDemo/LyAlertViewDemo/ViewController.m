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
    LyAlertView *alert = [[LyAlertView alloc]initWithTitile:@"一个按键的样式" Message:nil ClickBlock :^(NSInteger ButtonTag,NSString *ButtonTitle) {
        NSLog(@"点击了button->%zd, %@",ButtonTag,ButtonTitle);
    } ButtonTitles:@"我知道啦", nil];
    [alert show];
}
- (IBAction)btn2:(id)sender { 
    LyAlertView *alert = [[LyAlertView alloc]initWithTitile:@"两个按键的样式" Message:@"• XX用户可以通过短信群发功能给自己的粉丝或下单用户推送短信消息，也可以自由输入手机号进行推送；\n\n• 每个新注册用户均赠送50条免费短信；\n\n• 短信条数使用完毕之后可进行通过XXAPP内的短信充值页面进行充值；\n\n• 所购买的短信仅限在XXApp内发送使用；\n\n• 短信内容不得违反相关法律法规，XX官方对短信使用方式保留最终解释权" ClickBlock:^(NSInteger ButtonTag,NSString *ButtonTitle) {
        
        NSLog(@"点击了button->%zd, %@",ButtonTag,ButtonTitle);
    } ButtonTitles:@"取消", @"确定", nil];
    alert.messageLabel.textAlignment = NSTextAlignmentLeft;
    alert.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [alert show];
}
- (IBAction)btn3:(id)sender {
    LyAlertView *alert = [[LyAlertView alloc]initWithTitile:@"三个按键的样式" Message:@"啦啦啦，这是内容，啦啦啦" ClickBlock:^(NSInteger ButtonTag,NSString *ButtonTitle) {
        
        NSLog(@"点击了button->%zd, %@",ButtonTag,ButtonTitle);
    } ButtonTitles:@"取消1",@"取消2", @"确定", nil];
    [alert show];
}

@end
