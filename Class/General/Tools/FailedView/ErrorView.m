//
//  ErrorView.m
//  SportChina
//
//  Created by 栗子 on 2017/8/3.
//  Copyright © 2017年 Beijing Sino Dance Culture Media Co.,Ltd. All rights reserved.
//

#import "ErrorView.h"

@interface ErrorView ()



@end

@implementation ErrorView

-(instancetype)initCustomErrorTitle:(NSString *)text  frame:(CGRect)frame{
    self =[super init];
    if (self) {

        self.backgroundColor=LColor(155, 155, 155);
        self.frame = frame;
//        self.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.5];
        self.layer.cornerRadius=5;
        self.layer.masksToBounds=YES;
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
        
        self.titleLB = [[UILabel alloc]init];
        [self addSubview:self.titleLB];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.top.mas_offset((self.frame.size.height-16*SCALEW)/2);
            make.right.mas_offset(-14);
            make.height.mas_offset(16*SCALEW);
        }];
        self.titleLB.text=text;
        self.titleLB.textColor=LColor(255, 255, 255);
        self.titleLB.font=[UIFont systemFontOfSize:16*SCALEW];
        self.titleLB.textAlignment=NSTextAlignmentLeft;
        self.titleLB.numberOfLines=0;
        
        
        
    }
    
    return self;


}
- (void)show:(BOOL)animated
{
    if (animated)
    {
        
        self.transform = CGAffineTransformMakeScale(0.6f , 0.6f);
        self.alpha = 0.0f;
        __weak typeof(self) weakSelf = self;
        
        [UIView animateWithDuration:0.2 animations:^{
            weakSelf.transform = CGAffineTransformIdentity;
            weakSelf.alpha = 1.0f;
        } completion:^(BOOL finished) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self hide:YES];
            });
            
            
        }];
    }
}
-(void)hide:(BOOL)animated{
    [self endEditing:YES];
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        weakSelf.transform = CGAffineTransformMakeScale(0.6f , 0.6f);
        weakSelf.alpha = 0;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
    
}
@end
