//
//  EncryptAndDecryptViewController.m
//  Case
//
//  Created by 栗子 on 2018/9/3.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "EncryptAndDecryptViewController.h"

@interface EncryptAndDecryptViewController ()

@property (nonatomic, copy)NSString *str;

@end

@implementation EncryptAndDecryptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    self.str = @"北京";
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClicekd) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnClicekd{
    
    NSString *encrypt = [ToolClass stringEncrypt_base64:self.str];
    NSLog(@"encrypt====%@",encrypt);
    NSLog(@"decrypt===%@",[ToolClass base4Decrypt_string:encrypt]);
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
