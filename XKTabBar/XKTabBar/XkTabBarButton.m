//
//  XkTabBarButton.m
//  MyTabbar
//
//  Created by wangxiaokang on 16/8/5.
//  Copyright © 2016年 Wangxiaokang. All rights reserved.
//

#import "XkTabBarButton.h"
#import "XkBageButton.h"

// 定义image图片所占的比重
#define XkTabBarImageRatio 0.60

@interface XkTabBarButton ()

@property (nonatomic, strong) XkBageButton * badgeButton;

@end

@implementation XkTabBarButton

- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 图片位置居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 文字位置居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 文字字体
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        // 默认颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 点击时的颜色
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        // 添加一个显示红色标识按钮
        [self addSubview:self.badgeButton];
        
    }
    return self;
}

- (XkBageButton *) badgeButton
{
    if (_badgeButton == nil)
    {
        _badgeButton = [[XkBageButton alloc] init];
        _badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    }
    return _badgeButton;
}

/**
 *  去掉父类在高亮时所做的操作
 */
- (void)setHighlighted:(BOOL)highlighted
{
    
}

- (CGRect) titleRectForContentRect:(CGRect)contentRect
{
    CGFloat y = contentRect.size.height * XkTabBarImageRatio;
    CGFloat h = contentRect.size.height - y;
    CGFloat w = contentRect.size.width;
    return CGRectMake(0, y, w, h);}

- (CGRect) imageRectForContentRect:(CGRect)contentRect
{
    CGFloat h = contentRect.size.height * XkTabBarImageRatio + 3;
    CGFloat w = contentRect.size.width;
    return CGRectMake(0, 0, w, h);
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    // 利用KVO监听item属性值（可以是title、image、selectedImage和badgeValue）的改变
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
    // 属性赋值
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

/**
 *  KVO监听必须在监听器释放的时候，移除监听操作
 */
- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    [self changeBadge];
}

- (void) changeBadge
{
    // 红色徽标数字
    self.badgeButton.badgeValue = self.item.badgeValue;
    CGFloat x = self.frame.size.width / 2 + 6;
    CGFloat y = 2;
    self.badgeButton.frame = CGRectMake(x, y, 0, 0);
}

- (void) setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self changeBadge];
}

// 显示红点
- (void) showBadgeButton
{
    [self.badgeButton showBageButton];
}

// 隐藏红点
- (void) hidenBadgeButton
{
    [self.badgeButton hidenBageButton];
}

@end
