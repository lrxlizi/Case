//
//  CustomButtonVC.m
//  Case
//
//  Created by 栗子 on 2018/6/11.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "CustomButtonVC.h"
#import "LZMenuButton.h"
#import <objc/runtime.h>

@interface CustomButtonVC ()<lzMenuDelegate>

@property (nonatomic, assign) NSInteger count;
@property(nonatomic,strong) NSMutableArray *saveSmallBtn;

@property (nonatomic,strong)LZMenuButton *menuBtn;

@end

@implementation CustomButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
 
    CGRect floatFrame = CGRectMake([UIScreen mainScreen].bounds.size.width - 100, [UIScreen mainScreen].bounds.size.height - 60 - 20, 60, 60);
    self.menuBtn = [[LZMenuButton alloc]initWithFrame:floatFrame normalImage:[UIImage imageNamed:@"plus"] andPressedImage:[UIImage imageNamed:@"cross"] withScrollview:nil effectImage:[UIImage imageNamed:@"7.jpg"] menuWidth:45];
    self.menuBtn.imageArray = @[@"fb-icon",@"twitter-icon",@"google-icon",@"linkedin-icon"];
    self.menuBtn.labelArray = @[@"Facebook",@"Twitter",@"Google Plus",@"Linked in"];
    self.menuBtn.hideWhileScrolling = NO;
    self.menuBtn.delegate = self;
    [self.view addSubview:self.menuBtn];
    
    
 
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    //添加#import <objc/runtime.h>
    NSMutableDictionary *nsDic = [[NSMutableDictionary alloc]init];
    [nsDic setObject:@"日记笔记" forKey:@"tagName"];
    [nsDic setObject:@"10103" forKey:@"tagId"];
    // 绑定数据源给button传参数
    objc_setAssociatedObject(btn, @"myBtn", nsDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [btn addTarget:self action:@selector(btnClicekd:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)btnClicekd:(UIButton *)btn{
    
    NSDictionary *dic = objc_getAssociatedObject(btn, @"myBtn");
    NSLog(@"dic=====%@",dic);
}


- (void)didSelectMenuOptionAtIndex:(NSInteger)row{
    NSLog(@"row===%ld",row);
}

- (void)btnClicked{
    if (self.count %2 ==0) {
        [self show];
    }else{
        [self hide];
    }
    self.count ++;
}

- (void)show{
    
    for (UIButton *btn in self.saveSmallBtn) {
        [UIView animateWithDuration:0.2 animations:^{
            btn.hidden = NO;
        }];
    }
    
}
- (void)hide{
    
    for (UIButton *btn in self.saveSmallBtn) {
        [UIView animateWithDuration:0.2 animations:^{
              btn.hidden = YES;
        }];
      
    }
}


@end
