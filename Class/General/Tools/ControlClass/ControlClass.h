//
//  ControlClass.h
//  Case
//
//  Created by 栗子 on 2018/6/11.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ControlClass : NSObject
//设置圆角
+(void)setViewRadius:(UIView *)view radius:(CGFloat)ra maskToBounds:(BOOL)mask;
//设置圆角和边框
+(void)setViewRadiusAndBorder:(UIView *)view radius:(CGFloat)ra maskToBounds:(BOOL)mask borderColor:(UIColor *)color borderWidth:(CGFloat)width;
//设置label属性
+(void)setLabelProperty:(UILabel *)label backgroundColor:(UIColor *)color textColor:(UIColor *)tColor textFont:(UIFont *)font textAlignment:(NSTextAlignment )alignment;
//设置view阴影
+(void)setViewShodow:(UIView *)view shadowColor:(UIColor *)sColor shadowOffset:(CGSize)sSize shadowRadius:(CGFloat)ra shadowOpacity:(float)opacity;
//button属性
+(void)setButtonProperty:(UIButton *)btn backgroundColor:(UIColor *)color title:(NSString *)titleStr  titleColor:(UIColor *)tColor titleFont:(UIFont *)font;
@end
