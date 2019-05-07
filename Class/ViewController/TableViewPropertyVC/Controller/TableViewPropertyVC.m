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
    [self writeCSVData];
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
- (void)writeCSVData{
    
    NSString* sourcePaht = [self createFile];
    NSLog(@"sourcePaht===%@",sourcePaht);
    NSFileHandle* fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:sourcePaht];
    //将节点调到文件末尾
    [fileHandle seekToEndOfFile];
    
    
    for(int i=0;i<6000;i++){
        NSString *str = @"某人的姓名,一个电话,一个地址,2017.02.20 11:30\n";
        str = [NSString stringWithFormat:@"%d%@",i,str];
        NSData *stringData = [str dataUsingEncoding:NSUTF8StringEncoding];
        //追加写入数据
        [fileHandle writeData:stringData];
    }
    
    
    [fileHandle closeFile];
    
}

-(NSString*)createFile{
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSArray* searchResult =  [fileManager URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask];
    
    NSLog(@"%@",searchResult);
    
    NSURL* documentPath = [searchResult firstObject];
    NSString* newPath = [documentPath.path stringByAppendingPathComponent:@"Demo"];
    if ([fileManager fileExistsAtPath:newPath] == false) {
        [fileManager createDirectoryAtPath:newPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString* filePath = [newPath stringByAppendingPathComponent:@"file.txt"];
    [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    
    return filePath;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
