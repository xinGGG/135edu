//
//  XHNavigationController.m
//  XinHeEdu
//
//  Created by xing on 15/6/3.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "XHNavigationController.h"
#import "IQToolbar.h"
@interface XHNavigationController ()

@end

@implementation XHNavigationController

// 二级以上push 隐藏tabbar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count >0) {
        [viewController hidesBottomBarWhenPushed];
    }
    [super pushViewController:viewController animated:animated];
}

#warning navigation 的导航样式优化
+ (void)initialize {

    if ( self == [XHNavigationController class]) {
    
        [self setupNav];
        [self setupItem];
        IQToolbar *bar = [IQToolbar appearance];
        bar.barStyle = UIBarStyleDefault;
        bar.barTintColor = [UIColor lightGrayColor];
    }
}

+ (void)setupNav {
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBarTintColor:[UIColor orangeColor]];
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:22],
                           NSForegroundColorAttributeName:[UIColor whiteColor]
                           };
    [bar setTitleTextAttributes:dict];
    [bar setTintColor:[UIColor whiteColor]];
}
+ (void)setupItem{
#warning 设置左右按钮
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dictM[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [item setTitleTextAttributes:dictM forState:UIControlStateNormal];
    item.tintColor = [UIColor whiteColor];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
