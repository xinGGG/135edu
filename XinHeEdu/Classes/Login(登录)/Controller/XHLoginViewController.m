//
//  XHLoginViewController.m
//  XinHeEdu
//
//  Created by xing on 15/6/3.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "XHLoginViewController.h"
#import "MBProgressHUD+MJ.h"
#import "XHTabBarViewController.h"
@interface XHLoginViewController ()
@end


#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
@interface XHLoginViewController ()<UIAlertViewDelegate>
@property (nonatomic,weak)UIView *lineView;
@property (nonatomic,weak)UITextField *textField;
@property (nonatomic,weak)UITextField *acountField;
@property (nonatomic,weak)UITextField *passwordField;

@property (nonatomic,weak)UIButton *loginBtn;
@end
@implementation XHLoginViewController
- (UIView *)lineView {

    if (_lineView ==nil) {
        UIView *view =  [[UIView alloc]init];
        _lineView.backgroundColor =[ UIColor whiteColor];
        [self.view addSubview:_lineView];
        _lineView = view;
    }
    return _lineView;
}
- (UITextField *)textField {

    if (_textField ==nil) {
        UITextField *field = [[UITextField alloc]init];
        CGFloat margin = 30;
        CGRect bounds = _textField.bounds;
        bounds.size.width =  screenW - margin * 2;;
        bounds.size.height = 44;
        _textField.bounds = bounds;
        _textField.textColor = [UIColor whiteColor];
        [_textField setDefaultTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
        _textField = field;
        //        UIView *line = [[UIView alloc]init];
//        [_textField addSubview:line];
//        line.backgroundColor = [UIColor whiteColor];
//        line.frame = CGRectMake(0, bounds.size.height-1, bounds.size.width, 1);
    }
    return _textField;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        CGFloat margin = 30;
        //背景
        UIImageView *imgV = [[UIImageView alloc]init];
        imgV.image =[UIImage imageNamed:@"ios－2208-1242－bg"];
        [self.view addSubview:imgV];
        imgV.frame = self.view.bounds;
        
        //logo
        UIImageView *logo = [[UIImageView alloc]init];
        logo.image = [UIImage imageNamed:@"logo-登陆"];
        [self.view addSubview:logo];
        CGFloat logoW = logo.image.size.width;
        CGFloat logoH = logo.image.size.height;
        CGFloat logoX = (screenW - logoW)*0.5;
        CGFloat logoY = 40;
        logo.frame = CGRectMake(logoX, logoY, logoW, logoH);
        
        //账号
        UITextField *acountField = [[UITextField alloc]init];
        acountField.placeholder = @"请输入个人账号";
        [self.view addSubview:acountField];
        CGFloat inputX = margin;
        CGFloat acountY = CGRectGetMaxY(logo.frame) + margin;
        CGFloat inputW = screenW - margin * 2;
        CGFloat inputH = 40;
        acountField.frame = CGRectMake(inputX , acountY, inputW , inputH);
        self.acountField = acountField;
        [acountField setTintColor:[UIColor whiteColor]];
        [acountField setTextColor: [UIColor whiteColor]];
        
        //密码
        UITextField *passField = [[UITextField alloc]init];
        passField.secureTextEntry = YES;
        passField.placeholder = @"请输入密码";
        [self.view addSubview:passField];
        CGFloat passY = CGRectGetMaxY(acountField.frame) + margin;
        passField.frame = CGRectMake(inputX , passY, inputW , inputH);
        self.passwordField = passField;
        [passField setTintColor:[UIColor whiteColor]];
        [passField setTextColor: [UIColor whiteColor]];

        //确认
        UIButton *login = [UIButton buttonWithType:UIButtonTypeCustom];
        self.loginBtn = login;
        [self.view addSubview:login];
        [login addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
        CGFloat loginY = CGRectGetMaxY(passField.frame)+margin;
        login.frame = CGRectMake(inputX, loginY, inputW, inputH);
        
        [login setBackgroundImage:[UIImage imageNamed:@"登陆按钮"] forState:UIControlStateNormal];
        [login setBackgroundImage: [UIImage imageNamed:@"登陆按钮h"] forState:UIControlStateHighlighted];
        
        [login setTitle:@"登陆" forState:UIControlStateNormal];
        
        //联系电话
        NSString *callStr = @"客服热线  (9:00-18:00) : 020-8382115" ;
        UIButton *callBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.view addSubview:callBtn];
        CGFloat callH = 50;
        CGFloat callY = screenH - callH;
        callBtn.frame =  CGRectMake(inputX, callY, inputW, callH);
        [callBtn setTitle:callStr forState:UIControlStateNormal];
        [callBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        callBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        callBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [callBtn addTarget:self action:@selector(callClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)loginClick{
    NSLog(@"click");
    if (!(self.acountField.text.length && self.passwordField.text.length)) {
        [MBProgressHUD showError:@"请输入账号和密码"];
    }else {
        if ([self.acountField.text isEqualToString:@"1"] && [self.passwordField.text isEqualToString: @"1"]) {
            [MBProgressHUD showMessage:@"正在登陆中..."];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                XHTabBarViewController *tabbar = [[XHTabBarViewController alloc]init];
                [self presentViewController:tabbar animated:NO completion:nil];
                [MBProgressHUD hideHUD];

            });
        }else {
            [MBProgressHUD showError:@"账号或密码不正确"];
        }
    }
}
- (void)callClick{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"是否拨打客服电话" message:@"020-83821115" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (!buttonIndex)return;
#warning 真机调试 拨打电话
    
    UIWebView*callWebview =[[UIWebView alloc] init];
    NSURL *telURL =[NSURL URLWithString:@"tel:020-8382115"];
    [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    //记得添加到view上
    [self.view addSubview:callWebview];
    NSLog(@"正在拨打电话");
    
    [MBProgressHUD  showSuccess:@"拨打电话"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.acountField.text = @"1";
    self.passwordField.text = @"1";
    
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
