//
//  XkBageButton.h
//  MyTabbar
//
//  Created by wangxiaokang on 16/8/5.
//  Copyright © 2016年 Wangxiaokang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XkBageButton : UIButton

// 红点数字标值
@property (nonatomic,copy) NSString *badgeValue;

// 显示红点
- (void) showBageButton;

// 隐藏红点
- (void) hidenBageButton;

@end
