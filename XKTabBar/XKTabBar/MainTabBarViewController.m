//
//  MainTabBarViewController.m
//  XKTabBar
//
//  Created by wangxiaokang on 16/8/23.
//  Copyright © 2016年 Wangxiaokang. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "XkTabBar.h"
#import "AAAViewController.h"
#import "BBBViewController.h"
#import "CCCViewController.h"
#import "DDDViewController.h"

@interface MainTabBarViewController ()<XkTabBarDelegate>

@property (nonatomic,retain) XkTabBar *customTabBar;
@property (nonatomic,retain) BBBViewController *notice;
@property (nonatomic,retain) AAAViewController *AAAnotice;

@end

@implementation MainTabBarViewController

- (XkTabBar *) customTabBar
{
    if(nil == _customTabBar)
    {
        _customTabBar = [[XkTabBar alloc] init];
        _customTabBar.frame = self.tabBar.bounds;
        _customTabBar.delegate = self;
    }
    return _customTabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 选择tabBar类型
//    self.customTabBar.tabBarButtonType = NormalTabBarButton;
        self.customTabBar.tabBarButtonType = SpecialTabBarButton;
    
    // 添加自定义tabBar
    [self.tabBar addSubview:self.customTabBar];
    
    // 初始化子控制器
    [self setupChildViewControllers];
    
    // 添加通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(click:) name:@"aaa" object:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 移除之前的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) { //UITabBarButton
            [child removeFromSuperview];
        }
    }
}
/**
 *  初始化子控制器
 */
- (void)setupChildViewControllers
{
    // 1.AAA
    self.AAAnotice = [[AAAViewController alloc] init];
    self.AAAnotice.tabBarItem.badgeValue = @"5";
    [self setupChildViewController:self.AAAnotice title:@"AAA" imageName:@"1a" selectedImageName:@"1"];
    
    // 2.BBB
    self.notice = [[BBBViewController alloc] init];
    self.notice.tabBarItem.badgeValue =  @"55";
    [self setupChildViewController:self.notice title:@"BBB" imageName:@"2a" selectedImageName:@"2"];
    
    // 3.CCC
    CCCViewController *message = [[CCCViewController alloc] init];
    message.tabBarItem.badgeValue =  @"-1";
    [self setupChildViewController:message title:@"CCC" imageName:@"3a" selectedImageName:@"3"];
    
    // 4.DDD
    DDDViewController *classCircle = [[DDDViewController alloc] init];
    classCircle.tabBarItem.badgeValue = [NSString stringWithFormat:@""];
    [self setupChildViewController:classCircle title:@"DDD" imageName:@"4a" selectedImageName:@"4"];
    
    // 4.EEE
    //    MineViewController *mine = [[MineViewController alloc] init];
    //    [self setupChildViewController:mine title:@"我的" imageName:@"tabBar_mine" selectedImageName:@"tabBar_mine_selected"];
    
    
}


/**
 *  添加一个子控制器
 *
 *  @param vc                子控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param selectedImageName 选中的图片
 */
- (void)setupChildViewController:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置数据
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    // 2.包装
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.hidden = YES;
    nav.hidesBottomBarWhenPushed = YES;
    [self addChildViewController:nav];
    
    // 3.添加按钮
    [self.customTabBar addTabBarButtonWithItem:vc.tabBarItem];
}

#pragma mark XkTabBarDelegate
// 选中的按钮
- (void) didSelectButtonWithIndex:(NSInteger) index
{
    self.selectedIndex = index;
}

/**
 *  点击发布按钮触发事件
 */
-(void)publishTheEvent:(UIButton *)btn
{
    NSLog(@" 发布事件 发布事件 ！");
}

// 移除通知
- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 通知方法 移除item右上角的标识
- (void) click:(NSNotification *) notification
{
    self.AAAnotice.tabBarItem.badgeValue =  @"";
}

@end
