//
//  XHMineIconTableViewCell.h
//  XinHeEdu
//
//  Created by xing on 15/6/5.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XHMine,XHMineIconTableViewCell;
@protocol XHMineIconTableViewCellDelegate <NSObject>

@optional
- (void)iconClickWithCell:(XHMineIconTableViewCell *)cell;

@end
@interface XHMineIconTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *icon;

+(instancetype)CellView;
- (void)changeIcon:(NSString *)iconName;
@property (nonatomic,strong)XHMine *mine;
@property (nonatomic,weak)id <XHMineIconTableViewCellDelegate> delegate;
@end
