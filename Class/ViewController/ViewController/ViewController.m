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
#import "MacroTestVIewController.h"
#import "CompassViewController.h"
#import "ApplePayViewController.h"
#import "ImitateKeepViewController.h"
#import "MoveViewController.h"
#import "ClicksViewController.h"
#import "TableViewPropertyVC.h"
#import "CustomButtonVC.h"
#import "LeftDeleteViewController.h"
#import "PictureProcessingVC.h"
#import "RandomviewController.h"
#import "EncryptAndDecryptViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *contentArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.contentArr           = @[@"仿苹果系统地图滑动",@"给collectionView每组设置不通的背景颜色",@"轮播卡片",@"pickerview+弹框",@"collectionVIew卡片",@"测试masonry",@"类测试",@"磁力计 - 仿系统的指南针",@"ApplePay",@"模仿",@"move",@"clicks",@"TableViewPropertyVC",@"btn",@"LEFTDELETE",@"PictureProcessingVC",@"RandomviewController",@"EncryptAndDecrypt"];
    
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
    cell.textLabel.text   = self.contentArr[indexPath.row];
    cell.selectionStyle   = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        [self select];
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
    }else if (indexPath.row==6){
        MacroTestVIewController *macro = [MacroTestVIewController new];
        [self.navigationController pushViewController:macro animated:YES];
    }else if (indexPath.row==7){
        CompassViewController *compass = [CompassViewController new];
        [self.navigationController pushViewController:compass animated:YES];
    }else if (indexPath.row==8){
        ApplePayViewController *applePay = [[ApplePayViewController alloc]init];
        [self.navigationController pushViewController:applePay animated:YES];
    }else if (indexPath.row==9){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ImitateKeepViewController *imitateKeep = [storyboard instantiateViewControllerWithIdentifier:@"imitateKeepViewController"];
        [self.navigationController pushViewController:imitateKeep animated:YES];
    }else if (indexPath.row==10){
        MoveViewController *move = [MoveViewController new];
        [self.navigationController pushViewController:move animated:YES];
    }else if (indexPath.row == 11){
        ClicksViewController *clicks = [ClicksViewController new];
        [self.navigationController pushViewController:clicks animated:YES];
    }else if (indexPath.row == 12){
        TableViewPropertyVC *vc = [TableViewPropertyVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 13){
        CustomButtonVC *vc = [CustomButtonVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 14){
        LeftDeleteViewController *vc = [LeftDeleteViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 15){
        PictureProcessingVC *vc = [[PictureProcessingVC alloc]init];
         [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 16){
        RandomviewController *vc = [[RandomviewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        EncryptAndDecryptViewController *vc = [[EncryptAndDecryptViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
        
        
        
}

-(void)select{
    
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
