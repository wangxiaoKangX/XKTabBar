//
//  XkTabBar.h
//  MyTabbar
//
//  Created by wangxiaokang on 16/8/5.
//  Copyright © 2016年 Wangxiaokang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    SpecialTabBarButton = 100, // 带中间发布按钮
    NormalTabBarButton,        // 普通tabBar
    
} TabBarButtonType; // tabBar类型

@protocol XkTabBarDelegate <NSObject>

// 选中的按钮
- (void) didSelectButtonWithIndex:(NSInteger) index;

// 点击发布按钮
- (void) publishTheEvent:(UIButton *) btn;

@end

@interface XkTabBar : UIView

// 添加按钮
- (void) addTabBarButtonWithItem:(UITabBarItem *) item;

// 代理
@property (nonatomic, weak) id<XkTabBarDelegate> delegate;

// index位置的按钮显示小红点
- (void) showRedPointWithIndex:(NSInteger) index;

// index位置的按钮隐藏小红点
- (void) hidenRedPointWithIndex:(NSInteger) index;

@property (nonatomic, assign) TabBarButtonType tabBarButtonType; // tabBar类型

@end
