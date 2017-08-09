//
//  GenoryTableViewCell.m
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/9.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "GenoryTableViewCell.h"

@implementation GenoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _namelab = [[UILabel alloc] init];
        _namelab.textColor = [UIColor blackColor];
        _namelab.textAlignment = NSTextAlignmentLeft;
        _namelab.font = [UIFont systemFontOfSize:18];
        [self addSubview:_namelab];
        [_namelab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(10);
            make.left.equalTo(self.mas_left).offset(20);
            make.bottom.equalTo(self.mas_bottom).offset(-10);
            make.right.equalTo(self.mas_right).offset(-20);
        }];
        [_namelab layoutIfNeeded];
    }
    return self;
}

//#pragma mark -- nameLab 的约束
//- (void)setNamelab:(UILabel *)namelab
//{
//    [self.namelab mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).offset(10);
//        make.left.equalTo(self.mas_left).offset(20);
//        make.bottom.equalTo(self.mas_bottom).offset(-10);
//        make.right.equalTo(self.mas_right).offset(-20);
//    }];
//    [self.namelab layoutIfNeeded];
//}

#pragma mark -- 赋值
- (void)setModel:(GenoryModel *)model
{
    _model = model;
    
    _namelab.text = model.name;
}

@end
