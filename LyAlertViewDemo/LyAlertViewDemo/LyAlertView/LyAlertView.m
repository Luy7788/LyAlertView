//
//  LyAlertView.m
//  LyAlertViewDemo
//
//  Created by Lying on 2017/8/7.
//  Copyright © 2017年 Lying. All rights reserved.
//
#define TITLE_FONTSIZE      18
#define MESSAGE_FONTSIZE    14
#define BUTTON_FONTSIZE     15
#define MARGIN_LEFT_RIGHT   25
#define MARGIN_TOP_BOTTOM   40

#define DEFAULT_THEMECOLOR  RGBA(103,208,189,1)

#define RGBA(R, G, B, A) [UIColor colorWithRed:R / 255.0 green:G / 255.0 blue:B / 255.0 alpha:A]

#import <Masonry.h>
#import "LyAlertView.h"

@interface LyAlertView ()
@property (strong, nonatomic) NSMutableArray        *buttonTitleArray;
@property (strong, nonatomic) NSString              *title;
@property (strong, nonatomic) NSString              *message;
@property (strong, nonatomic) UIView                *backgroundView;
@property (nonatomic ,  copy) ClickActionBlock      block;

@property (strong, nonatomic) NSArray *masonryArr;
@property (strong, nonatomic) NSArray *removeMasonryArr;
@end

@implementation LyAlertView

-(instancetype)initWithTitile:(NSString *)title
              Message:(NSString *)message
           ClickBlock:(ClickActionBlock)block
         ButtonTitles:(NSString *)buttonTitles, ... NS_REQUIRES_NIL_TERMINATION{
    if(self = [super init]){
        self.frame = [UIApplication sharedApplication].keyWindow.bounds;
        self.title = title;
        self.message = message;
        self.block = block;
        self.buttonTitleArray = [NSMutableArray array];
        va_list args;
        va_start(args, buttonTitles);
        if (buttonTitles){
            [self.buttonTitleArray addObject:buttonTitles];
            while (1){
                NSString *  otherButtonTitle = va_arg(args, NSString *);
                if(otherButtonTitle == nil) {
                    break;
                } else {
                    [self.buttonTitleArray addObject:otherButtonTitle];
                }
            }
        }
        va_end(args);
        self.backgroundColor = [UIColor clearColor];
        self.backgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.backgroundView.backgroundColor = [UIColor blackColor];
        [self addSubview:self.backgroundView];
        [self initView];
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void)initView{
    self.backgroundView.alpha = 0.4f;
    UIView *contentView = [[UIView alloc]init];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 2.0f;
    self.contentView = contentView;
    [self addSubview:contentView];
    
    UIView *buttonContentView = [[UIView alloc]init];
    [contentView addSubview:buttonContentView];
    self.buttonArray = [NSMutableArray array];
    switch (self.buttonTitleArray.count) {
        case 1:{
            //一个按键的样式
            UIButton *rightButton = [[UIButton alloc]init];
            [buttonContentView addSubview:rightButton];
            NSString *buttonTitle = self.buttonTitleArray[0];
            [rightButton setTitle:buttonTitle forState:UIControlStateNormal];
            rightButton.tag = 0;
            rightButton.backgroundColor = [UIColor clearColor];
            rightButton.layer.borderWidth = 0.5f;
            rightButton.layer.borderColor = DEFAULT_THEMECOLOR.CGColor;
            [rightButton setTitleColor:DEFAULT_THEMECOLOR forState:UIControlStateNormal];
            [rightButton.titleLabel setFont:[UIFont systemFontOfSize:BUTTON_FONTSIZE]];
            [rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@32);
                make.bottom.equalTo(buttonContentView).offset(-10);
                make.right.equalTo(buttonContentView).offset(-10);
                make.width.equalTo(@84);
            }];
            [self.buttonArray addObject:rightButton];
            [buttonContentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@44);
                make.bottom.left.right.equalTo(contentView);
            }];
        }
            break;
        case 2:{ //两个按键的样式
            UIButton *leftButton = [[UIButton alloc]init];
            [buttonContentView addSubview:leftButton];
            [leftButton setTitle:self.buttonTitleArray[0] forState:UIControlStateNormal];
            [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(buttonContentView).offset(10);
                make.height.equalTo(@32);
                make.bottom.equalTo(buttonContentView).offset(-10);
            }];
            leftButton.layer.borderWidth = 0.5f;
            leftButton.layer.borderColor = [UIColor blackColor].CGColor;
            [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [leftButton.titleLabel setFont:[UIFont systemFontOfSize:BUTTON_FONTSIZE]];
            leftButton.tag = 0;
            [leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            UIButton *rightButton = [[UIButton alloc]init];
            [buttonContentView addSubview:rightButton];
            [rightButton setTitle:self.buttonTitleArray[1] forState:UIControlStateNormal];
            [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(leftButton.mas_right).offset(10);
                make.height.equalTo(@32);
                make.bottom.equalTo(buttonContentView).offset(-10);
                make.right.equalTo(buttonContentView).offset(-10);
                make.width.equalTo(leftButton);
            }];
            rightButton.backgroundColor = DEFAULT_THEMECOLOR;
            [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [rightButton.titleLabel setFont:[UIFont systemFontOfSize:BUTTON_FONTSIZE]];
            rightButton.tag = 1;
            [rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.buttonArray addObject:leftButton];
            [self.buttonArray addObject:rightButton];
            [buttonContentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@44);
                make.bottom.left.right.equalTo(contentView);
            }];
        }
            break;
        default:{
            for (int i=0; i<self.buttonTitleArray.count; i++) {
                
            }
        }
            break;
    }
    
    //标题
    UILabel *titleLable = [[UILabel alloc]init];
    titleLable.text = self.title;
    titleLable.font = [UIFont systemFontOfSize:TITLE_FONTSIZE];
    titleLable.textColor = [UIColor blackColor];
    titleLable.numberOfLines = 0;
    titleLable.textAlignment = NSTextAlignmentCenter;
    self.titleLabel = titleLable;
    [contentView addSubview:titleLable];
    //描述
    if (self.message.length) {
        UILabel *messageLabel = [[UILabel alloc]init];
        messageLabel.text = self.message;
        messageLabel.font = [UIFont systemFontOfSize:MESSAGE_FONTSIZE];
        messageLabel.textColor= [UIColor darkGrayColor];
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        self.messageLabel = messageLabel;
        [contentView addSubview:messageLabel];
        
        [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(contentView);
            make.height.greaterThanOrEqualTo(@44);
        }];
        [messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(contentView);
            make.top.equalTo(titleLable.mas_bottom);
            make.bottom.equalTo(buttonContentView.mas_top);
            make.height.greaterThanOrEqualTo(@(180-44-44));
        }];
        self.masonryArr = [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(MARGIN_LEFT_RIGHT);
            make.center.equalTo(self);
            make.top.greaterThanOrEqualTo(self.mas_top).offset(MARGIN_TOP_BOTTOM);
            make.height.greaterThanOrEqualTo(@180);
        }];
    }else{
        [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(contentView);
            make.bottom.equalTo(buttonContentView.mas_top);
        }];
        self.masonryArr = [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(MARGIN_LEFT_RIGHT);
            make.height.greaterThanOrEqualTo(@180);
            make.center.equalTo(self);
        }];
    }
