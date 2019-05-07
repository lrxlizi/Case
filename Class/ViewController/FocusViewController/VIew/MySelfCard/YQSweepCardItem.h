//
//  YQSweepCardItem.h
//  YQSweepCardView
//
//  Created by 栗子 on 2017/12/11.
// Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/     https://blog.csdn.net/qq_33608748.
//   All rights reserved.

//

#import <UIKit/UIKit.h>

@interface YQSweepCardItem : UIView
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLB;

@property (weak, nonatomic) IBOutlet UIImageView *numIV;
@property (weak, nonatomic) IBOutlet UILabel *numLB;
@property (weak, nonatomic) IBOutlet UIImageView *dateIV;
@property (weak, nonatomic) IBOutlet UILabel *dateLB;
@property (nonatomic, strong) UILabel *checkLB;



@end
