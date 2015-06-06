//
//  XHTitle2ContentTableViewCell.h
//  XinHeEdu
//
//  Created by xing on 15/6/5.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHMine.h"
#import "XHTitle2Content.h"
@interface XHTitle2ContentTableViewCell : UITableViewCell
@property (nonatomic,strong)XHMine *mine;
@property (nonatomic,strong)XHTitle2Content *title2Content;
@property (nonatomic,assign)BOOL showLine;

+(instancetype)titleContentCellWithTableView:(UITableView *)tableView;
@end