//    for (MASViewConstraint *constar in self.masonryArr) {
//        [constar uninstall];
//    }
//    self.removeMasonryArr = [contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(@50);
//        make.width.equalTo(@50);
//        make.center.equalTo(self);
//    }];
}

-(void)show{
    self.alpha = 1;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    NSArray *windowViews = [window subviews];
    if(windowViews && [windowViews count] > 0){
        UIView *subView = [windowViews objectAtIndex:[windowViews count]-1];
        for(UIView *aSubView in subView.subviews)
        {
            [aSubView.layer removeAllAnimations];
        }
        [subView addSubview:self];
    }
//    for (MASViewConstraint *constar in self.self.removeMasonryArr) {
//        [constar uninstall];
//    }
//    for (MASViewConstraint *constar in self.masonryArr) {
//        [constar install];
//    } 
//    [UIView animateWithDuration:0.7 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:2 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        [self.contentView layoutIfNeeded];
//    } completion:^(BOOL finished) {
//    }];
    [self showAlertAnimation];
}

-(void)showAlertAnimation{
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.30;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.7, 0.7, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.06, 1.06, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [_contentView.layer addAnimation:animation forKey:nil];
}

-(void)dismiss{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)buttonClick:(UIButton *)sender{
    if (self.block) {
        self.block(self.buttonTitleArray[sender.tag]);
    }
    [self dismiss];
}

@end
