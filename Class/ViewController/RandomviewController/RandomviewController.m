//
//  RandomviewController.m
//  Case
//
//  Created by 栗子 on 2018/7/11.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "RandomviewController.h"

@interface RandomviewController ()

@property (weak, nonatomic) IBOutlet UILabel *showLB;

@property (weak, nonatomic) IBOutlet UIButton *btn1;


@end

@implementation RandomviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
// 获取一个随机整数范围在：[0,100)包括0，不包括100
- (IBAction)btn1:(id)sender {
    int x = arc4random() % 100;
    self.showLB.text = [NSString stringWithFormat:@"%d",x];


}

//  获取一个随机数范围在：[500,1000），包括500，包括1000
- (IBAction)btn2:(id)sender {
    int y = (arc4random() % 501) + 500;
     self.showLB.text = [NSString stringWithFormat:@"%d",y];

}
//获取一个随机整数，范围在[from,to），包括from，包括to
- (IBAction)btn3:(id)sender {
    int a = [self getRandomNumber:3 to:6];
     self.showLB.text = [NSString stringWithFormat:@"%d",a];
    
    
}
-(int)getRandomNumber:(int)from to:(int)to

{
    
    return (int)(from + (arc4random() % (to - from+1)));
    
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
