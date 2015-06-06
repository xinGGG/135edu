//
//  XHPassView.m
//  XinHeEdu
//
//  Created by xing on 15/6/6.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "XHPassView.h"
@interface XHPassView()
@property (weak, nonatomic) IBOutlet UITextField *allTextField;
@property (weak, nonatomic) IBOutlet UITextField *oldPass;
@property (weak, nonatomic) IBOutlet UITextField *newpass;
@property (weak, nonatomic) IBOutlet UITextField *conformPass;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end
@implementation XHPassView

- (IBAction)btnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(changePassWordClick:)]) {
        [self.delegate changePassWordClick:self];
    }
}
+ (instancetype)passWordView{
    return [[[NSBundle mainBundle] loadNibNamed:@"XHPassView" owner:self options:nil] firstObject];
}

- (void)layoutSubviews {
//    self.oldPass.leftViewMode = UITextFieldViewModeAlways;
    self.oldPass.leftViewMode = UITextFieldViewModeAlways;
    self.oldPass.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
    self.conformPass.leftViewMode = UITextFieldViewModeAlways;
    self.conformPass.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
    self.newpass.leftViewMode = UITextFieldViewModeAlways;
    self.newpass.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
    self.user.leftViewMode = UITextFieldViewModeAlways;
    self.user.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
    //
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
