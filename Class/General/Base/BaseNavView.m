//
//  BaseNavView.m
//  Case
//
//  Created by 栗子 on 2018/4/16.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "BaseNavView.h"

@implementation BaseNavView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self createUI];
    }
    return self;
}

-(void)createUI{
    
    self.leftBtn = [[UIButton alloc]init];
    [self addSubview:self.leftBtn];
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(25);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.left.mas_offset(15);
    }];
    [self.leftBtn addTarget:self action:@selector(leftBtnClicked) forControlEvents:UIControlEventTouchUpInside];
   
    
    self.rightBtn = [[UIButton alloc]init];
    [self addSubview:self.rightBtn];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(25);
         make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.right.mas_offset(-15);
    }];
    [self.rightBtn addTarget:self action:@selector(rightBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    
    self.nameLB = [[UILabel alloc]init];
    [self addSubview:self.nameLB];
    [self.nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftBtn.mas_right).offset(5);
        make.right.equalTo(self.rightBtn.mas_left).offset(-5);
         make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.height.mas_offset(17);
    }];
    [ToolClass setLabelProperty:self.nameLB backgroundColor:[UIColor clearColor] textColor:RGBA(51,51 , 51, 1) textFont:[UIFont systemFontOfSize:17] textAlignment:(NSTextAlignmentCenter)];
    
    
}

-(void)setLeftImage:(UIImage *)leftImage{
    _leftImage = leftImage;
     [self.leftBtn setImage:leftImage forState:UIControlStateNormal];
}
-(void)setRightImage:(UIImage *)rightImage{
    _rightImage = rightImage;
    [self.rightBtn setImage:rightImage forState:UIControlStateNormal];
}
-(void)setNameStr:(NSString *)nameStr{
    _nameStr = nameStr;
    self.nameLB.text = nameStr;
}

-(void)leftBtnClicked{
    if (self.baseNavViewAction) {
        self.baseNavViewAction(0);
    }
}
-(void)rightBtnClicked{
    if (self.baseNavViewAction) {
        self.baseNavViewAction(1);
    }
}
@end
