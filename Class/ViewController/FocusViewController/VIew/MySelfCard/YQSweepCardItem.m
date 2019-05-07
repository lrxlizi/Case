//
//  YQSweepCardItem.m
//  YQSweepCardView
//
//  Created by 栗子 on 2017/12/11.
//  Created by 栗子 on 2018/7/5.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/     https://blog.csdn.net/qq_33608748. All rights reserved.
//

#import "YQSweepCardItem.h"

@implementation YQSweepCardItem

-(void)awakeFromNib{
    [super awakeFromNib];
   
    self.bgImageView.image = [UIImage imageNamed:@"myselfCard_3"];
    self.checkLB = [[UILabel alloc]init];
    [self addSubview:self.checkLB];
    [self.checkLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(54);
        make.width.mas_offset(100);
        make.height.mas_offset(35);
        make.centerX.equalTo(self.mas_centerX).offset(0);
    }];
    self.checkLB.textAlignment = NSTextAlignmentCenter;
    self.checkLB.text = @"查看更多";
    self.checkLB.font = [UIFont systemFontOfSize:14];
    self.checkLB.textColor = [UIColor whiteColor];
    self.checkLB.layer.cornerRadius = 17;
    self.checkLB.layer.masksToBounds = YES;
    self.checkLB.layer.borderColor = [UIColor whiteColor].CGColor;
    self.checkLB.layer.borderWidth = 1;
    
}

@end
