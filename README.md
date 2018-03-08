# LyAlertView

```
/**
 初始化方法

 @param title 标题
 @param message 描述信息
 @param block 回调方法,返回按键的index和按键的titile
 @param buttonTitles 传进按键的各个标题
 @return instancetype
 */
-(instancetype)initWithTitile:(NSString *)title
                      Message:(NSString *)message
                   ClickBlock:(ClickActionBlock)block
                 ButtonTitles:(NSString *)buttonTitles, ... NS_REQUIRES_NIL_TERMINATION;

/**
 显示
 */
-(void)show;

/**
 隐藏
 */
-(void)dismiss;
```

demo

![image](https://github.com/Super-lying/LyAlertView/blob/master/Untitled.gif)
 
```

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
```
