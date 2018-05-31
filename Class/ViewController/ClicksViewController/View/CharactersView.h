//
//  CharactersView.h
//  Case
//
//  Created by 栗子 on 2018/5/31.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharactersView : UIView


- (instancetype)initWithFrame:(CGRect)frame selectCount:(NSInteger)count charactersarr:(NSArray *)arr;

//匹配成功
@property(nonatomic,copy)void (^chararctersViewSuccessfulMatches)(void);


@end
