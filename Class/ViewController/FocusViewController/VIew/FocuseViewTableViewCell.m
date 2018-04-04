//
//  FocuseViewTableViewCell.m
//  Case
//
//  Created by 栗子 on 2018/3/28.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "FocuseViewTableViewCell.h"

@interface FocuseViewTableViewCell() <SDCycleScrollViewDelegate>
@property (nonatomic, strong) NSArray          *imageArr;


@end

@implementation FocuseViewTableViewCell

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
        
        [self createUI];
    }
    return self;
}

-(void)createUI{
    self.backgroundColor = [UIColor whiteColor];
    
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) delegate:self placeholderImage:[UIImage imageNamed:@""]];
    _cycleScrollView.autoScrollTimeInterval = 3.0;// 自定义轮播时间间隔
    _cycleScrollView.currentPageDotColor = [UIColor redColor];
    _cycleScrollView.pageDotColor = [UIColor whiteColor];
    [self addSubview:_cycleScrollView];
}

-(void)setDataArr:(NSArray *)dataArr{
    _dataArr = dataArr;
    /**网络图片*/
//    NSMutableArray * array = [NSMutableArray array];
//    for (int i=0; i<dataArr.count; i++) {
//        NSString *imgUrl=[NSString stringWithFormat:@"%@",dataArr[i]];
//        [array addObject:imgUrl];
//    }
//    _imageArr = array;
//    _cycleScrollView.imageURLStringsGroup = _imageArr;

    _imageArr = dataArr;
    _cycleScrollView.localizationImageNamesGroup =_imageArr;
    
    
    
    
}

-(void)setTextArr:(NSArray *)textArr{
    _textArr = textArr;
    //设置文字
//    _cycleScrollView.titlesGroup = textArr;
}

#pragma mark  SDCycleScrollViewDelegate  轮播的点击事件
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    if (index < _imageArr.count)
    {

    }
}
/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    if (index < _imageArr.count)
    {
       
    }
    
}
@end
