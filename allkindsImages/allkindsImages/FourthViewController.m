//
//  FourthViewController.m
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/10.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "FourthViewController.h"
#import "HomeDetailViewController.h"

@interface FourthViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataArr;
    UITableView     *myTableView;
}

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataArr = [NSMutableArray array];
    myTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    myTableView.backgroundColor = [UIColor clearColor];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.rowHeight = 60.f;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:myTableView];
  
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.f];
    [self loadDataSource];
    
//    UILabel *tipLab = [[UILabel alloc] initWithFrame:CGRectMake(0 , 0, 200, 20)];
//    tipLab.center = self.view.center;
//    tipLab.textAlignment = NSTextAlignmentCenter;
//    tipLab.text = getHeadWithArray[3];
//    [self.view addSubview:tipLab];
}

#pragma mark -- uitableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"cell";
    GenoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[GenoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    HomeModel *model = dataArr[indexPath.row];
    cell.model = model;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

#pragma mark -- uitablewview datasource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self) weakself = self;
    HomeModel *model = dataArr[indexPath.row];
    [[NetworkTools shareTools] requestWithMethod:GET andURL:DetailURL andParameters:@{paramDic,@"type":model.id} andCallBack:^(id data, NSError *error) {
        NSArray *dataArray = data[@"showapi_res_body"][@"pagebean"][@"contentlist"];
        if (!error) {
            SLLog(@"三级界面网络请求成功:%@",data);
            [SVProgressHUD showSuccessWithStatus:@"三级界面网络请求成功"];
            HomeDetailViewController *hdvc = [[HomeDetailViewController alloc] init];
            hdvc.detailHomeArr = [DetailModel mj_objectArrayWithKeyValuesArray:dataArray];
            UINavigationController *uvc = [[UINavigationController alloc] initWithRootViewController:hdvc];
            [weakself presentViewController:uvc animated:YES completion:nil];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            
        }else{
            SLLog(@"三级界面网路请求失败:%@",error);
            [SVProgressHUD showErrorWithStatus:@"三级界面网络请求失败"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
        }
    }];
}

#pragma mark -- 网络请求
- (void) loadDataSource
{
    [[NetworkTools shareTools] requestWithMethod:GET andURL:GlobalURL andParameters:@{paramDic} andCallBack:^(id data, NSError *error) {
        NSArray *dataArray = data[@"showapi_res_body"][@"list"][3][@"list"];
        if (!error) {
            SLLog(@"%@",dataArray);
            [SVProgressHUD showSuccessWithStatus:@"二级界面网络请求成功"];
            dataArr = [HomeModel mj_objectArrayWithKeyValuesArray:dataArray];
            [myTableView reloadData];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
        }else{
            SLLog(@"%@",error);
            [SVProgressHUD showErrorWithStatus:@"二级界面网络请求失败"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
        }
    }];
}

@end
