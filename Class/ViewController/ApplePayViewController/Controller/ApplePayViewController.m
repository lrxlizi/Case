//
//  ApplePayViewController.m
//  Case
//
//  Created by 栗子 on 2018/4/12.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "ApplePayViewController.h"
#import <StoreKit/StoreKit.h>

@interface ApplePayViewController ()
@property (nonatomic,strong) TonePlayerSimple           *playerSimple;//声音单利

@end

@implementation ApplePayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.playerSimple = [TonePlayerSimple tonePlayer];
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    btn.backgroundColor = [UIColor redColor];
//    [self.view addSubview:btn];
//    [btn addTarget:self action:@selector(btnClicekd) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageV = [[UIImageView alloc]init];
    [self.view addSubview:imageV];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_offset(64);
        make.height.mas_offset(400);
    }];
    UIImage *image = [ToolClass compressOriginalImage:[UIImage imageNamed:@"3.jpg"] toSize:CGSizeMake(400, 400)];
//    imageV.image = [self addWaterImage:image toImage:image];
    imageV.image = [self waterMarkImage:image withText:@"快乐跑"];
    
}
- (UIImage *)waterMarkImage:(UIImage *)image withText:(NSString *)text{
    UIGraphicsBeginImageContext(image.size);
    
    //    在画布中绘制内容
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    //    绘制文字
    [[UIColor darkGrayColor] set];
    CGRect rect = CGRectMake(20, 0, image.size.width-40,30);
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    //
    paragraph.alignment = NSTextAlignmentRight;
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:30],NSParagraphStyleAttributeName :
                              paragraph,
                          NSForegroundColorAttributeName:[UIColor whiteColor]
                    };       //这里设置了字体，和倾斜度，具体其他参数文章结尾有详细说明的文章链接
    [text drawInRect:rect withAttributes:dic];
    // 从画布中得到image
    UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return returnImage;
}

-(UIImage *)addWaterImage:(UIImage *)waterImg toImage:(UIImage *)img{
    
    CGFloat height = img.size.height;
    CGFloat width = img.size.width;
    //开启一个图形上下文
    UIGraphicsBeginImageContext(img.size);
    
    //在图片上下文中绘制图片
    [img drawInRect:CGRectMake(0, 0,width,height)];

    //在图片指定位置绘制图片
    [waterImg drawInRect:CGRectMake(img.size.width-70, img.size.height-70, 50,50)];
    
    //从图形上下文拿到最终的图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图片上下文
    UIGraphicsEndImageContext();
    
    return newImg;
}

-(void)btnClicekd{
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"kee_waitting_for_u.mp3" withExtension:nil];
    [self.playerSimple playerUrl:url];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
