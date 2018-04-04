//
//  FocusViewController.m
//  Case
//
//  Created by 栗子 on 2018/3/27.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "FocusViewController.h"
#import "FocuseViewTableViewCell.h"
#import "MySelfCardCollectionViewCell.h"
#import "MovieCardTableViewCell.h"


@interface FocusViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray        *focuseArr;
@property (nonatomic, strong) NSMutableArray *cardArr;
@property (nonatomic, strong) UITableView    *tableVIew;


@end

@implementation FocusViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initData];
    
    UITableView *tableVIew    = [[UITableView alloc
                               ]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableVIew];
    tableVIew.dataSource      = self;
    tableVIew.delegate        = self;
    tableVIew.tableFooterView = [UIView new];
    self.tableVIew            = tableVIew;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        FocuseViewTableViewCell *focuse = [tableView dequeueReusableCellWithIdentifier:@"FocuseViewTableViewCell"];
        if (!focuse) {
            focuse = [[FocuseViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FocuseViewTableViewCell"];
        }
        focuse.selectionStyle = UITableViewCellSelectionStyleNone;
        focuse.dataArr = self.focuseArr ;
        focuse.textArr = self.focuseArr;
        return focuse;
    }else if (indexPath.section==1){
        MySelfCardCollectionViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MySelfCardCollectionViewCell"];
        if (!cell) {
            cell = [[MySelfCardCollectionViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MySelfCardCollectionViewCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.array          = self.cardArr;
        return cell;
    }else if(indexPath.section==2){
        MovieCardTableViewCell *movie = [tableView dequeueReusableCellWithIdentifier:@"MovieCardTableViewCell"];
        if (!movie) {
            movie = [[MovieCardTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MovieCardTableViewCell"];
        }
        movie.selectionStyle = UITableViewCellSelectionStyleNone;
        movie.imageArray = self.focuseArr;
        return movie;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==2) {
        return 230;
    }
    return 200;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    if (section==2) {
//        return 0;
//    }
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}
-(void)initData{
    self.focuseArr = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg",@"8.jpg"];
    self.cardArr   =  [NSMutableArray array];
    for (int i=0; i<3; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:[NSString stringWithFormat:@"myselfCard_%d",i] forKey:@"image"];
        [dic setObject:@"0" forKey:@"is_show"];
        [dic setObject:[NSString stringWithFormat:@"第%d张",i] forKey:@"title"];
        [dic setObject:[NSString stringWithFormat:@"编号%d",i] forKey:@"sn"];
        [dic setObject:[NSString stringWithFormat:@"time%d",i] forKey:@"act_time"];
        [dic setObject:@"icon_content_bianma" forKey:@"numImage"];
        [dic setObject:@"icon_content_date" forKey:@"dateImage"];
        [self.cardArr addObject:dic];
    }
    NSString *is_show =@"1";//显示查看更多
    if ([is_show intValue]==1) {
        NSMutableDictionary *dicMore = [NSMutableDictionary dictionary];
        [dicMore setObject:[NSString stringWithFormat:@"myselfCard_3"] forKey:@"image"];
        [dicMore setObject:@"1" forKey:@"is_show"];
        [dicMore setObject:@" " forKey:@"title"];
        [dicMore setObject:@" " forKey:@"sn"];
        [dicMore setObject:@" " forKey:@"act_time"];
        [dicMore setObject:@" " forKey:@"numImage"];
        [dicMore setObject:@" " forKey:@"dateImage"];
        [self.cardArr insertObject:dicMore atIndex:self.cardArr.count];
    }
    [ self.tableVIew reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
