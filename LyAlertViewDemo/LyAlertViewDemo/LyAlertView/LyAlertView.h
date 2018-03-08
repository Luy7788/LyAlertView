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

-(instancetype)initWithTitile:(NSString *)title
                      Message:(NSString *)message
                   ClickBlock:(ClickActionBlock)block
                 ButtonTitles:(NSString *)buttonTitles, ... NS_REQUIRES_NIL_TERMINATION;

-(void)show;
-(void)dismiss;


@end
