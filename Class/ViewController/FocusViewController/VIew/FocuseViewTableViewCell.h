//
//  FocuseViewTableViewCell.h
//  Case
//
//  Created by 栗子 on 2018/3/28.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"//自动轮播

@interface FocuseViewTableViewCell : UITableViewCell
@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic,strong) NSArray           *dataArr;
@property (nonatomic,strong) NSArray           *textArr;

@end
