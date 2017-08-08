//
//  LyAlertView.h
//  LyAlertViewDemo
//
//  Created by Lying on 2017/8/7.
//  Copyright © 2017年 Lying. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LyAlertView;

typedef void(^ClickActionBlock)(NSString *ButtonTitle);

//@protocol LyAlertViewDelegate <NSObject>
//- (void)alertView:(LyAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
//@end

@interface LyAlertView : UIView
//@property (weak, nonatomic) id<LyAlertViewDelegate> delegate;
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
