//
//  LZTipsView.m
//  Case
//
//  Created by 栗子 on 2018/4/4.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "LZTipsView.h"

@interface LZTipsView ()

@property (nonatomic, strong) UILabel *contentLB;

@end

@implementation LZTipsView

-(instancetype)initWithFrame:(CGRect)frame textStr:(NSString *)text{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = RGBA(242, 65, 65, 0.9);
        self.contentLB = [[UILabel alloc]init];
        [self addSubview:self.contentLB];
        [self.contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.right.mas_offset(-15);
            make.height.mas_offset(14);
            make.centerY.equalTo(self.mas_centerY).offset(0);
        }];
        self.contentLB.text = text;
        self.contentLB.textColor = [UIColor whiteColor];
        self.contentLB.textAlignment = NSTextAlignmentCenter;
        self.contentLB.font = [UIFont systemFontOfSize:14];
        
    }
    return self;
}
- (void)show:(BOOL)animated{
    
    CGFloat Y = self.frame.origin.y;
    if (IS_IPHONE_X) {
        Y =  22 + self.frame.origin.y;
    }
    
    CGRect frame = self.frame;
    frame.origin.y = - self.frame.size.height;
    self.frame = frame;
    [UIView animateWithDuration:0.5f delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:0.5f options:0 animations:^{
        CGRect frame = self.frame;
        frame.origin.y = Y;
        self.frame = frame;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self hide:YES];
        });
    }];
}
- (void)hide:(BOOL)animated{
    CGRect frame = self.frame;
    frame.origin.y = 0;
    self.frame = frame;
    CGFloat Y = self.frame.size.height+self.frame.origin.y;
    if (IS_IPHONE_X) {
        Y = self.frame.size.height + 44+self.frame.origin.y;
    }
    [UIView animateWithDuration:1.0f delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:0.5f options:0 animations:^{
        CGRect frame = self.frame;
        frame.origin.y = - Y;
        self.frame = frame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
