//
//  FrameClass.h
//  Case
//
//  Created by 栗子 on 2018/3/30.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//


/**masnory约束*/

#import <Foundation/Foundation.h>

@interface FrameClass : NSObject

/**
 left_top_width_height
 */
+(NSArray *)masonryKnow_Left_Top_Width_Height:(UIView *)view left:(CGFloat)l top:(CGFloat)t height:(CGFloat)h width:(CGFloat)w;

/**
 right_top_width_height
 */
+(NSArray *)masonryKnow_right_top_width_height:(UIView *)view right:(CGFloat)r top:(CGFloat)t height:(CGFloat)h width:(CGFloat)w;

/**
 right_width_height_topView
 */
+(NSArray *)masonryKnow_right_width_height_topView:(UIView *)view right:(CGFloat)r height:(CGFloat)h  width:(CGFloat)w  topVIew:(UIView *)tView topVIewBottom:(CGFloat)t;
/**
 left_width_height_topView
 */
+(NSArray *)masonryKnow_left_width_height_topView:(UIView *)view left:(CGFloat)l height:(CGFloat)h  width:(CGFloat)w  topVIew:(UIView *)tView topVIewBottom:(CGFloat)t;

/**
 left_rigth_top_height
 */
+(NSArray *)masonryKnow_left_right_top_height:(UIView *)view left:(CGFloat)l right:(CGFloat)r top:(CGFloat)t height:(CGFloat)h;

/**
 left_top_height_rightVIew
 */
+(NSArray *)masonryKnow_left_top_height_rightView:(UIView *)view  rightVIew:(UIView *)rv left:(CGFloat)l top:(CGFloat)t height:(CGFloat)h BViewLeft:(CGFloat)bf;

/**
 left_topView_height_rightvIew
 */
+(NSArray *)masonryKnow_left_TopVIew_height_RightView_VIEW:(UIView *)view  rightVIew:(UIView *)rv  topVIew:(UIView *)topV left:(CGFloat)l  height:(CGFloat)h BViewLeft:(CGFloat)bf topVBottom:(CGFloat)tb;

/**
 right_top_height_leftView
 */
+(NSArray *)masonryKnow_right_top_height_leftView:(UIView *)view  leftVIew:(UIView *)fv right:(CGFloat)r top:(CGFloat)t height:(CGFloat)h leftVIewRight:(CGFloat)rf;

/**
 left_hiehgt_topVIew_rightOrwidth
 yes:right no:width
 */
+(NSArray *)masonryKnow_left_top_height_rightOrwidth_VIEW:(UIView *)view topVIew:(UIView *)tv  left:(CGFloat)l height:(CGFloat)h rigth_width:(CGFloat)rw topVIewBottom:(CGFloat)tb rightOrWidth:(BOOL)rwb;

/**
 left _ right _ bottom _ height
 */

+(NSArray *)masnoryKnow_left_right_bottom_height:(UIView *)view left:(CGFloat)l right:(CGFloat)r bottom:(CGFloat)b height:(CGFloat)h;
/**
 left _ width _bottom _height
 */

+(NSArray *)masnoryKnow_left_right_bottom_height:(UIView *)view left:(CGFloat)l width:(CGFloat)w bottom:(CGFloat)b height:(CGFloat)h;
/**
 right_width_bottom_height
 */

+(NSArray *)masnoryKnow_right_width_bottom_height:(UIView *)view right:(UIView *)r width:(CGFloat)w bottom:(CGFloat)b height:(CGFloat)h;

/**
 left_right_bottom_topVIew
 */
+(NSArray *)masnoryKnow_eft_right_bottom_topView:(UIView *)view left:(CGFloat)l right:(CGFloat)r bottom:(CGFloat)b topVIew:(UIView *)tview topVBottom:(CGFloat)tb;

/**
 left_width_bottom_topVIew
 */
+(NSArray *)masnoryKnow_eft_right_bottom_topView:(UIView *)view left:(CGFloat)l width:(CGFloat)w bottom:(CGFloat)b topVIew:(UIView *)tview topVBottom:(CGFloat)tb;

/**
 right_width_bottom_topVIew
 */
+(NSArray *)masnoryKnow_eft_right_bottom_topView:(UIView *)view right:(CGFloat)r width:(CGFloat)w bottom:(CGFloat)b topVIew:(UIView *)tview topVBottom:(CGFloat)tb;

/**
 left_right_bottomVIew_height
 */
+(NSArray *)monaryKnow_left_right_bottomVIew_height:(UIView *)view bottomVIew:(UIView *)bView left:(CGFloat)l right:(CGFloat)r height:(CGFloat)h bottomVIewTop:(CGFloat)bt;

/**
 left_width_bottomVIew_height
 */
+(NSArray *)monaryKnow_width_right_bottomVIew_height:(UIView *)view bottomVIew:(UIView *)bView left:(CGFloat)l width:(CGFloat)w height:(CGFloat)h bottomVIewTop:(CGFloat)bt;

/**
 right_width_bottomVIew_height
 */
+(NSArray *)monaryKnow_right_right_bottomVIew_height:(UIView *)view bottomVIew:(UIView *)bView right:(CGFloat)r width:(CGFloat)w height:(CGFloat)h bottomVIewTop:(CGFloat)bt;
/**
 left_right_bottomView_topVIew
 */
+(NSArray *)masnoryKnow_left_right_bottomView_topView:(UIView *)view  left:(CGFloat)l right:(CGFloat)r bottom:(CGFloat)b topVIew:(UIView *)tview topVBottom:(CGFloat)tb bottomView:(UIView *)bView bottomTop:(CGFloat)bt;
/**
 left_width_bottomView_topVIew
 */
+(NSArray *)masnoryKnow_left_width_bottomView_topView:(UIView *)view  left:(CGFloat)l width:(CGFloat)w bottom:(CGFloat)b topVIew:(UIView *)tview topVBottom:(CGFloat)tb bottomView:(UIView *)bView bottomTop:(CGFloat)bt;

@end
