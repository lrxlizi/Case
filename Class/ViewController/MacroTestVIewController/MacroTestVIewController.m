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
    
    UIView *radView         = [[UIView alloc]init];
    [self.view addSubview:radView];
    [FrameClass masonryKnow_Left_Top_Width_Height:radView left:100 top:100 height:150 width:150];
    radView.backgroundColor = [UIColor redColor];
    
    

}
@end
