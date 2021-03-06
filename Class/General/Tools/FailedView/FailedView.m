//
//  FailedView.m
//  SportChina
//
//  Created by 栗子 on 2017/7/13.
//  Copyright © 2017年 Beijing Sino Dance Culture Media Co.,Ltd. All rights reserved.
//

#import "FailedView.h"


@interface FailedView ()

@property(nonatomic,strong)UILabel *titleLB;

@property(nonatomic,strong)UILabel *contentLB;


@end


@implementation FailedView

-(instancetype)initCustomFailedTitle:(NSString *)text contentStr:(NSString *)content andTop:(float)top Alpha:(float)alpha{
    self =[super init];
    if (self) {
        //titleH
        CGFloat TitleH  = [ToolClass getStringHeight:text andFont:16*SCALEW andWidth: SCREEN_WIDTH-76*2-26*SCALEW];
        TitleH = [ToolClass isNullOrNilWithObject:text] ? 0 : TitleH;
        //contentH
        CGFloat contentH =[ToolClass getStringHeight:content andFont:14*SCALEW andWidth: SCREEN_WIDTH-76*2-26*SCALEW];
        //selfH
        CGFloat selfH   = 13*SCALEW + TitleH +4.5*SCALEW +contentH +13*SCALEW;
        self.frame = CGRectMake(76,top, SCREEN_WIDTH-76*2, selfH);
        self.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:alpha];
        self.layer.cornerRadius=5;
        self.layer.masksToBounds=YES;
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
       
        self.titleLB = [[UILabel alloc]init];
        [self addSubview:self.titleLB];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_offset(15);
            make.right.mas_offset(-15);
            make.height.mas_offset(TitleH);
        }];
        self.titleLB.text=text;
        self.titleLB.textColor=LColor(255, 255, 255);
        self.titleLB.font=[UIFont systemFontOfSize:16*SCALEW];
        self.titleLB.textAlignment=NSTextAlignmentCenter;
        self.titleLB.numberOfLines=0;
        
        
        self.contentLB = [[UILabel alloc]init];
        [self addSubview:self.contentLB];
        [self.contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.right.mas_offset(-15);
            make.top.equalTo(self.titleLB.mas_bottom).offset(4.5*SCALEW);
            make.height.mas_offset(contentH);
        }];
        self.contentLB.text=content;
        self.contentLB.textColor=RGBA(255, 255, 255, 0.8);
        self.contentLB.font=[UIFont systemFontOfSize:14*SCALEW];
        self.contentLB.textAlignment=NSTextAlignmentCenter;
        self.contentLB.numberOfLines=0;

        
        
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
    if (animated) {
        __weak typeof(self)weakSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.transform = CGAffineTransformMakeScale(0.6f , 0.6f);
            weakSelf.alpha = 0;
        } completion:^(BOOL finished) {
            [weakSelf removeFromSuperview];
        }];
    }else
    {
        __weak typeof(self)weakSelf = self;
        [UIView animateWithDuration:0.5 animations:^{
            weakSelf.alpha = 0;
        } completion:^(BOOL finished) {
            [weakSelf removeFromSuperview];
        }];
    }
}

-(instancetype)initFrame:(CGRect )frame contentText:(NSString *)text{
    self =[super init];
    if (self) {
        self.frame = frame;
        self.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.5];
        CGFloat TitleH  = [ToolClass getStringHeight:text andFont:20*SCALEW andWidth: SCREEN_WIDTH-76*2-26*SCALEW];
        self.titleLB = [[UILabel alloc]init];
        [self addSubview:self.titleLB];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset((self.frame.size.height-TitleH)/2-64);
            make.left.mas_offset(15);
            make.right.mas_offset(-14);
            make.height.mas_offset(TitleH);
        }];
        self.titleLB.text=text;
        self.titleLB.textColor=LColor(255, 255, 255);
        self.titleLB.font=[UIFont systemFontOfSize:20*SCALEW];
        self.titleLB.textAlignment=NSTextAlignmentCenter;
        self.titleLB.numberOfLines=0;
        
    }
    return self;
}

-(instancetype)initPicFrame:(CGRect )frame
{
    self =[super init];
    if (self) {
        self.frame = frame;
        self.backgroundColor = [UIColor blackColor];
        self.layer.cornerRadius=5;
        self.layer.masksToBounds=YES;
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
        
        self.titleLB = [[UILabel alloc]init];
        self.titleLB.backgroundColor = [UIColor clearColor];
        [self addSubview:self.titleLB];
        [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(15, 0, 15, 0));
        }];
        self.titleLB.textColor     = [UIColor whiteColor];
        self.titleLB.font          = [UIFont systemFontOfSize:14];
        self.titleLB.textAlignment = NSTextAlignmentCenter;
        self.titleLB.numberOfLines = 0;
        
        NSMutableAttributedString *attri =     [[NSMutableAttributedString alloc] initWithString:@"完成“必经点”打卡，可在终点处完成比赛"];
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        attch.image = [UIImage imageNamed:@"running_icon_content_normal_2"];
        attch.bounds = CGRectMake(0, 0, 15, 15);
        NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
        [attri insertAttributedString:string atIndex:6];
        self.titleLB.attributedText = attri;
    }
    return self;
}
-(instancetype)initCustomContentStr:(NSString *)content andTop:(float)top
{
    self =[super init];
    if (self) {
        CGFloat contentW = [ToolClass getStringWidth:content andFont:14.f];
        CGFloat contentH = 14.f;
        if (contentW > SCREEN_WIDTH - 100)
        {
            contentW = SCREEN_WIDTH - 100;
            contentH = [ToolClass getStringHeight:content andFont:14.f andWidth:contentW];
            
        }
        //selfH
        CGFloat selfH   = 26 + contentH;
        self.frame = CGRectMake((SCREEN_WIDTH - contentW - 70)/2,top, contentW + 70, selfH);
        self.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.5f];
        self.layer.cornerRadius=5;
        self.layer.masksToBounds=YES;
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
        self.contentLB = [[UILabel alloc]init];
        [self addSubview:self.contentLB];
        [self.contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(13, 30, 13, 30));
        }];
        self.contentLB.text=content;
        self.contentLB.textColor=RGBA(255, 255, 255, 0.8);
        self.contentLB.font=[UIFont systemFontOfSize:14.f];
        self.contentLB.textAlignment=NSTextAlignmentCenter;
        self.contentLB.numberOfLines=0;
        self.alpha = 0;
    }
    return self;
}
- (void)showDing:(BOOL)animated
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
        }];
    }else
    {
        self.alpha = 1.0f;
    }
}
@end
