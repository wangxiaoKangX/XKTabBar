 //
//  XkTabBar.m
//  MyTabbar
//
//  Created by wangxiaokang on 16/8/5.
//  Copyright © 2016年 Wangxiaokang. All rights reserved.
//

#import "XkTabBar.h"
#import "XkTabBarButton.h"

@interface XkTabBar ()

@property (nonatomic,retain) UIImageView *lineImageView;
@property (nonatomic,retain) NSMutableArray *tabBarButtons;
@property (nonatomic, weak) XkTabBarButton * selectButton;
@property (nonatomic, weak) UIButton * publishButton;

@end

@implementation XkTabBar

- (NSMutableArray *)tabBarButtons
{
    if (nil == _tabBarButtons) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}

// 添加按钮
- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    // 创建按钮
    XkTabBarButton * button = [[XkTabBarButton alloc] init];
    //传递数据
    button.item = item;
    // 添加按钮
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
    [self.tabBarButtons addObject:button];
    
    // 默认选中 第一个按钮
    
    if (self.tabBarButtons.count == 1) {
        [self buttonClick:button];
    }
}

/**
 *  监听JXTabBarButton点击
 *
 *  @param button 被点击的tabbarButton
 */
- (void)buttonClick:(XkTabBarButton *)button
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectButtonWithIndex:)])
    {
        NSInteger index = [self.tabBarButtons indexOfObject:button];
        [self.delegate didSelectButtonWithIndex:index];
    }
    
    // 控制器选中的按钮
    self.selectButton.selected = NO;
    button.selected = YES;
    self.selectButton = button;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    
    if (self.tabBarButtons.count == 0)
    {
        return;
    }
    
    if (self.tabBarButtonType == NormalTabBarButton)
    {
        
        CGFloat buttonW = self.frame.size.width / self.tabBarButtons.count ;
        CGFloat buttonH = self.frame.size.height;
        for (int index = 0; index < self.tabBarButtons.count; index++)
        {
            XkTabBarButton * button = self.tabBarButtons[index];
            button.tag = index;
            CGFloat buttonX = buttonW * index;
            button.frame = CGRectMake(buttonX, 0, buttonW, buttonH);
        }
        
    }else // 带中间发布按钮的tabBar
    {
        CGFloat buttonW = self.frame.size.width / (self.tabBarButtons.count + 1);
        CGFloat buttonH = self.frame.size.height;
        for (int index = 0; index < self.tabBarButtons.count; index++)
        {
            XkTabBarButton * button = self.tabBarButtons[index];
            button.tag = index;
            CGFloat buttonX = buttonW * ((index > 1)?(index + 1):index);
            button.frame = CGRectMake(buttonX, 0, buttonW, buttonH);
        }
        [self creatPublishButton]; // 创建中间发布按钮
    }
    [self addSubview:self.lineImageView];
    
}

/**
 *  创建tabBar中间发布按钮
 */
- (void) creatPublishButton
{
    UIButton * publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [publishButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
    self.publishButton = publishButton;
    self.publishButton.bounds = CGRectMake(0, 0, self.publishButton.currentBackgroundImage.size.width, self.publishButton.currentBackgroundImage.size.height);
    self.publishButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    [self.publishButton addTarget:self action:@selector(publishClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.publishButton];
}

- (void) publishClick:(UIButton *) btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(publishTheEvent:)])
    {
        [self.delegate publishTheEvent:btn];
    }
}

- (UIImageView *) lineImageView
{
    if(nil == _lineImageView)
    {
        CGFloat w = self.frame.size.width;
        CGFloat h = 1.0;
        CGFloat x = 0.0;
        CGFloat y = -1.0;
        _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        _lineImageView.alpha = 0.4;
        _lineImageView.image = [UIImage imageNamed:@"under_line"];
        
    }
    return _lineImageView;
}

/**
 *  index位置的按钮显示小红点
 *
 *  @param index 显示的位置
 */
- (void) showRedPointWithIndex:(NSInteger) index
{
    if(index < self.tabBarButtons.count)
    {
        XkTabBarButton *button = self.tabBarButtons[index];
        [button showBadgeButton];
    }
}

/**
 *  index位置的按钮隐藏小红点
 */
- (void) hidenRedPointWithIndex:(NSInteger) index
{
    if(index < self.tabBarButtons.count)
    {
        XkTabBarButton *button = self.tabBarButtons[index];
        [button hidenBadgeButton];
    }
}

@end
