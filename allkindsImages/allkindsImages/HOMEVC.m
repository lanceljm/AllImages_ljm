//
//  HOMEVC.m
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/9.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "HOMEVC.h"

static NSString *identifier = @"buttonIdentifier";

@interface HOMEVC ()
{
    NSMutableArray *_datarr;
}

@end

@implementation HOMEVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    _datarr = [NSMutableArray new];

    [self initVTMagic];
}

- (void) initVTMagic
{
    self.magicView.switchEnabled = YES;
    /* < 是否隐藏分割线 > */
    self.magicView.separatorHidden = NO;
    /* < 选中当前的选项变大的比例 > */
    self.magicView.itemScale = 1.2f;
    self.magicView.navigationColor = [UIColor whiteColor];
    self.magicView.layoutStyle = VTLayoutStyleDefault;
    
    [self generateHeadData];
    [self.magicView reloadData];
    
}

#pragma mark -- VTMagicview datasource
- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView
{
    return _datarr;
    SLLog(@"%lu",(unsigned long)_datarr.count);
}

#pragma mark -- 头部文件的文字设置
- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex
{
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:identifier];
    
    if (!menuItem) {
        menuItem = [[UIButton alloc] init];
        /* < 默认按钮的字体颜色 > */
        [menuItem setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        /* < 选中按钮的字体颜色 > */
        [menuItem setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        /* < 按钮的字体大小 > */
        menuItem.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    [menuItem setTitle:_datarr[itemIndex] forState:UIControlStateNormal];
    return menuItem;
}

#pragma mark -- VTMagicDelegate
#pragma mark -- 点击选中了第几页
- (void)magicView:(VTMagicView *)magicView didSelectItemAtIndex:(NSUInteger)itemIndex {
    NSLog(@"点击选中了第%lu页",(unsigned long)itemIndex);
    
}

#pragma mark -- 滑动选中了第几页
- (void)magicView:(VTMagicView *)magicView viewDidAppear:(__kindof UIViewController *)viewController atPage:(NSUInteger)pageIndex {
    NSLog(@"滑动选中了第%lu页",(unsigned long)pageIndex);
}

#pragma mark -- 生成头部选项
- (void) generateHeadData
{
    [[NetworkTools shareTools] requestWithMethod:GET andURL:GlobalURL andParameters:@{paramDic} andCallBack:^(id data, NSError *error) {
        NSArray *dataArray = data[@"showapi_res_body"][@"list"];
        if (!error) {
            [SVProgressHUD showSuccessWithStatus:@"网络请求成功"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            SLLog(@"网络请求成功:%@",dataArray);
            NSMutableArray *array = [NSMutableArray array];
            [array removeAllObjects];
            for (NSDictionary *dic in dataArray) {
                SLLog(@"%@",dic[@"name"]);
                [array addObject:dic[@"name"]];
            }
            _datarr = array;
//            SLLog(@"%@",array);
            [self.magicView reloadData];
        }else
        {
            [SVProgressHUD showErrorWithStatus:@"网络请求错误"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            SLLog(@"error:%@",error);
        }
    }];
}

@end
