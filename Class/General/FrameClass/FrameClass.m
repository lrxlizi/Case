//
//  FrameClass.m
//  Case
//
//  Created by 栗子 on 2018/3/30.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "FrameClass.h"

@implementation FrameClass


/**
 left_top_width_height
 */
+(NSArray *)masonryKnow_Left_Top_Width_Height:(UIView *)view left:(CGFloat)l top:(CGFloat)t height:(CGFloat)h width:(CGFloat)w{
    
    NSArray *array =[NSArray arrayWithArray: [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(l);
        make.top.mas_offset(t);
        make.height.mas_offset(h);
        make.width.mas_offset(w);
    }]];
    return array;
}

/**
 right_top_width_height
 */
+(NSArray *)masonryKnow_right_top_width_height:(UIView *)view right:(CGFloat)r top:(CGFloat)t height:(CGFloat)h width:(CGFloat)w{
    NSArray *array =[NSArray arrayWithArray: [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-r);
        make.top.mas_offset(t);
        make.height.mas_offset(h);
        make.width.mas_offset(w);
    }]];
    return array;
}

/**
 right_width_height_topView
 */
+(NSArray *)masonryKnow_right_width_height_topView:(UIView *)view right:(CGFloat)r height:(CGFloat)h  width:(CGFloat)w  topVIew:(UIView *)tView topVIewBottom:(CGFloat)t {
    NSArray *array =[NSArray arrayWithArray: [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-r);
        make.top.equalTo(tView.mas_bottom).offset(t);
        make.height.mas_offset(h);
        make.width.mas_offset(w);
    }]];
    return array;
    
}
/**
 left_width_height_topView
 */
+(NSArray *)masonryKnow_left_width_height_topView:(UIView *)view left:(CGFloat)l height:(CGFloat)h  width:(CGFloat)w  topVIew:(UIView *)tView topVIewBottom:(CGFloat)t {
    NSArray *array =[NSArray arrayWithArray: [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(l);
        make.top.equalTo(tView.mas_bottom).offset(t);
        make.height.mas_offset(h);
        make.width.mas_offset(w);
    }]];
    return array;
    
}
/**
 left_rigth_top_height
 */
+(NSArray *)masonryKnow_left_right_top_height:(UIView *)view left:(CGFloat)l right:(CGFloat)r top:(CGFloat)t height:(CGFloat)h{
    NSArray *array =[NSArray arrayWithArray: [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(l);
        make.top.mas_offset(t);
        make.height.mas_offset(h);
        make.right.mas_offset(-r);
    }]];
    return array;
}

/**
 -------------        ----------
 |  view     | -->  |  rightView |
 ____________         __________
 
 */
//已知A左上高,右侧距离rightVIew左侧-3
/**
 left_top_height_rightVIew
 */
+(NSArray *)masonryKnow_left_top_height_rightView:(UIView *)view  rightVIew:(UIView *)rv left:(CGFloat)l top:(CGFloat)t height:(CGFloat)h BViewLeft:(CGFloat)bf{
    NSArray *array =[NSArray arrayWithArray: [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(l);
        make.top.mas_offset(t);
        make.height.mas_offset(h);
        make.right.equalTo(rv.mas_left).offset(-bf);
    }]];
    return array;
}

/**
 left_topView_height_rightvIew
 */
+(NSArray *)masonryKnow_left_TopVIew_height_RightView_VIEW:(UIView *)view  rightVIew:(UIView *)rv  topVIew:(UIView *)topV left:(CGFloat)l  height:(CGFloat)h BViewLeft:(CGFloat)bf topVBottom:(CGFloat)tb{
    NSArray *array =[NSArray arrayWithArray: [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(l);
        make.top.equalTo(topV.mas_bottom).offset(tb);
        make.height.mas_offset(h);
        make.right.equalTo(rv.mas_left).offset(-bf);
    }]];
    return array;
}
/**
 -------------        ----------
 |  leftVIew | <---- |   view   |
 ____________         __________
 
 */

