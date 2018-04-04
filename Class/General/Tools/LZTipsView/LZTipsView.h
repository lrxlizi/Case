//
//  LZTipsView.h
//  Case
//
//  Created by 栗子 on 2018/4/4.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZTipsView : UIView
/*
 *从上边弹出的tip(红色背景)只有文字的
 */
-(instancetype)initWithFrame:(CGRect)frame textStr:(NSString *)text;
- (void)show:(BOOL)animated;//3后自动消失
- (void)hide:(BOOL)animated;


@end
