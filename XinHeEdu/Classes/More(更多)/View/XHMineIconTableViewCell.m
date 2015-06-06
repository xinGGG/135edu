//
//  XHMineIconTableViewCell.m
//  XinHeEdu
//
//  Created by xing on 15/6/5.
//  Copyright (c) 2015年 xing. All rights reserved.
//

#import "XHMineIconTableViewCell.h"
#import "XHMine.h"
@interface XHMineIconTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *identityLabel;

@end
@implementation XHMineIconTableViewCell
- (void)setMine:(XHMine *)mine {
    
    _mine = mine;

    [self.icon setImage:[UIImage imageNamed:mine.icon] forState:UIControlStateNormal];
    
    self.nameLabel.text = mine.name;
    
    self.identityLabel.text = [NSString stringWithFormat:@"身份: %@",mine.identity];

}
- (void)changeIcon:(NSString *)iconName{
    [self.icon setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
}
+(instancetype)CellView{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"XHMineIconTableViewCell" owner:self options:nil] lastObject];
}

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.icon addTarget:self action:@selector(iconClick) forControlEvents:UIControlEventTouchUpInside];
    self.icon.layer.cornerRadius = 12.0f;
    self.icon.clipsToBounds = YES;
}
- (void)iconClick{

    if ([self.delegate respondsToSelector:@selector(iconClickWithCell:)]) {
        [self.delegate iconClickWithCell:self];
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
