//
//  ImitateKeepViewController.m
//  Case
//
//  Created by 栗子 on 2018/4/16.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "ImitateKeepViewController.h"
#define SECOND 0.3
@interface ImitateKeepViewController ()<CAAnimationDelegate>

@property (nonatomic,strong)BaseNavView *navView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *flowerIV;

@property (nonatomic, strong) UIImageView *leftTop;
@property (nonatomic, strong) UIImageView *rightTop;
@property (nonatomic, strong) UIImageView *leftBottom;
@property (nonatomic, strong) UIImageView *rightBottom;
@property (nonatomic, strong) UIImageView *centerLeft;
@property (nonatomic, strong) UIImageView *centerRight;


@end

@implementation ImitateKeepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
    
//    UILabel *label  = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 300, 80)];
//    [self.view addSubview:label];
//    label.text      = @"1234";
//    label.textColor = [UIColor whiteColor];
//    label.font      = [UIFont systemFontOfSize:30];
//    self.label      = label;
 
//    self.flowerIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
//    self.flowerIV.center = self.view.center;
//    [self.view addSubview:self.flowerIV];
//    self.flowerIV.image = [UIImage imageNamed:@"flower"];
//    self.flowerIV.hidden = YES;
//
//    [self cretaImageVIew];
    [self sezier];
}
-(void)sezier{
    CAShapeLayer * polygon = [CAShapeLayer layer];
    polygon.frame = CGRectMake(0 ,0, 180, 180);
    polygon.path = [self polygonPath].CGPath;
    [self.view.layer addSublayer:polygon];
    polygon.fillColor   = [UIColor clearColor].CGColor;
    polygon.strokeColor = [UIColor redColor].CGColor;
}
- (UIBezierPath*)polygonPath{
    
    UIBezierPath *polygonPath = [UIBezierPath bezierPath];
    [polygonPath moveToPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2-90)];
    [polygonPath addLineToPoint:CGPointMake(SCREEN_WIDTH/2-90, SCREEN_HEIGHT/2-45)];
    [polygonPath addLineToPoint:CGPointMake(SCREEN_WIDTH/2-90, SCREEN_HEIGHT/2+45)];
    [polygonPath addLineToPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2+90)];
    [polygonPath addLineToPoint:CGPointMake(SCREEN_WIDTH/2+90,SCREEN_HEIGHT/2+45)];
    [polygonPath addLineToPoint:CGPointMake(SCREEN_WIDTH/2+90, SCREEN_HEIGHT/2-45)];
    [polygonPath closePath];
    [polygonPath moveToPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2-90)];
    
    return polygonPath;
}

-(void)cretaImageVIew{

    self.leftTop =  [[UIImageView alloc]initWithFrame:CGRectMake(50, 100, 150, 150)];
    [self.view addSubview:self.leftTop];
    self.leftTop.image = [UIImage imageNamed:@"r1"];
    self.leftTop.hidden = YES;
    
    self.rightTop =  [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, 80, 100, 200)];
    [self.view addSubview:self.rightTop];
    self.rightTop.image = [UIImage imageNamed:@"r2"];
    self.rightTop.hidden = YES;

    self.centerLeft =  [[UIImageView alloc]initWithFrame:CGRectMake(50, SCREEN_HEIGHT/2-100, 150, 50)];
    [self.view addSubview:self.centerLeft];
    self.centerLeft.image = [UIImage imageNamed:@"y2"];
    self.centerLeft.hidden = YES;
    
    self.leftBottom =  [[UIImageView alloc]initWithFrame:CGRectMake(50, SCREEN_HEIGHT/2-70, 130, 180)];
    [self.view addSubview:self.leftBottom];
    self.leftBottom.image = [UIImage imageNamed:@"r4"];
    self.leftBottom.hidden = YES;

    self.rightBottom =  [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2-50, 60, 180)];
    [self.view addSubview:self.rightBottom];
    self.rightBottom.image = [UIImage imageNamed:@"r3"];
    self.rightBottom.hidden = YES;
    
    self.centerRight =  [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2+30, SCREEN_HEIGHT/2-130, 150, 50)];
    [self.view addSubview:self.centerRight];
    self.centerRight.image = [UIImage imageNamed:@"y1"];
        self.centerRight.hidden = YES;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self beganAppearAnimation:self.label];
