//
//  LZBirthdayView.m
//  Case
//
//  Created by 栗子 on 2018/3/30.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import "LZBirthdayView.h"

#import <UIKit/UIKit.h>
static CGFloat MainScreenHeight = 0;
static CGFloat MainScreenWidth = 0;
@interface LZBirthdayView()
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIButton *btnDone;
@property (nonatomic, strong) UIButton *btnCancel;
@property (nonatomic, strong) NSDateFormatter *formatter;
@property (nonatomic, strong) UILabel *labelTitle;

@end
@implementation LZBirthdayView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        MainScreenHeight = [UIScreen mainScreen].bounds.size.height;
        MainScreenWidth = [UIScreen mainScreen].bounds.size.width;
        [self setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.5]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickEmpty:)];
        [self addGestureRecognizer:tap];
        [self makeUI];
    }
    return self;
}

- (void)makeUI {
    
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, MainScreenHeight, MainScreenWidth, 230)];
    _containerView.backgroundColor = [UIColor whiteColor];
    
    UIView *viewBack = [UIView new];
    viewBack.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    //    viewBack.backgroundColor = [UIColor colorWithRed:245 / 255.0 green:245 / 255.0 blue:245 / 255.0 alpha:1.0];
    [_containerView addSubview:viewBack];
    
    _btnDone = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnDone.frame = CGRectMake(SCREEN_WIDTH - 60, 0, 60, 50);
    [_btnDone setTitleColor:[UIColor colorWithRed:45 / 255.0 green:191 / 255.0 blue:35 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    _btnDone.titleLabel.font = [UIFont systemFontOfSize:18.0];
    [_btnDone setTitle:@"确认" forState:UIControlStateNormal];
    [_btnDone addTarget:self action:@selector(doneAction:) forControlEvents:UIControlEventTouchUpInside];
    [viewBack addSubview:_btnDone];
    
    _btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnCancel.frame = CGRectMake(0,0,50, 50);
    [_btnCancel setTitleColor:[UIColor colorWithRed:45 / 255.0 green:191 / 255.0 blue:35 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    _btnCancel.titleLabel.font = [UIFont systemFontOfSize:18.0];
    [_btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [_btnCancel addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
    [viewBack addSubview:_btnCancel];
    
    _datePicker =  [[UIDatePicker alloc] initWithFrame:CGRectMake(0,50, MainScreenWidth, 180)];
    _datePicker.backgroundColor = [UIColor whiteColor];
    _datePicker.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
    [_datePicker setDate:[NSDate date] animated:YES];
    [_datePicker setMaximumDate:[NSDate date]];
    [_datePicker setDatePickerMode:UIDatePickerModeDate];
    
    //今天的年月日形式
    NSDate *today = [[NSDate alloc] init];
    NSCalendar* calendarToday = [NSCalendar currentCalendar];
    NSDateComponents* componentsToday = [calendarToday components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:today];
    NSInteger monthToday = [componentsToday month];
    NSInteger dayToday = [componentsToday day];
    NSInteger yearToday = [componentsToday year];
    NSString *birthday = [NSString stringWithFormat:@"%ld-%.2ld-%.2ld",(long)yearToday-100,(long)monthToday,(long)dayToday];
    [_datePicker setMinimumDate:[self.formatter dateFromString:birthday]];
    [_datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    [_containerView addSubview:_datePicker];
    
    [self addSubview:_containerView];
    __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        weakSelf.containerView.frame = CGRectMake(0, MainScreenHeight - 230, MainScreenWidth, 230);
    } completion:^(BOOL finished) {
    }];
}
#pragma mark - 隐藏
- (void)hideView
{
       __weak __typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        weakSelf.containerView.frame = CGRectMake(0, MainScreenHeight, MainScreenWidth, 230);
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}
#pragma mark - private method
- (void)clickEmpty:(UITapGestureRecognizer *)tap {
    // Animate In
    [self hideView];
}
#pragma mark - Action
- (void)doneAction:(UIButton *)btn {
    if (self.GetSelectDate) {
        _GetSelectDate([self.formatter stringFromDate:_datePicker.date]);
        [self hideView];
    }
}

- (void)cancelAction:(UIButton *)btn {
    [self hideView];
}

- (void)dateChange:(id)datePicker {
    
}

#pragma mark - setter、getter
- (void)setSelectDate:(NSString *)selectDate {
    [_datePicker setDate:[self.formatter dateFromString:selectDate] animated:YES];
}
- (NSDateFormatter *)formatter {
    if (_formatter) {
        return _formatter;
    }
    _formatter =[[NSDateFormatter alloc] init];
    [_formatter setDateFormat:@"yyyy-MM-dd"];
    return _formatter;
    
}



@end
