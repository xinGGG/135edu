//
//  XHPassWordViewController.m
//  XinHeEdu
//
//  Created by xing on 15/6/5.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "XHPassWordViewController.h"
#import "XHPassView.h"
#import "XHMine.h"
#import "MBProgressHUD+MJ.h"
@interface XHPassWordViewController ()<XHPassViewDelegate>
@property (nonatomic,strong)NSMutableArray *dataList;
@property (nonatomic,weak)UIView *bg;
@end

@implementation XHPassWordViewController
-(NSMutableArray *)dataList {
    if (_dataList ==nil) {
        _dataList = [NSMutableArray array];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Mine" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSMutableArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        for (NSDictionary *dict  in array) {
            [_dataList addObject:[XHMine mineWithDict:dict]];
        }
    }
    return _dataList;
}
-(UIView *)bg{
    if (_bg==nil) {
        _bg =[XHPassView passWordView];
        _bg.frame = self.view.bounds;
        XHPassView *view=  (XHPassView *)_bg;
        view.delegate =self;
    }
    return _bg;
}
- (void)loadView {
    [super loadView];
    XHPassView *view =  (XHPassView *)self.bg;
    XHMine *mine = self.dataList[0];
    view.user.text =mine.name;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.bg];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupItem {
    
}
- (void)changePassWordClick:(XHPassView *)passView {

    NSLog(@"clickpass");
    [MBProgressHUD showMessage:@"正在提交"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:YES];
        [MBProgressHUD hideHUD];
        [MBProgressHUD showSuccess:@"修改成功"];
    });
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
