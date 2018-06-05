//
//  TableViewPropertyVC.m
//  Case
//
//  Created by 栗子 on 2018/6/4.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "TableViewPropertyVC.h"

@interface TableViewPropertyVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL        isChangeBig;
@property (nonatomic, assign) NSInteger   count;

@end

@implementation TableViewPropertyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"beginEnd" style:(UIBarButtonItemStylePlain) target:self action:@selector(rightTarget)];
    
    [self createUI];
    
}

- (void)createUI{
    
    self.tableView = [[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    self.tableView.tableFooterView = [UIView new];
    
    self.tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"7.jpg"]];
    UIBlurEffect*blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVibrancyEffect*vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    self.tableView.separatorEffect = vibrancyEffect;
    
   
}

- (void)rightTarget{
   
    if (self.count % 2 == 0) {
        self.isChangeBig = YES;
    }else{
        self.isChangeBig = NO;
    }
    self.count ++;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IDCELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"IDCELL"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        if (self.isChangeBig) {
            return 100;
        }else{
            return 50;
        }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
