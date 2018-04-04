//
//  ToolClass.m
//  Case
//
//  Created by 栗子 on 2018/3/26.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "ToolClass.h"

@implementation ToolClass

/*设置一个圆角
 适用于label imageView view
 [EncapsulationClass viewBeizerRect:imageView.bounds view:imageView corner:UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
 
 */
+(void)viewBeizerRect:(CGRect)rect view:(UIView *)view corner:(UIRectCorner)corner cornerRadii:(CGSize)radii{
    UIBezierPath  *maskPath= [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:radii];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame =view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
    
}
/*设置一个圆角
 适用于button
 
 */
+(void)ControlBeizerRect:(CGRect)rect Control:(UIControl *)Control  corner:(UIRectCorner)corner cornerRadii:(CGSize)radii{
    UIBezierPath  *maskPath= [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:radii];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame =Control.bounds;
    maskLayer.path = maskPath.CGPath;
    Control.layer.mask = maskLayer;
}
+(UIAlertController *)UIAlertControllerStyle:(UIAlertControllerStyle)style  title:(NSString *)titleStr message:(NSString *)messageStr  actionsStyle:(UIAlertActionStyle)actionsStyle  actionTextArr:(NSArray *)array otherActionStyle:(UIAlertActionStyle)otherStyle otherText:(NSString *)text actionsHandler:(void (^)(UIAlertAction * actions,NSString *text))handler  otherHandler:(void (^)(UIAlertAction * other))otherHandler viewController:(UIViewController *)vc{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:style];
    [alertController addAction:[UIAlertAction actionWithTitle:text style:otherStyle handler:^(UIAlertAction * _Nonnull action) {
        otherHandler(action);
    }]];
    for (NSInteger i=0; i<array.count; i++) {
        NSString *titleStr = [NSString stringWithFormat:@"%@",array[i]];
        [alertController addAction:[UIAlertAction actionWithTitle:titleStr style:actionsStyle handler:^(UIAlertAction * _Nonnull action) {
            handler(action,titleStr);
        }]];
    }
    [vc presentViewController:alertController animated:YES completion:nil];
    return alertController;
}

//设置毛玻璃效果
+(void)blurEffect:(UIView *)view{
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectVIew = [[UIVisualEffectView alloc]initWithEffect:effect];
    effectVIew.frame = view.bounds;
    [view addSubview:effectVIew];
    
}

//判断颜色是不是亮色
+(BOOL) isLightColor:(UIColor*)clr {
    CGFloat components[3];
    [ToolClass getRGBComponents:components forColor:clr];
    //        NSLog(@"%f %f %f", components[0], components[1], components[2]);
    
    CGFloat num = components[0] + components[1] + components[2];//rgb之和<382 是暗色  (255/2)*3
    if(num < 382)return NO;
    else return YES;
}



//获取RGB值
+ (void)getRGBComponents:(CGFloat [3])components forColor:(UIColor *)color {
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4];
    CGContextRef context = CGBitmapContextCreate(&resultingPixel,
                                                 1,
                                                 1,
                                                 8,
                                                 4,
                                                 rgbColorSpace,
                                                 bitmapInfo);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);
    
    for (int component = 0; component < 3; component++) {
        components[component] = resultingPixel[component];
    }
}
//获得某个范围内的屏幕图像
+ (UIImage *)imageFromView: (UIView *) theView   atFrame:(CGRect)r
{
    UIGraphicsBeginImageContext(theView.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    UIRectClip(r);
    [theView.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return  theImage;//[self getImageAreaFromImage:theImage atFrame:r];
}
//判断是否为空
+ (BOOL)isNullOrNilWithObject:(id)object;
{
    if (object == nil || [object isEqual:[NSNull null]]) {
        return YES;
    } else if ([object isKindOfClass:[NSString class]]) {
        if ([object isEqualToString:@""]||[object isEqualToString:@"(null)"]) {
            return YES;
        } else {
            return NO;
        }
    }
    else if ([object isKindOfClass:[NSNumber class]]) {
        if ([object isEqualToNumber:@0]) {
            return YES;
        } else {
            return NO;
        }
    }
    return NO;
}


@end
