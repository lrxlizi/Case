//
//  ViewController.m
//  Case
//
//  Created by 栗子 on 2018/3/26.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "ViewController.h"
#import "SystemMapViewScroller.h"
#import "SetColletionViewSectionBCVC.h"
#import "FocusViewController.h"
#import "PickerViewController.h"
#import "CardViewController.h"
#import "TryMasonryViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *contentArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.contentArr           = @[@"仿苹果系统地图滑动",@"给collectionView每组设置不通的背景颜色",@"轮播卡片",@"pickerview",@"collectionVIew卡片",@"测试masonry"];
    
    UITableView *tableView     = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    tableView.delegate         = self;
    tableView.dataSource       = self;
    [self.view addSubview:tableView];
    tableView.backgroundColor  = [UIColor groupTableViewBackgroundColor];
    tableView.tableFooterView  = [UIView new];
  
   
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contentArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TABLEVIEW"];
    if (!cell) {
        cell              = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TABLEVIEW"];
    }
    cell.textLabel.text   = self.contentArr[indexPath
                                            .row];
    cell.selectionStyle   = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        [self btnClicekd];
    }else if(indexPath.row==1){
        SetColletionViewSectionBCVC *set = [SetColletionViewSectionBCVC new];
        set.name                         = self.contentArr[indexPath.row];
        [self.navigationController pushViewController:set animated:YES];
    }else if (indexPath.row==2){
        FocusViewController *focus = [FocusViewController new];
        [self.navigationController pushViewController:focus animated:YES];
    }else if (indexPath.row ==3){
        PickerViewController *picker = [PickerViewController new];
        [self.navigationController pushViewController:picker animated:YES];
    }else if (indexPath.row==4){
        CardViewController *card = [CardViewController new];
        [self.navigationController pushViewController:card animated:YES];
    }else if (indexPath.row==5){
        TryMasonryViewController *try = [TryMasonryViewController new];
        [self.navigationController pushViewController:try animated:YES];
    }
}

-(void)btnClicekd{
    
    SystemMapViewScroller *mapView = [[SystemMapViewScroller alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    mapView.systemMapBlock = ^{
        [LEEAlert closeWithCompletionBlock:nil];
    };
    [PopoutClass leeAleartCustomVIew:mapView customW:SCREEN_WIDTH customH:SCREEN_HEIGHT alearAlpha:0.6 positionType:(LEECustomViewPositionTypeCenter) openAnimationStyle:LEEAnimationStyleOrientationBottom | LEEAnimationStyleFade closeAnimationStyle:LEEAnimationStyleOrientationBottom | LEEAnimationStyleFade openAnimDuration:0.3 closeAnimDuration:0.3 clickBackgroundClose:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
