//
//  MoveViewController.m
//  Case
//
//  Created by 栗子 on 2018/4/27.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "MoveViewController.h"

@interface MoveViewController ()

@property (nonatomic, strong) UIView *dot;

@property (nonatomic,strong) CAShapeLayer * polygonTop;


@end

@implementation MoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClicekd) forControlEvents:UIControlEventTouchUpInside];
    self.dot = [[UIView alloc]initWithFrame:CGRectMake(90, 90, 10, 10)];
    [self.view addSubview:self.dot];
    [ToolClass setViewRadius:self.dot radius:5 maskToBounds:YES];
    self.dot.backgroundColor = [UIColor greenColor];
    
    
    //六边形上边
    CAShapeLayer * polygonTop = [CAShapeLayer layer];
    polygonTop.frame = CGRectMake(0 ,0, 180, 180);
    polygonTop.path = [self middlePath].CGPath;
    [self.view.layer addSublayer:polygonTop];
    polygonTop.fillColor   = nil;
    polygonTop.strokeColor = [UIColor redColor].CGColor;
    polygonTop.lineWidth  = 2;
    self.polygonTop = polygonTop;
    
}
//六边形上边
- (UIBezierPath*)topPolygonPath{
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    // 起点
    [linePath moveToPoint:CGPointMake(90, 90)];
    // 其他点
    [linePath addLineToPoint:CGPointMake(90, 210)];
    [linePath addLineToPoint:CGPointMake(210, 210)];;
    return linePath;
}
-(void)btnClicekd{
    
    CAKeyframeAnimation *keyFrameAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAnim.values = @[[NSValue valueWithCGPoint:CGPointMake(90, 90)],[NSValue valueWithCGPoint:CGPointMake(210, 90)],[NSValue valueWithCGPoint:CGPointMake(210, 210)],[NSValue valueWithCGPoint:CGPointMake(90, 210)],[NSValue valueWithCGPoint:CGPointMake(90, 90)]];
    keyFrameAnim.duration = 5;
    keyFrameAnim.repeatCount = INFINITY;
    keyFrameAnim.removedOnCompletion = NO;
    keyFrameAnim.fillMode = kCAFillModeForwards;
    [self.dot.layer addAnimation:keyFrameAnim forKey:@"anim"];
    
}
- (UIBezierPath*)middlePath{
    
    UIBezierPath *middlePath = [UIBezierPath bezierPath];
    [middlePath moveToPoint:CGPointMake(41.314, 0)];
    [middlePath addCurveToPoint:CGPointMake(117.882, 56.746) controlPoint1:CGPointMake(77.409, 0) controlPoint2:CGPointMake(107.921, 23.904)];
    [middlePath addCurveToPoint:CGPointMake(92.206, 80) controlPoint1:CGPointMake(120.114, 64.104) controlPoint2:CGPointMake(115.776, 80.281)];
    [middlePath addLineToPoint:CGPointMake(0, 80)];
    [middlePath moveToPoint:CGPointMake(41.314, 0)];
    
    return middlePath;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
