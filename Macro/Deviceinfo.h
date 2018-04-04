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
#define UDID [[[UIDevice currentDevice] identifierForVendor] UUIDString]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

#define VIEWRADIUS 

#endif /* Deviceinfo_h */
