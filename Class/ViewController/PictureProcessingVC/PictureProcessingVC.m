//
//  PictureProcessingVC.m
//  Case
//
//  Created by 栗子 on 2018/6/26.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "PictureProcessingVC.h"

@interface PictureProcessingVC ()

@property (weak, nonatomic) IBOutlet UIImageView *originalImg;

@property (weak, nonatomic) IBOutlet UIButton *grayBtn;

@property (weak, nonatomic) IBOutlet UIButton *oldBtn;

@property (weak, nonatomic) IBOutlet UIImageView *changImg;


@end

@implementation PictureProcessingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)grayBtn:(id)sender {
    
    UIImage *original = self.originalImg.image;
    UIImage *gray     = [ToolClass grayImage:original];
    self.changImg.image = gray;
    
    
}

- (IBAction)oldBtn:(id)sender {
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
