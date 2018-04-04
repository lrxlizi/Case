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

}
@end
