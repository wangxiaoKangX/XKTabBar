//
//  XkBageButton.m
//  MyTabbar
//
//  Created by wangxiaokang on 16/8/5.
//  Copyright © 2016年 Wangxiaokang. All rights reserved.
//

#import "XkBageButton.h"

@interface XkBageButton ()

@property (nonatomic, strong) UIImage * backImage;

@end

@implementation XkBageButton

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 默认红点隐藏
        self.hidden = YES;
        // 默认不可点击
        self.userInteractionEnabled = NO;
        // 默认字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        // 设置背景图片
        self.backImage = [UIImage imageNamed:@"main_badge"];
        self.backImage = [self.backImage stretchableImageWithLeftCapWidth:self.backImage.size.height/2 topCapHeight:self.backImage.size.width/2];
        [self setBackgroundImage:self.backImage forState:UIControlStateNormal];
    }
    return self;
}

- (void) setFrame:(CGRect)frame
{
    frame.size = self.frame.size;
    [super setFrame:frame];
}

- (void) setBounds:(CGRect)bounds
{
    bounds.size = self.bounds.size;
    [super setBounds:bounds];
}

/**
 *  去掉父类在高亮时所做的操作
 */
- (void) setHighlighted:(BOOL)highlighted
{
    
}

- (void) setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = badgeValue;
    
    if (badgeValue.length)
    {
        // 有数字标识的时候不隐藏
        self.hidden = NO;
        
        if ([badgeValue isEqualToString:@"-1"]) // -1的时候显示小红点点
        {
            [self showBageButton];
            return;
        }
        
        // 设置尺寸
        CGRect frame = self.frame;
        frame.size.height = self.currentBackgroundImage.size.height;
        if (badgeValue.length > 1)
        {
            // 计算文本尺寸
            CGSize valueSize = [badgeValue sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}];
            frame.size.width = valueSize.width + 10;
        }else
        {
            frame.size.width = self.currentBackgroundImage.size.width;
        }
        [super setFrame:frame];
        
        // 设置内容
        [self setTitle:badgeValue forState:UIControlStateNormal];
    }else
    {
        // badgeValue值为0的时候隐藏
        self.hidden = YES;
    }
}

// 显示红点
- (void) showBageButton
{
    // 清空标识数值
    self.badgeValue = @"";
    // 显示红点
    self.hidden = NO;
    // 设置尺寸
    CGRect frame = self.frame;
    frame.size.height = 10;
    frame.size.width = frame.size.height;
    [super setFrame:frame];
    
}

// 隐藏红点
- (void) hidenBageButton
{
    // 清空标识数值
    self.badgeValue = @"";
    // 隐藏红点
    self.hidden = YES;
    // 尺寸为0
    self.frame = CGRectZero;
}

@end
