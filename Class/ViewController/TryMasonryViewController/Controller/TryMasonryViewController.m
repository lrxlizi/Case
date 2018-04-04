//
//  TryMasonryViewController.m
//  Case
//
//  Created by 栗子 on 2018/3/30.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "TryMasonryViewController.h"

@interface TryMasonryViewController ()

@end

@implementation TryMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *label = [[UILabel alloc]init];
    [self.view addSubview:label];
    [FrameClass masonryKnow_Left_Top_Width_Height:label left:10 top:64 height:50 width:150];
    label.text = @"左上宽高";
    label.backgroundColor = [UIColor redColor];

    UILabel *label2 = [[UILabel alloc]init];
    [self.view addSubview:label2];
     label2.text = @"上高右还有左侧视图";
    [FrameClass masonryKnow_right_top_height_leftView:label2 leftVIew:label right:15 top:64 height:50 leftVIewRight:150];
    label2.backgroundColor = [UIColor orangeColor];

    UILabel *label3 = [[UILabel alloc]init];
    [self.view addSubview:label3];
    label3.text = @"左 上视图 宽 高";
    [FrameClass masonryKnow_left_top_height_rightOrwidth_VIEW:label3 topVIew:label left:15 height:50 rigth_width:100 topVIewBottom:20 rightOrWidth:NO];
    label3.backgroundColor = [UIColor cyanColor];
 
    UILabel *label4 = [[UILabel alloc]init];
    [self.view addSubview:label4];
    label4.text = @"左 上视图 右 高";
    [FrameClass masonryKnow_left_top_height_rightOrwidth_VIEW:label4 topVIew:label3 left:15 height:50 rigth_width:15 topVIewBottom:20 rightOrWidth:YES];
    label4.backgroundColor = [UIColor cyanColor];

    UILabel *label5 = [[UILabel alloc]init];
    [self.view addSubview:label5];
    label5.text = @"右 高 宽 上视图";
    [FrameClass masonryKnow_right_width_height_topView:label5 right:15 height:50 width:100 topVIew:label4 topVIewBottom:20];
    label5.backgroundColor = [UIColor greenColor];

    
    UILabel *label6 = [[UILabel alloc]init];
    [self.view addSubview:label6];
    [FrameClass masonryKnow_left_TopVIew_height_RightView_VIEW:label6 rightVIew:label5 topVIew:label4 left:15  height:30 BViewLeft:10 topVBottom:20];
    label6.text = @"left_topVIew_height_rightVIew";
    label6.backgroundColor = [UIColor purpleColor];
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
