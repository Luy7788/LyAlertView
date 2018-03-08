//
//  LyAlertView.h
//  LyAlertViewDemo
//
//  Created by Lying on 2017/8/7.
//  Copyright © 2017年 Lying. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class LyAlertView; 
typedef void(^ClickActionBlock)(NSInteger ButtonTag,NSString *ButtonTitle);


@interface LyAlertView : UIView
@property (strong, nonatomic) UIView            *contentView;
@property (strong, nonatomic) UILabel           *titleLabel;
@property (strong, nonatomic) UILabel           *messageLabel;
@property (strong, nonatomic) NSMutableArray    *buttonArray;

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


@end
