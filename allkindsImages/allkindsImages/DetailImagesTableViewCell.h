//
//  DetailImagesTableViewCell.h
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/11.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailImageModel.h"

@interface DetailImagesTableViewCell : UITableViewCell

/* < 图片 > */
@property (strong , nonatomic) UIImageView  * myImageView;

@property (strong , nonatomic) DetailImageModel  * model;

// 获取图片最大偏移量
- (CGFloat)imageOverflowHeight;
// 重新设置图片偏移量
- (void)setImageOffset:(CGPoint)imageOffset;

@end