/**
 right_top_height_leftView
 */
+(NSArray *)masonryKnow_right_top_height_leftView:(UIView *)view  leftVIew:(UIView *)fv right:(CGFloat)r top:(CGFloat)t height:(CGFloat)h leftVIewRight:(CGFloat)rf{
    NSArray *array =[NSArray arrayWithArray: [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(fv.mas_right).offset(rf);
        make.top.mas_offset(t);
        make.height.mas_offset(h);
        make.right.mas_offset(-r);
    }]];
    return array;
}

/**
 -----------
 | topVIew |
 __________
 |
 v
 ----------
 | view   |
 __________
 
 */

/**
 left_hiehgt_topVIew_rightOrwidth
 yes:right no:width
 */
+(NSArray *)masonryKnow_left_top_height_rightOrwidth_VIEW:(UIView *)view topVIew:(UIView *)tv  left:(CGFloat)l height:(CGFloat)h rigth_width:(CGFloat)rw topVIewBottom:(CGFloat)tb rightOrWidth:(BOOL)rwb{
    
    NSArray *array =[NSArray arrayWithArray: [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(l);
        make.height.mas_offset(h);
        make.top.equalTo(tv.mas_bottom).offset(tb);
        if (rwb==YES) {
            make.right.mas_offset(-rw);
        }else{
            make.width.mas_offset(rw);
        }
    }]];
    return array;
}

/**
 left _ right _ bottom _ height
 */
+(NSArray *)masnoryKnow_left_right_bottom_height:(UIView *)view left:(CGFloat)l right:(CGFloat)r bottom:(CGFloat)b height:(CGFloat)h{
    NSArray *array = [NSArray arrayWithArray:[view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(l);
        make.right.mas_offset(r);
        make.bottom.mas_offset(b);
        make.height.mas_offset(h);
    }]];
    return array;
}

/**
 left _ width _bottom _height
 */
+(NSArray *)masnoryKnow_left_right_bottom_height:(UIView *)view left:(CGFloat)l width:(CGFloat)w bottom:(CGFloat)b height:(CGFloat)h{
    NSArray *array = [NSArray arrayWithArray:[view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(l);
        make.width.mas_offset(w);
        make.bottom.mas_offset(b);
        make.height.mas_offset(h);
    }]];
    return array;
}
/**
 right_width_bottom_height
 */
+(NSArray *)masnoryKnow_right_width_bottom_height:(UIView *)view right:(UIView *)r width:(CGFloat)w bottom:(CGFloat)b height:(CGFloat)h{
    NSArray *array = [NSArray arrayWithArray:[view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(r);
        make.width.mas_offset(w);
        make.bottom.mas_offset(b);
        make.height.mas_offset(h);
    }]];
    return array;
}
/**
 left_right_bottom_topVIew
 */
+(NSArray *)masnoryKnow_eft_right_bottom_topView:(UIView *)view left:(CGFloat)l right:(CGFloat)r bottom:(CGFloat)b topVIew:(UIView *)tview topVBottom:(CGFloat)tb{
    NSArray *array = [NSArray arrayWithArray:[view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(r);
        make.left.mas_offset(l);
        make.bottom.mas_offset(b);
        make.top.equalTo(tview.mas_bottom).offset(tb);
    }]];
    return array;
}
/**
 left_width_bottom_topVIew
 */
+(NSArray *)masnoryKnow_eft_right_bottom_topView:(UIView *)view left:(CGFloat)l width:(CGFloat)w bottom:(CGFloat)b topVIew:(UIView *)tview topVBottom:(CGFloat)tb{
    NSArray *array = [NSArray arrayWithArray:[view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(w);
        make.left.mas_offset(l);
        make.bottom.mas_offset(b);
        make.top.equalTo(tview.mas_bottom).offset(tb);
    }]];
    return array;
}

/**
 right_width_bottom_topVIew
 */
