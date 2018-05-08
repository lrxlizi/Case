//
//  BaseNavView.h
//  Case
//
//  Created by 栗子 on 2018/4/16.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavView : UIView

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIImage  *leftImage;

@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIImage  *rightImage;

@property (nonatomic, strong) UILabel  *nameLB;
@property (nonatomic,   copy) NSString *nameStr;

@property (nonatomic, copy)   void (^baseNavViewAction)(NSInteger index);

@end
