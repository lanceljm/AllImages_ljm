//
//  DetailImagesTableViewCell.m
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/11.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "DetailImagesTableViewCell.h"

@implementation DetailImagesTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _myImageView = [[UIImageView alloc] init];
        [self addSubview:_myImageView];
        [_myImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left);
            make.bottom.equalTo(self.mas_bottom);
            make.right.equalTo(self.mas_right);
        }];
        [_myImageView layoutIfNeeded];
    }
    return self;
}

- (void)setModel:(DetailImageModel *)model
{
    _model = model;
    
    [_myImageView sd_setImageWithURL:[NSURL URLWithString:model.big]];
}

@end