//    self.flowerIV.hidden = NO;
//
//    CAKeyframeAnimation *anim = [ToolClass smithereensBtnAnim:self.flowerIV];
//    [self.flowerIV.layer addAnimation:anim forKey:@"transform"];
    
    
    
    self.leftTop.hidden = NO;
    
    CAKeyframeAnimation *anim = [ToolClass moveAnimationStarPoint:self.leftTop.center endPoint:CGPointMake(0, 0)];
    anim.delegate = self;
    [anim setValue:@"1" forKey:@"anim1"];
    [self.leftTop.layer addAnimation:anim forKey:@"transform"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.02 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.rightTop.hidden = NO;
        CAKeyframeAnimation *anim2 = [ToolClass moveAnimationStarPoint:self.rightTop.center endPoint:CGPointMake(SCREEN_WIDTH, 80)];
        anim2.delegate = self;
        [anim2 setValue:@"2" forKey:@"anim2"];
        [self.rightTop.layer addAnimation:anim2 forKey:@"transform"];
        
        self.leftBottom.hidden = NO;
        CAKeyframeAnimation *anim3 = [ToolClass moveAnimationStarPoint:self.leftBottom.center endPoint:CGPointMake(0, SCREEN_HEIGHT-200)];
        anim3.delegate = self;
        [anim3 setValue:@"3" forKey:@"anim3"];
        [self.leftBottom.layer addAnimation:anim3 forKey:@"transform"];
        
        
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.04 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.centerRight.hidden = NO;
        self.centerLeft.hidden = NO;
        CAKeyframeAnimation *anim5 = [ToolClass moveAnimationStarPoint:self.centerLeft.center endPoint:CGPointMake(0, SCREEN_HEIGHT/2+50)];
        anim5.delegate = self;
        [anim5 setValue:@"5" forKey:@"anim5"];
        [self.centerLeft.layer addAnimation:anim5 forKey:@"transform"];
        CAKeyframeAnimation *anim6 = [ToolClass moveAnimationStarPoint:self.centerRight.center endPoint:CGPointMake(SCREEN_WIDTH,  SCREEN_HEIGHT/2-150)];
        anim6.delegate = self;
        [anim6 setValue:@"6" forKey:@"anim6"];
        [self.centerRight.layer addAnimation:anim6 forKey:@"transform"];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.rightBottom.hidden = NO;
        CAKeyframeAnimation *anim4 = [ToolClass moveAnimationStarPoint:self.rightBottom.center endPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT-80)];
        anim4.delegate = self;
        [anim4 setValue:@"4" forKey:@"anim4"];
        [self.rightBottom.layer addAnimation:anim4 forKey:@"transform"];
    });
    
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if ([anim valueForKey:@"anim1"]) {
        self.leftTop.hidden = YES;
    }else if ([anim valueForKey:@"anim2"]){
        self.rightTop.hidden = YES;
    }else if ([anim valueForKey:@"anim3"]){
        self.leftBottom.hidden = YES;
    }else if ([anim valueForKey:@"anim4"]){
        self.rightBottom.hidden = YES;
    }else if ([anim valueForKey:@"anim5"]){
        self.centerLeft.hidden = YES;
    }else if ([anim valueForKey:@"anim6"]){
        self.centerRight.hidden = YES;
    }
}



#pragma mark - 从下面到上
- (void)beganAppearAnimation:(UILabel *)label
{
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.repeatCount = 1;
    group.duration = SECOND;
    group.delegate = self;
    
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"position.y"];
    positionAnima.duration = SECOND;
    positionAnima.fromValue = @(label.center.y);
    positionAnima.toValue = @(label.center.y- 20);
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    positionAnima.repeatCount = 1;
    positionAnima.removedOnCompletion = NO;
    positionAnima.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = SECOND;
    opacityAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    opacityAnimation.fromValue = @(0.0);
    opacityAnimation.toValue = @(1.0);
    opacityAnimation.removedOnCompletion = NO;
    opacityAnimation.fillMode = kCAFillModeForwards;
    
    group.animations = @[positionAnima,opacityAnimation];
    [group setValue:@"beganAppearAnimation" forKey:@"animType"];
    [label.layer addAnimation:group forKey:@"labela"];
}

-(void)createUI{
    
    self.navView = [[BaseNavView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [self.view addSubview:self.navView];
    self.navView.leftImage  = [UIImage imageNamed:@"downback"];
    self.navView.rightImage = [UIImage imageNamed:@"share"];
     __weak __typeof(self)weakSelf = self;
    self.navView.baseNavViewAction = ^(NSInteger index) {
        if (index==0) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }else{
            
        }
    };
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:nil];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
        return UIStatusBarStyleLightContent;
//    return UIStatusBarStyleDefault;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
