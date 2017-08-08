//
//  TextHighTools.m
//  allkindsImages
//
//  Created by ljm on 2017/8/8.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "TextHighTools.h"

@implementation TextHighTools

/**
 *
 计算文本的高度

 @param     text            文本
 @return     texthight      文本高度
 *
 **/
+ (CGFloat)countTextHight:(NSString *)text withWidth:(CGFloat)width withFontSize:(CGFloat)fontSize
{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    /** 通过控件的文本的字体、控件的宽度计算尺寸 **/
    CGSize size = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil].size;
    
    return size.height ;
}

@end
