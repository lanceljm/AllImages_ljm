//
//  DetailTableViewCell.h
//  allkindsImages
//
//  Created by ljm on 2017/8/10.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"

@interface DetailTableViewCell : UITableViewCell

/** 主题 **/
@property (nonatomic,strong) UILabel *titleLab;

/** itemid **/
//@property (nonatomic,strong) UILabel *itemidLab;

/** 时间 **/
@property (nonatomic,strong) UILabel *ctLab;

@property (nonatomic,strong) DetailModel *model;

@end
