//
//  PickerViewController.m
//  Case
//
//  Created by 栗子 on 2018/3/28.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "PickerViewController.h"
#import "LZPickerView.h"
#import "LZBirthdayView.h"

@interface PickerViewController ()

@property(nonatomic, strong)LZPickerView *lzPickerView;

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"pickerView";
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"LZPickerView" owner:nil options:nil];
    self.lzPickerView  = views[0];
    
    
}

- (IBAction)sexBtn:(id)sender {
    UIButton *btn = (id)sender;
    NSString *text = btn.titleLabel.text;
    [self.lzPickerView lzPickerVIewType:LZPickerViewTypeSexAndHeight];
    self.lzPickerView.dataSource =@[@"男",@"女"];
    self.lzPickerView.titleText = @"性别";
    self.lzPickerView.selectDefault = text;
    self.lzPickerView.selectValue  = ^(NSString *value){
        [btn setTitle:value forState:UIControlStateNormal];
    };
    [self.lzPickerView show];
    
}
- (IBAction)systemSexBtn:(id)sender {
    
    [ToolClass UIAlertControllerStyle:(UIAlertControllerStyleActionSheet) title:nil message:nil actionsStyle:(UIAlertActionStyleDefault) actionTextArr:@[@"男",@"女"] otherActionStyle:(UIAlertActionStyleCancel) otherText:@"取消" actionsHandler:^(UIAlertAction *actions, NSString *text) {
        NSLog(@"点击了%@",text);
         UIButton *btn = (id)sender;
         [btn setTitle:text forState:UIControlStateNormal];
    } otherHandler:^(UIAlertAction *other) {
        NSLog(@"点击了取消");
    } viewController:self];
    
}

- (IBAction)weightBtn:(id)sender {
    UIButton *btn = (id)sender;
    NSString *text = btn.titleLabel.text;
    
    NSMutableArray *weightIntegerArr = [NSMutableArray array];
    NSMutableArray *weightDotArr = [NSMutableArray array];
    //体重整数部分
    for (int i=25; i<226; i++) {
        [weightIntegerArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    //体重小数部分
    for (int i=0; i<10; i++) {
        [weightDotArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [self.lzPickerView lzPickerVIewType:LZPickerViewTypeWeigth];
    self.lzPickerView.dataSource =@[weightIntegerArr,weightDotArr];
    self.lzPickerView.titleText = @"体重(kg)";
    self.lzPickerView.selectDefault = text;
    self.lzPickerView.selectValue  = ^(NSString *value){
        [btn setTitle:value forState:UIControlStateNormal];
    };
    [self.lzPickerView show];
}

- (IBAction)heightBtn:(id)sender {
    UIButton *btn = (id)sender;
    NSString *text = btn.titleLabel.text;
    NSString *content = [text stringByReplacingOccurrencesOfString:@"cm" withString:@""];
    NSMutableArray *heightArr = [NSMutableArray array];
    for (int i=25; i<229; i++) {
        [heightArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [self.lzPickerView lzPickerVIewType:LZPickerViewTypeSexAndHeight];
    self.lzPickerView.dataSource = heightArr;
    self.lzPickerView.titleText = @"身高(cm)";
    self.lzPickerView.selectDefault = content;
    self.lzPickerView.selectValue  = ^(NSString *value){
        [btn setTitle:[NSString stringWithFormat:@"%@cm",value] forState:UIControlStateNormal];
    };
    [self.lzPickerView show];
}
- (IBAction)birthday:(id)sender {
    
    UIButton *btn = (id)sender;
     LZBirthdayView *datesheet = [[LZBirthdayView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT)];
    if (![ToolClass isNullOrNilWithObject:btn.titleLabel.text]) {
         datesheet.selectDate = btn.titleLabel.text;
    }
    datesheet.GetSelectDate = ^(NSString *dateStr)
    {
        [btn setTitle:dateStr forState:UIControlStateNormal];
    };
    [[UIApplication sharedApplication].keyWindow addSubview:datesheet];

}

- (IBAction)tip:(id)sender {
    LZTipsView *tipVIew = [[LZTipsView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH , 36) textStr:@"hahah"];
    [self.view addSubview:tipVIew];
    [tipVIew show:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
