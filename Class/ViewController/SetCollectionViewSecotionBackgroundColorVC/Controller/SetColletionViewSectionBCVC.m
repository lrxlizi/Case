//
//  SetColletionViewSectionBCVC.m
//  Case
//
//  Created by 栗子 on 2018/3/26.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "SetColletionViewSectionBCVC.h"
#import "JHCollectionViewFlowLayout.h"

@interface SetColletionViewSectionBCVC ()<JHCollectionViewDelegateFlowLayout>

@end

@implementation SetColletionViewSectionBCVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.name;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    JHCollectionViewFlowLayout *jhFlowLayout = [[JHCollectionViewFlowLayout alloc] init];
    self.collectionView.collectionViewLayout = jhFlowLayout;
     self.collectionView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 13;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark - JHCollectionViewDelegateFlowLayout
- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout backgroundColorForSection:(NSInteger)section
{
    //    return [@[
    //              [UIColor redColor],
    //              [UIColor greenColor],
    //              [UIColor yellowColor],
    //              [UIColor redColor],
    //              [UIColor greenColor],
    //              [UIColor yellowColor]
    //              ] objectAtIndex:section];
    if (section==0) {
        return [UIColor redColor];
    }else{
        return [UIColor cyanColor];
    }
    
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 30;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 30;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake(50, 50);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
@end
