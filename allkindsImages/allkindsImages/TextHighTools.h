//
//  TextHighTools.h
//  allkindsImages
//
//  Created by ljm on 2017/8/8.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TextHighTools : NSObject

/**
 *
 根据文本和字体计算高度
 @param     text         文本
 @param     width       高度
 @param     fontSize    字体大小
 @return                    文本显示高度
 *
 **/

+ (CGFloat) countTextHight : (NSString *) text
                 withWidth : (CGFloat)width
              withFontSize : (CGFloat) fontSize;



@end
