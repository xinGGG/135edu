//
//  XHTabBarViewController.m
//  XinHeEdu
//
//  Created by xing on 15/6/3.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "XHTabBarViewController.h"
#import "XHNavigationController.h"

#import "XHSettingMainViewController.h"

@interface XHTabBarViewController ()

@end

@implementation XHTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //添加按钮
    UIViewController *MessageVC = [[UIViewController alloc]init];
    [self addChildViewController:MessageVC WithTitle:@"消息"];
    //添加按钮
    UIViewController *AddressListVC = [[UIViewController alloc]init];
    [self addChildViewController:AddressListVC WithTitle:@"通讯录"];
    //添加按钮
    UIViewController *AdhibitionVC = [[UIViewController alloc]init];
    [self addChildViewController:AdhibitionVC WithTitle:@"应用"];
    //添加按钮
    XHSettingMainViewController *MoreVC = [[XHSettingMainViewController alloc]init];
    [self addChildViewController:MoreVC WithTitle:@"更多"];
}

- (void)addChildViewController:(UIViewController *)vc WithTitle:(NSString *)title{
    //设置tabbar 属性
    NSString *itemName = title;
    vc.title = itemName;
    vc.tabBarItem.image = [UIImage imageNamed:itemName];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@h",itemName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    //设置tabbaritem 属性
    NSDictionary *norDict = [NSDictionary dictionary];
    norDict = @{NSFontAttributeName : [UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor lightGrayColor]};
    [vc.tabBarItem setTitleTextAttributes:norDict forState:UIControlStateNormal];
    
    //设置tabbaritem - select 属性
    NSDictionary *selDict = [NSDictionary dictionary];
    selDict = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    [vc.tabBarItem setTitleTextAttributes:selDict forState:UIControlStateSelected];
    
    //包装到navigation 里面
    XHNavigationController *nav = [[XHNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
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
