//
//  MovieCardTableViewCell.m
//  Case
//
//  Created by 栗子 on 2018/3/28.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "MovieCardTableViewCell.h"
#import "NewPagedFlowView.h"
#import "PGCustomBannerView.h"

@interface MovieCardTableViewCell()<NewPagedFlowViewDelegate,NewPagedFlowViewDataSource>

/**
 *  图片数组
 */
//@property (nonatomic, strong) NSMutableArray *imageArray;

/**
 *  指示label
 */
@property (nonatomic, strong) UILabel *indicateLabel;

/**
 *  轮播图
 */
@property (nonatomic, strong) NewPagedFlowView *pageFlowView;


@end

@implementation MovieCardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}
-(void)setupUI{
    
    NewPagedFlowView *pageFlowView = [[NewPagedFlowView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_WIDTH * 9 / 16)];
    pageFlowView.backgroundColor = [UIColor whiteColor];
    pageFlowView.delegate = self;
    pageFlowView.dataSource = self;
    pageFlowView.minimumPageAlpha = 0.4;
    
    //#warning 假设产品需求左右卡片间距30,底部对齐
    pageFlowView.leftRightMargin = 30;
    pageFlowView.topBottomMargin = 0;
    
    pageFlowView.orginPageCount = self.imageArray.count;
    pageFlowView.isOpenAutoScroll = YES;
    
    //初始化pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, (SCREEN_WIDTH * 9 / 16) - 40, SCREEN_WIDTH, 8)];
    pageFlowView.pageControl = pageControl;
    [pageFlowView addSubview:pageControl];
    pageControl.pageIndicatorTintColor = [UIColor greenColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [pageFlowView reloadData];
    [self.contentView addSubview:pageFlowView];
    self.pageFlowView = pageFlowView;
    
}
#pragma mark --NewPagedFlowView Delegate
- (void)didSelectCell:(UIView *)subView withSubViewIndex:(NSInteger)subIndex {
    
    NSLog(@"点击了第%ld张图",(long)subIndex + 1);
    
    self.indicateLabel.text = [NSString stringWithFormat:@"点击了第%ld张图",(long)subIndex + 1];
}

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(NewPagedFlowView *)flowView {
    
    NSLog(@"CustomViewController 滚动到了第%ld页",pageNumber);
}

//#warning 假设产品需求左右中间页显示大小为 Width - 50, (Width - 50) * 9 / 16
- (CGSize)sizeForPageInFlowView:(NewPagedFlowView *)flowView {
    return CGSizeMake(SCREEN_WIDTH - 50, (SCREEN_WIDTH - 50) * 9 / 16);
}

#pragma mark --NewPagedFlowView Datasource
- (NSInteger)numberOfPagesInFlowView:(NewPagedFlowView *)flowView {
    
    return self.imageArray.count;
}

- (PGIndexBannerSubiew *)flowView:(NewPagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    
    PGCustomBannerView *bannerView = (PGCustomBannerView *)[flowView dequeueReusableCell];
    if (!bannerView) {
        bannerView = [[PGCustomBannerView alloc] init];
        bannerView.layer.cornerRadius = 4;
        bannerView.layer.masksToBounds = YES;
    }
    
    //在这里下载网络图片
    //[bannerView.mainImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:hostUrlsImg,imageDict[@"img"]]] placeholderImage:[UIImage imageNamed:@""]];
    
    bannerView.mainImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imageArray[index]]];
    bannerView.indexLabel.text = [NSString stringWithFormat:@"第%ld张图",(long)index + 1];
    return bannerView;
}

//#pragma mark --懒加载
//- (NSMutableArray *)imageArray {
//    if (_imageArray == nil) {
//        _imageArray = [NSMutableArray array];
//    }
//    return _imageArray;
//}



#pragma mark --旋转屏幕改变newPageFlowView大小之后实现该方法
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id)coordinator {
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        [coordinator animateAlongsideTransition:^(id context) {
            [self.pageFlowView reloadData];
        } completion:NULL];
    }
}
-(void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    [self setupUI];
}


@end
