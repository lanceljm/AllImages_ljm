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

/**
 *  返回图片大于imageView的高度
 *
 *  @return 图片大于imageView的高度
 */
- (CGFloat)imageOverflowHeight
{
    // 减200 是因为cell的高度设为200，所以直接写固定值了
    return _myImageView.frame.size.height - kselfWidth * 1.2;
}

/**
 *  设置imageView偏移量
 *
 *  @param imageOffset 偏移量
 */
- (void)setImageOffset:(CGPoint)imageOffset
{
    CGRect frame = _myImageView.frame;
    frame.origin = imageOffset;
    _myImageView.frame = frame;
}

@end
