//
//  LZBirthdayView.h
//  Case
//
//  Created by 栗子 on 2018/3/30.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZBirthdayView : UIActionSheet

@property (nonatomic, copy) void(^GetSelectDate)(NSString *dateStr);

@property (nonatomic, strong) NSString * selectDate;
@end
