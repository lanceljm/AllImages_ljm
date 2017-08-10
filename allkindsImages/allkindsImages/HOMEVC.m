//
//  HOMEVC.m
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/9.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "HOMEVC.h"
#import "LoginViewController.h"


static NSString *identifier = @"buttonIdentifier";

static  NSString *FirstIdentifier = @"FirstIdentifier";
static  NSString *SecondIdentifier = @"SecondIdentifier";
static  NSString *ThirdIdentifier = @"ThirdIdentifier";
static  NSString *FourthIdentifier = @"FourthIdentifier";
static  NSString *FivthIdentifier = @"FivthIdentifier";
static  NSString *SixthIdentifier = @"SixthIdentifier";
static  NSString *SeventhIdentifier = @"SeventhIdentifier";

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
//    [UIApplication sharedApplication].statusBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    _datarr = [NSMutableArray new];
    _datarr = self._modelDataArray;
//    SLLog(@"%@",self._modelDataArray);
    
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

#pragma mark -- 显示详细页面的视图
- (UIViewController *) magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex
{
    switch (pageIndex) {
        case 0:
        {
            FirstViewController *firstVC = [magicView dequeueReusablePageWithIdentifier:FirstIdentifier];
            if (!firstVC) {
                firstVC = [[FirstViewController alloc] init];
            }
            return firstVC;
        }
            break;
        case 1:
        {
            SecondViewController *secondVC = [magicView dequeueReusablePageWithIdentifier:SecondIdentifier];
            if (!secondVC) {
                secondVC = [[SecondViewController alloc] init];
            }
            return secondVC;
        }
            break;
            
        case 2:
        {
            ThirdViewController *thirdVC = [magicView dequeueReusablePageWithIdentifier:ThirdIdentifier];
            if (!thirdVC) {
                thirdVC = [[ThirdViewController alloc] init];
            }
            return thirdVC;
        }
            break;
        
        case 3:
        {
            FourthViewController *fourthVC = [magicView dequeueReusablePageWithIdentifier:FourthIdentifier];
            if (!fourthVC) {
                fourthVC = [[FourthViewController alloc] init];
            }
            return fourthVC;
        }
            break;
            
        case 4:
        {
            FivthViewController *fivethVC = [magicView dequeueReusablePageWithIdentifier:FivthIdentifier];
            if (!fivethVC) {
                fivethVC = [[FivthViewController alloc] init];
            }
            return fivethVC;
        }
            break;
            
        case 5:
        {
            SixthViewController *sixthVC = [magicView dequeueReusablePageWithIdentifier:SixthIdentifier];
            if (!sixthVC) {
                sixthVC = [[SixthViewController alloc] init];
            }
            return sixthVC;
        }
            break;
            
        default:
        {
            SeventhViewController *seventhVC = [magicView dequeueReusablePageWithIdentifier:SeventhIdentifier];
            if (!seventhVC) {
                seventhVC = [[SeventhViewController alloc] init];
            }
            return seventhVC;
        }
            break;
            
    }
}

#pragma mark -- VTMagicDelegate  点击选中了第几页
- (void)magicView:(VTMagicView *)magicView didSelectItemAtIndex:(NSUInteger)itemIndex {
    SLLog(@"点击选中了第%lu页",(unsigned long)itemIndex);
    
}

#pragma mark -- 滑动选中了第几页
- (void)magicView:(VTMagicView *)magicView viewDidAppear:(__kindof UIViewController *)viewController atPage:(NSUInteger)pageIndex {
    SLLog(@"滑动选中了第%lu页",(unsigned long)pageIndex);
}


@end
