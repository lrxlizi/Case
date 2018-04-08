//
//  MacroTestVIewController.m
//  Case
//
//  Created by 栗子 on 2018/4/4.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "MacroTestVIewController.h"

@interface MacroTestVIewController ()

@end

@implementation MacroTestVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *radView           = [[UIView alloc]init];
    [self.view addSubview:radView];
    [FrameClass masonryKnow_Left_Top_Width_Height:radView left:100 top:100 height:150 width:150];
    radView.backgroundColor = [UIColor redColor];
    [ToolClass setViewRadius:radView radius:20 maskToBounds:YES];



    UILabel *lab = [[UILabel alloc]init];
    [self.view addSubview:lab];
    [FrameClass masonryKnow_Left_Top_Width_Height:lab left:100 top:300 height:50 width:250];
    [ToolClass setLabelProperty:lab backgroundColor:[UIColor redColor] textColor:[UIColor whiteColor] textFont: [UIFont fontWithName:@"PingFangSC-Regular" size:18] textAlignment:NSTextAlignmentCenter];
    lab.text = @"NSTextAlignmentCenter";


    UIImageView *iv = [[UIImageView alloc]init];
    [self.view addSubview:iv];
    [FrameClass masonryKnow_left_width_height_topView:iv left:10 height:100 width:100 topVIew:lab topVIewBottom:30];
    [ToolClass setImageViewImg:iv imageUrl:@"http://o7ggkfdfb.bkt.clouddn.com/1dc17014-b30d-4203-8128-a47aae669cba_%E7%84%A6%E7%82%B9%E5%9B%BE1242X600.jpg"];
   
//    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(120, 120, 200, 200)];
//    [view1 setBackgroundColor:[UIColor grayColor]];//view1 设置为灰色
//    [self.view addSubview:view1];
//
//    //根据view1的大小变换后创建view2;
//    CGRect view2Rect=CGRectInset(view1.frame, 20, 20);
//    UIView *view2=[[UIView alloc]initWithFrame:view2Rect];
//    [view2 setBackgroundColor:[UIColor blueColor]];//view2 设置为蓝色
//    [self.view addSubview:view2];
    
    
//    NSString *str = @"北京森林公园";
//    NSLog(@"length===%@",[str substringFromIndex:str.length-2]);//length===公园
//    NSLog(@"to----%@",[str substringToIndex:3]);//to----北京森
//    NSLog(@"---%@",[str substringWithRange:NSMakeRange(0, 2)]);//---北京
    
    UIButton *btn = [[UIButton alloc]init];
    [self.view addSubview:btn];
    [FrameClass masonryKnow_left_width_height_topView:btn left:50 height:100 width:100 topVIew:iv topVIewBottom:30];
    [ToolClass setViewRadiusAndBorder:btn radius:10 maskToBounds:YES borderColor:[UIColor redColor] borderWidth:2];
    btn.backgroundColor = [UIColor yellowColor];
    
}
@end
