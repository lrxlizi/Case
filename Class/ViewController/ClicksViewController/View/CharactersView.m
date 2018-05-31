//
//  CharactersView.m
//  Case
//
//  Created by 栗子 on 2018/5/31.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "CharactersView.h"
#import "CharactersCollectionViewCell.h"

@interface CharactersView()<UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger count;//填写文字个数
@property (nonatomic, strong) NSArray *charactersarr;//所有文字
@property (nonatomic, strong) UILabel *textLB;
@property(nonatomic,strong) NSMutableArray *saveTextLBArr;//保存填写文字的label
@property(nonatomic,strong) NSMutableArray *saveSelText;//保存选中的文字


@end

@implementation CharactersView

- (instancetype)initWithFrame:(CGRect)frame selectCount:(NSInteger)count charactersarr:(NSArray *)arr{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        self.saveTextLBArr = [NSMutableArray array];
        self.saveSelText  = [NSMutableArray array];
        self.count = count;
        self.charactersarr = arr;
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews{
    
    CGFloat WH = 30;
    CGFloat X  = 15;
    CGFloat starX = (SCREEN_WIDTH-((WH+X)*self.count))/2;
    NSLog(@"starX===%f",starX);
    for (int i=0; i<self.count; i++) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(starX+(WH+X)*i, 30, WH, WH)];
        label.layer.borderColor = [UIColor redColor].CGColor;
        label.layer.borderWidth = 1;
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        [self.saveTextLBArr addObject:label];
    }

    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(15, 80, SCREEN_WIDTH-30, 300) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[CharactersCollectionViewCell class] forCellWithReuseIdentifier:@"CELLID"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.charactersarr.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CharactersCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELLID" forIndexPath:indexPath];
    cell.textLB.text = self.charactersarr[indexPath.row];
    return cell;
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *text = self.charactersarr[indexPath.row];
    [self.saveSelText addObject:text];
    if (self.saveSelText.count <= self.count) {
        for (int i=0; i<self.saveSelText.count; i++) {
            UILabel *label = self.saveTextLBArr[self.saveSelText.count-1];
            label.text = self.saveSelText[i];
            
        }
        if (self.saveSelText.count == self.count) {
            NSLog(@"成功");
            NSString *string = [self.saveSelText componentsJoinedByString:@""];//拼接成字符串用于对比
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSLog(@"string====%@",string);
                if (![string isEqualToString:@"1234"]) {
                    for (UILabel *lb in self.saveTextLBArr) {
                        lb.text = @"";
                    }
                    [self.saveSelText removeAllObjects];
                }
            });
        }
    }
    
    
}


-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake(50, 50);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}




@end
