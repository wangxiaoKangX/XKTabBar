//
//  BBBViewController.m
//  MyTabbar
//
//  Created by wangxiaokang on 16/8/22.
//  Copyright © 2016年 Wangxiaokang. All rights reserved.
//

#import "BBBViewController.h"

@interface BBBViewController ()

@end

@implementation BBBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.frame = CGRectMake(100, 100, 110, 110);
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)click
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"aaa" object:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
