//
//  CharactersView.m
//  Case
//
//  Created by 栗子 on 2018/5/31.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "CharactersView.h"
#import "CharactersCollectionViewCell.h"
#import "CharactersModel.h"

@interface CharactersView()<UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger count;//填写文字个数
@property (nonatomic, strong) NSArray *charactersarr;//所有文字
@property (nonatomic, strong) UILabel *textLB;
@property(nonatomic,strong) NSMutableArray *saveTextLBArr;//保存填写文字的label
@property(nonatomic,strong) NSMutableArray *saveSelText;//保存选中的文字
@property(nonatomic,strong) NSMutableArray *saveSelStatusArr;//保存选中状态
@property (nonatomic, assign) BOOL isDeleteMiddle;//是否删除的是中间
@property (nonatomic, assign) NSInteger delteMiddleIndex;


@end

@implementation CharactersView

- (instancetype)initWithFrame:(CGRect)frame selectCount:(NSInteger)count charactersarr:(NSArray *)arr{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        self.saveTextLBArr = [NSMutableArray array];
        self.saveSelText  = [NSMutableArray array];
        self.saveSelStatusArr  = [NSMutableArray array];
        self.count = count;
        self.charactersarr = arr;
        for (int i=0; i<self.charactersarr.count; i++) {
            CharactersModel *model = [[CharactersModel alloc]init];
            model.isSelected = NO;
            [self.saveSelStatusArr addObject:model];
        }
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews{
    
    
    
    
    CGFloat WH = 30;
    CGFloat X  = 15;
    CGFloat starX = (SCREEN_WIDTH-((WH+X)*self.count))/2;
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
    cell.model = self.saveSelStatusArr[indexPath.row];
    return cell;
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CharactersModel *model = self.saveSelStatusArr[indexPath.row];
    model.isSelected = !model.isSelected;
    NSString *text = self.charactersarr[indexPath.row];
    if (!model.isSelected) {//删除选中的文字
        [self deleteSelectText:text];
    }else{//添加选中的文字
        if (self.isDeleteMiddle) {
            if (self.saveSelText.count) {
                [self.saveSelText replaceObjectAtIndex:self.delteMiddleIndex withObject:text];
            }else{
                 [self.saveSelText addObject:text];
            }
             self.isDeleteMiddle = NO;
            UILabel *label = self.saveTextLBArr[self.delteMiddleIndex];
            label.text = text;
        }else{
            [self.saveSelText addObject:text];
        }
    }
    if (self.saveSelText.count <= self.count) {//给label赋值
        for (int i=0; i<self.saveSelText.count; i++) {
            UILabel *label = self.saveTextLBArr[i];
            label.text = self.saveSelText[i];
        }
        if (self.saveSelText.count == self.count) {//判断是否匹配成功
            NSString *string = [self.saveSelText componentsJoinedByString:@""];//拼接成字符串用于对比
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (![string isEqualToString:@"1234"]) {//不成功
                        [self error:@"匹配失败!"];
                        [self unequal];
                  
                }else{//成功
                    if (self.chararctersViewSuccessfulMatches) {
                        self.chararctersViewSuccessfulMatches();
                    }
                }
            });
        }
        [self.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:indexPath.row inSection:indexPath.section]]];
        
    }
    
    
}

- (void)deleteSelectText:(NSString *)text{
    
    if ([self.saveSelText containsObject:text]) {
        NSInteger index = [self.saveSelText indexOfObject:text];
        UILabel *label = self.saveTextLBArr[index];
        label.text = @"";
    
        if (self.saveSelText.count <= 1) {//当选中的只有一个文字时(取消选中)
            [self.saveSelText removeAllObjects];
        }
        else{
            //中间的文字时
            self.isDeleteMiddle = YES;
           
            NSMutableArray *isSelCount = [NSMutableArray array];
            for (int i=0; i<self.saveSelStatusArr.count; i++) {
                CharactersModel *model = self.saveSelStatusArr[i];
                if (model.isSelected) {
                    [isSelCount addObject:@"1"];
                }
                
            }
            if (isSelCount.count) {
                [self.saveSelText replaceObjectAtIndex:index withObject:@""];
                self.delteMiddleIndex = index;
            }else{//把所选的都清除了
                NSLog(@"全清除");
                self.delteMiddleIndex = 0;//全部清空后再次选择时从0开始
                 [self.saveSelText removeAllObjects];
            }
        }
    }
}

//不相等
- (void)unequal{
    for (UILabel *lb in self.saveTextLBArr) {
        lb.text = @"";
    }
    [self.saveSelText removeAllObjects];
    [self selStatus];
    [self.collectionView reloadData];

}
//清除所有选中的cell
- (void)selStatus{
    
    for (int i=0; i<self.charactersarr.count; i++) {
        CharactersModel *model = self.saveSelStatusArr[i];
        if (model.isSelected) {
            model.isSelected = NO;
        }
        [self.saveSelStatusArr replaceObjectAtIndex:i withObject:model];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
    

}


- (void)error:(NSString *)text{
    ErrorView *error = [[ErrorView alloc]initCustomErrorTitle:text frame:CGRectMake((SCREEN_WIDTH - 120)/2, (SCREEN_HEIGHT - 50)/2, 120, 50)];
    [error show:YES];
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
