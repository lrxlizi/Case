//
//  CharactersCollectionViewCell.h
//  Case
//
//  Created by 栗子 on 2018/5/31.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CharactersModel.h"

@interface CharactersCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *textLB;

@property (nonatomic, strong)CharactersModel *model;

@end
