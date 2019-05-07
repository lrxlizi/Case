//
//  ControlClass.m
//  Case
//
//  Created by 栗子 on 2018/6/11.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "ControlClass.h"

@implementation ControlClass
//设置圆角
+(void)setViewRadius:(UIView *)view radius:(CGFloat)ra maskToBounds:(BOOL)mask{
    view.layer.cornerRadius = ra;
    view.layer.masksToBounds = mask;
}

//设置圆角和边框
+(void)setViewRadiusAndBorder:(UIView *)view radius:(CGFloat)ra maskToBounds:(BOOL)mask borderColor:(UIColor *)color borderWidth:(CGFloat)width{
    view.layer.cornerRadius  = ra;
    view.layer.masksToBounds = mask;
    view.layer.borderColor   = color.CGColor;
    view.layer.borderWidth   = width;
}
//设置label属性
+(void)setLabelProperty:(UILabel *)label backgroundColor:(UIColor *)color textColor:(UIColor *)tColor textFont:(UIFont *)font textAlignment:(NSTextAlignment )alignment{
    label.backgroundColor = color;
    label.textColor       = tColor;
    label.font            = font;
    label.textAlignment   = alignment;
}

//button属性
+(void)setButtonProperty:(UIButton *)btn backgroundColor:(UIColor *)color title:(NSString *)titleStr  titleColor:(UIColor *)tColor titleFont:(UIFont *)font {
    btn.backgroundColor = color;
    [btn setTitle:titleStr forState:UIControlStateNormal];
    [btn setTitleColor:tColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
}

//设置view阴影
+(void)setViewShodow:(UIView *)view shadowColor:(UIColor *)sColor shadowOffset:(CGSize)sSize shadowRadius:(CGFloat)ra shadowOpacity:(float)opacity{
    view.layer.shadowColor = sColor.CGColor;
    view.layer.shadowOffset = sSize;
    view.layer.shadowRadius = ra;
    view.layer.shadowOpacity = opacity;
}
@end
