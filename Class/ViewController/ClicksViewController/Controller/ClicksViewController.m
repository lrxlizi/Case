//
//  ClicksViewController.m
//  Case
//
//  Created by 栗子 on 2018/5/24.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/.  All rights reserved.
//

#import "ClicksViewController.h"
#import "CharactersView.h"

@interface ClicksViewController ()
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) CharactersView *charactersView;
@end

@implementation ClicksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClicekd:) forControlEvents:UIControlEventTouchUpInside];
    self.btn = btn;
    [btn setTitle:@"文字文字" forState:(UIControlStateNormal)];
    btn.titleLabel.backgroundColor = [UIColor whiteColor];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.titleLabel.numberOfLines = 0;
    btn.titleLabel.font =[UIFont boldSystemFontOfSize:16];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.titleLabel.transform = CGAffineTransformMakeRotation(-M_PI_4);
    
    
    UILabel *textLB = [[UILabel alloc]initWithFrame:CGRectMake(100, 220, 30, 200)];
    [self.view addSubview:textLB];
    textLB.font = [UIFont boldSystemFontOfSize:16];
    textLB.backgroundColor = [UIColor greenColor];
    textLB.textColor = [UIColor whiteColor];
    textLB.text = @"朝阳区百子湾广渠路";
    textLB.numberOfLines = 0;
    textLB.textAlignment = NSTextAlignmentCenter;
    textLB.transform = CGAffineTransformMakeRotation(-M_PI_4);
    self.automaticallyAdjustsScrollViewInsets = NO;

}

- (void)btnClicekd:(UIButton *)btn{
    
    CharactersView *view = [[CharactersView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 400) selectCount:4 charactersarr:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25"]];
    [self.view addSubview:view];
    self.charactersView = view;
    __weak __typeof(self)weakSelf = self;
    view.chararctersViewSuccessfulMatches = ^{
        [weakSelf.charactersView removeFromSuperview];
    };
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
