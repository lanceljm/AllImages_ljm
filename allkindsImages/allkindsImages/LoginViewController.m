//
//  LoginViewController.m
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/9.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "LoginViewController.h"
#import "HOMEVC.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    bgImage.image = [UIImage imageNamed:@"loginBG"];
    [self performSelector:@selector(dismissvc:) withObject:self afterDelay:1.f];
    [self.view addSubview:bgImage];
}

#pragma mark -- dismiss vc
- (void) dismissvc:(id)sender
{
    __weak typeof(self) weakself = self;
//    /** 异步操作 **/
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    
        [[NetworkTools shareTools] requestWithMethod:GET andURL:GlobalURL andParameters:@{paramDic} andCallBack:^(id data, NSError *error) {
            NSArray *dataArray = data[@"showapi_res_body"][@"list"];
            
//            /** 回到主线程 **/
//            dispatch_async(dispatch_get_main_queue(), ^{
//                
                if (!error) {
                    /* < 网络请求成功 > */
                    //            SLLog(@"+++++++++\n网络请求成功:%@",dataArray);
                    
                    /* < 网络请求成功提示框 > */
                    [SVProgressHUD showSuccessWithStatus:@"网络请求成功"];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [SVProgressHUD dismiss];
                    });
                    
                    
                    
                    
                    /* < 遍历数组 > */
                    NSMutableArray *array = [NSMutableArray array];
                    [array removeAllObjects];
                    for (NSDictionary *dic in dataArray) {
                        //                SLLog(@"%@",dic[@"name"]);
                        [array addObject:dic[@"name"]];
                    }
                    
                    /* < 正向属性传值 > */
                    HOMEVC *homevc = [[HOMEVC alloc] init];
                    homevc._modelDataArray = array;
                    
                    /* < 把这个数组保存到ud中 > */
                    [[NSUserDefaults standardUserDefaults] setValue:array forKey:headWithArray];
                    //            SLLog(@"%@",array);
                    //            SLLog(@"%@",homevc._modelDataArray);
                    
                    [weakself presentViewController:homevc animated:YES completion:nil];
                    [weakself removeFromParentViewController];
                    [weakself.view removeFromSuperview];
                    
                }else
                {
                    /* < 网络请求失败 > */
                    //            SLLog(@"---------\n网络请求失败:%@",error);
                    [SVProgressHUD showErrorWithStatus:@"网络请求失败"];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [SVProgressHUD dismiss];
                    });
                }

//            });
        }];
        
//    });
    
    
}

@end
