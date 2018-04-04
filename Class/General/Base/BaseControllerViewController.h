//
//  BaseControllerViewController.h
//  Case
//
//  Created by 栗子 on 2018/3/26.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseControllerViewController : UIViewController<UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)  UICollectionViewFlowLayout *layout;
@property (nonatomic,strong)  UICollectionView           *collectionView;

@end
