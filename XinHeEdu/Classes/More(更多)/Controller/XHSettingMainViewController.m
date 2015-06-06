//
//  XHSettingMainViewController.m
//  XinHeEdu
//
//  Created by xing on 15/6/6.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "XHSettingMainViewController.h"
#import "MBProgressHUD+MJ.h"
#import "XHSettingItem.h"
#import "XHSettingCustom.h"
#import "XHSettingGroups.h"

#import "XHSettingItemSwitch.h"
#import "XHSettingItemArrow.h"
#import "XHSettingItemSwitch.h"

#import "XHMineTableViewController.h"
#import "XHPassWordViewController.h"
#import "XHFeedbackViewViewController.h"
#import "XHSettingViewController.h"
#import "XHAboutViewController.h"

@interface XHSettingMainViewController ()<UIActionSheetDelegate>

@end

@implementation XHSettingMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    XHSettingItem *item1 =  [XHSettingItemArrow itemWithTitle:@"个人信息" desVC:[XHMineTableViewController class]];
    XHSettingItem *item2 = [XHSettingItemArrow itemWithTitle:@"修改密码" desVC:[XHPassWordViewController class]];
    XHSettingItem *item3 = [XHSettingItemArrow itemWithTitle:@"用户反馈" desVC:[XHFeedbackViewViewController class]];
    XHSettingItem *item4 = [XHSettingItemArrow itemWithTitle:@"设置" desVC:[XHSettingViewController class]];
    XHSettingItem *item5 = [XHSettingItemArrow itemWithTitle:@"关于" desVC:[XHAboutViewController class]];

    XHSettingGroups *group1 = [XHSettingGroups arrayWithItems:@[item1,item2,item3,item4,item5]];
    [self.items addObject:group1];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:@"注销当前用户" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGRect frame = CGRectMake(10, 0, screenW-20, 44);
    XHSettingItem *itemBtn = [XHSettingCustom itemCustomView:button frame:frame];
    XHSettingGroups *group2= [XHSettingGroups arrayWithItems:@[itemBtn]];
    [self.items addObject:group2];
}
- (void)btnClick{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"请问确定注销吗？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    sheet.delegate =self;
    [sheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex) {
        return;
    }
    else {
        [MBProgressHUD showMessage:@"正在注销"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            [self dismissViewControllerAnimated:YES completion:nil];
        });
    }
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
