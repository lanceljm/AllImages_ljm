//
//  DetailTableViewCell.m
//  allkindsImages
//
//  Created by ljm on 2017/8/10.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _titleLab = [[UILabel alloc] init];
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.font = [UIFont systemFontOfSize:20];
//        _titleLab.backgroundColor = [UIColor greenColor];
        [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(10);
            make.left.equalTo(self.mas_left).offset(10);
            make.right.equalTo(self.mas_right).offset(-10);
            make.height.equalTo(@30);
        }];
        [_titleLab layoutIfNeeded];
        
        
        _ctLab = [[UILabel alloc] init];
        _ctLab.textColor = [UIColor grayColor];
        _ctLab.textAlignment = NSTextAlignmentLeft;
        _ctLab.font = [UIFont systemFontOfSize:15];
//        _ctLab.backgroundColor = [UIColor redColor];
        [self addSubview:_ctLab];
        [_ctLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLab.mas_bottom).offset(5);
            make.bottom.equalTo(self.mas_bottom).offset(-10);
            make.left.equalTo(_titleLab.mas_left);
            make.right.equalTo(_titleLab.mas_right);
        }];
        [_ctLab layoutIfNeeded];
        
//        _itemidLab = [[UILabel alloc] init];
//        _itemidLab.textColor = [UIColor grayColor];
//        _itemidLab.textAlignment = NSTextAlignmentLeft;
//        _itemidLab.font = [UIFont systemFontOfSize:15];
//        [self addSubview:_itemidLab];
//        [_itemidLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.mas_top).offset(30);
//            make.bottom.equalTo(self.mas_bottom).offset(10);
//            make.width.equalTo(_itemidLab.mas_width);
//            make.height.equalTo(_itemidLab.mas_height);
//        }];
//        [_itemidLab layoutIfNeeded];
        
    }
    return self;
}

- (void)setModel:(DetailModel *)model
{
    _model = model;
    _titleLab.text = model.title;
//    _itemidLab.text = model.itemId;
    _ctLab.text = model.ct;
}

@end
