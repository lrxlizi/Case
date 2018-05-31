//
//  CharactersCollectionViewCell.m
//  Case
//
//  Created by 栗子 on 2018/5/31.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "CharactersCollectionViewCell.h"

@implementation CharactersCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
        
    }
    return self;
    
}

- (void)createUI{
    
    self.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.3];
    self.textLB = [[UILabel alloc]init];
    [self addSubview:self.textLB];
    [self.textLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(2);
        make.right.mas_offset(-2);
        make.height.mas_offset(17);
        make.centerY.equalTo(self.mas_centerY).offset(0);
    }];
    self.textLB.textAlignment = NSTextAlignmentCenter;
    self.textLB.textColor = [UIColor whiteColor];
    
    
}
@end
