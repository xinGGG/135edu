//
//  XHPassView.h
//  XinHeEdu
//
//  Created by xing on 15/6/6.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XHPassView;
@protocol XHPassViewDelegate <NSObject>

- (void)changePassWordClick:(XHPassView *)passView;

@end
@interface XHPassView : UIView
+ (instancetype)passWordView;
@property (weak, nonatomic) IBOutlet UITextField *user;
@property (weak,nonatomic)id <XHPassViewDelegate>delegate;
@end
