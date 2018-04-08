//
//  Deviceinfo.h
//  Case
//
//  Created by 栗子 on 2018/4/4.
//  Copyright © 2018年 http://www.cnblogs.com/Lrx-lizi/.     https://github.com/lrxlizi/. All rights reserved.
//

#ifndef Deviceinfo_h
#define Deviceinfo_h

///设备的UDID号
#define UDID                            [[[UIDevice currentDevice] identifierForVendor] UUIDString]
//颜色
#define RGBA(r, g, b, a)                [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define lzUserDefaultsGET(key)          [[NSUserDefaults standardUserDefaults] objectForKey:key]            // 取
#define lzUserDefaultsSET(object,key)   [[NSUserDefaults standardUserDefaults] setObject:object forKey:key] // 写
#define lzUserDefaultsSynchronize       [[NSUserDefaults standardUserDefaults] synchronize]                 // 存
#define lzUserDefaultsRemove(key)       [[NSUserDefaults standardUserDefaults] removeObjectForKey:key]      // 删

#define lzWindow                        [[UIApplication sharedApplication] keyWindow]

// 判断设备
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define LZDefaultImage [UIImage imageNamed:@"myselfCard_0"]




#endif /* Deviceinfo_h */
