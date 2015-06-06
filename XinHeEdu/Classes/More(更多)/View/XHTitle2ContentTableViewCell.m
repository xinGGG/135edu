//
//  XHTitle2ContentTableViewCell.m
//  XinHeEdu
//
//  Created by xing on 15/6/5.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "XHTitle2ContentTableViewCell.h"
#import "XHMine.h"

@interface XHTitle2ContentTableViewCell ()
// 分割线
@property(nonatomic,strong) UIView *lineView;
//标题
@property (nonatomic,strong)UILabel *title;

//内容
@property (nonatomic,strong)UILabel *content;

//输入
@property (nonatomic,strong)UITextField *textField;

@end
@implementation XHTitle2ContentTableViewCell


-(UIView *)lineView {
    if (_lineView==nil) {
        _lineView = [[UIView alloc]init];
        [self.contentView addSubview:_lineView];
        _lineView.backgroundColor = [UIColor lightGrayColor];
        _lineView.alpha = 0.5;
    }
    return _lineView;
}

-(UILabel *)title {
    if (_title ==nil) {
        _title =[[UILabel alloc]init];
        _title.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_title];
    }
    return _title;
}

-(UILabel *)content {
    if (_content ==nil) {
        _content =[[UILabel alloc]init];
        [self.contentView addSubview:_content];
        _content.textColor = [UIColor grayColor];
    }
    return _content;
}

+(instancetype)titleContentCellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"cell";
    
    XHTitle2ContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[XHTitle2ContentTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
//        self.separatorInset = UIEdgeInsetsMake(0, 40, 0, 0);
    }
    
    return self;
}

- (void)layoutSubviews {

    CGRect selfF = self.frame;
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = 100;
    CGFloat titleH = selfF.size.height;
    self.title.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat contentX = CGRectGetMaxX(self.title.frame);
    CGFloat contentW = selfF.size.width - titleW;
    self.content.frame = CGRectMake(contentX, titleY, contentW, titleH);
    
    if (self.showLine) {
        self.lineView.frame = CGRectMake(10, titleH-1, selfF.size.width, 1);
    }
    

}

- (void)setTitle2Content:(XHTitle2Content *)title2Content{

    _title2Content = title2Content;
    
    self.title.text = title2Content.title;
    
    self.content.text = title2Content.content;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