+(NSArray *)masnoryKnow_eft_right_bottom_topView:(UIView *)view right:(CGFloat)r width:(CGFloat)w bottom:(CGFloat)b topVIew:(UIView *)tview topVBottom:(CGFloat)tb{
    NSArray *array = [NSArray arrayWithArray:[view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(w);
        make.right.mas_offset(r);
        make.bottom.mas_offset(b);
        make.top.equalTo(tview.mas_bottom).offset(tb);
    }]];
    return array;
}
/**
 left_right_bottomVIew_height
 */
+(NSArray *)monaryKnow_left_right_bottomVIew_height:(UIView *)view bottomVIew:(UIView *)bView left:(CGFloat)l right:(CGFloat)r height:(CGFloat)h bottomVIewTop:(CGFloat)bt{
    NSArray *array = [NSArray arrayWithArray:[view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(l);
        make.right.mas_offset(r);
        make.height.mas_offset(h);
        make.bottom.equalTo(bView.mas_bottom).offset(-bt);
    }]];
    return array;
}

/**
 left_width_bottomVIew_height
 */
+(NSArray *)monaryKnow_width_right_bottomVIew_height:(UIView *)view bottomVIew:(UIView *)bView left:(CGFloat)l width:(CGFloat)w height:(CGFloat)h bottomVIewTop:(CGFloat)bt{
    NSArray *array = [NSArray arrayWithArray:[view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(l);
        make.width.mas_offset(w);
        make.height.mas_offset(h);
        make.bottom.equalTo(bView.mas_bottom).offset(-bt);
    }]];
    return array;
}
/**
 right_width_bottomVIew_height
 */
+(NSArray *)monaryKnow_right_right_bottomVIew_height:(UIView *)view bottomVIew:(UIView *)bView right:(CGFloat)r width:(CGFloat)w height:(CGFloat)h bottomVIewTop:(CGFloat)bt{
    NSArray *array = [NSArray arrayWithArray:[view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(r);
        make.width.mas_offset(w);
        make.height.mas_offset(h);
        make.bottom.equalTo(bView.mas_bottom).offset(-bt);
    }]];
    return array;
}

/**
 left_right_bottomView_topVIew
 */
+(NSArray *)masnoryKnow_left_right_bottomView_topView:(UIView *)view  left:(CGFloat)l right:(CGFloat)r bottom:(CGFloat)b topVIew:(UIView *)tview topVBottom:(CGFloat)tb bottomView:(UIView *)bView bottomTop:(CGFloat)bt{
    NSArray *array = [NSArray arrayWithArray:[view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(r);
        make.left.mas_offset(l);
        make.bottom.equalTo(bView.mas_top).offset(-bt);
        make.top.equalTo(tview.mas_bottom).offset(tb);
    }]];
    return array;
}
/**
 left_width_bottomView_topVIew
 */
+(NSArray *)masnoryKnow_left_width_bottomView_topView:(UIView *)view  left:(CGFloat)l width:(CGFloat)w bottom:(CGFloat)b topVIew:(UIView *)tview topVBottom:(CGFloat)tb bottomView:(UIView *)bView bottomTop:(CGFloat)bt{
    NSArray *array = [NSArray arrayWithArray:[view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(w);
        make.left.mas_offset(l);
        make.bottom.equalTo(bView.mas_top).offset(-bt);
        make.top.equalTo(tview.mas_bottom).offset(tb);
    }]];
    return array;
}

/**
 right_width_bottomView_topVIew
 */
+(NSArray *)masnoryKnow_right_width_bottomView_topView:(UIView *)view  right:(CGFloat)r width:(CGFloat)w bottom:(CGFloat)b topVIew:(UIView *)tview topVBottom:(CGFloat)tb bottomView:(UIView *)bView bottomTop:(CGFloat)bt{
    NSArray *array = [NSArray arrayWithArray:[view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(w);
        make.right.mas_offset(r);
        make.bottom.equalTo(bView.mas_top).offset(-bt);
        make.top.equalTo(tview.mas_bottom).offset(tb);
    }]];
    return array;
}


@end
