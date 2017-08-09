//
//  GenoryTableViewCell.h
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/9.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenoryModel.h"

@interface GenoryTableViewCell : UITableViewCell

/* < 文本类名 > */
@property (strong , nonatomic) UILabel  * namelab;

@property (strong , nonatomic) GenoryModel * model;

@end
