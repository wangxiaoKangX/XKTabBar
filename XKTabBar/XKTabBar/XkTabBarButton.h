//
//  XkTabBarButton.h
//  MyTabbar
//
//  Created by wangxiaokang on 16/8/5.
//  Copyright © 2016年 Wangxiaokang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XkTabBarButton : UIButton

// 将UITabBarItem作为一个属性，用作数据信息的传递
@property (nonatomic, strong) UITabBarItem * item;

// 显示红点
- (void) showBadgeButton;

// 隐藏红点
- (void) hidenBadgeButton;

@end
