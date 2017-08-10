//
//  GenoryTableViewCell.h
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/9.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GenoryTableViewCell : UITableViewCell

/* < 文本类名 > */
@property (strong , nonatomic) UILabel  * namelab;

/* < id名 > */
@property (strong , nonatomic) UILabel  * idLab;

@property (strong , nonatomic) HomeModel * model;


@end
