//
//  HomeDetailViewController.m
//  allkindsImages
//
//  Created by ljm on 2017/8/10.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "DetailModel.h"
#import "DetailImageModel.h"
#import "DetailTableViewCell.h"
#import "HomeDetialImagesViewController.h"

@interface HomeDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *myTableview;
    NSMutableArray *dataArr;
    NSString *titleHead;
}

@end

@implementation HomeDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    /* < 设置导航条背景颜色 > */
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    /* < 设置字体颜色 > */
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:25]};
    
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(dismissvc) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    /* < 设置图片偏移 > */
    self.navigationItem.leftBarButtonItem = leftBar;
    
}

#pragma mark -- dismissvc 
- (void) dismissvc
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    myTableview = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    myTableview.backgroundColor = [UIColor whiteColor];
    myTableview.delegate = self;
    myTableview.dataSource = self;
    myTableview.rowHeight = 80.f;
    myTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:myTableview];
    
    dataArr = self.detailHomeArr;
    SLLog(@"%@",dataArr);
    
    titleHead = [NSString string];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return titleHead;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    DetailModel *model = dataArr[indexPath.row];
    cell.model = model;
    titleHead = model.typeName;
    self.title = titleHead;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak typeof(self) weakself = self;
    DetailModel *model = dataArr[indexPath.row];
    SLLog(@"%@",model.type);
    [[NetworkTools shareTools] requestWithMethod:GET andURL:DetailURL andParameters:@{paramDic ,@"type":model.type} andCallBack:^(id data, NSError *error) {
        SLLog(@"四级界面请求的参数:%@",model.type);
        SLLog(@"四级界面请求下来的数据:%@",data[@"showapi_res_body"][@"pagebean"][@"contentlist"]);
        NSArray *dataArray = data[@"showapi_res_body"][@"pagebean"][@"contentlist"];
        if (!error) {
            SLLog(@"四级界面图片请求成功:%@",dataArray);
            NSMutableArray *mudataArr = [NSMutableArray array];
            for (NSDictionary *dic in dataArray) {
                [mudataArr addObject:dic[@"list"]];
            }
            SLLog(@"字典数组转模型数组前:%@",mudataArr);
            NSMutableArray *mudataArray = [NSMutableArray array];
            for (NSDictionary *dict in mudataArr) {
                [mudataArray addObject:dict[@"big"]];
            }

            
            HomeDetialImagesViewController *hvc = [[HomeDetialImagesViewController alloc] init];
            hvc.detailModelArr = [DetailImageModel mj_objectArrayWithKeyValuesArray:mudataArray];
            SLLog(@"字典数组转模型数组:%@",hvc.detailModelArr);
            UINavigationController *uvc = [[UINavigationController alloc] initWithRootViewController:hvc];
            [weakself.navigationController presentViewController:uvc animated:YES completion:nil];
        }else
        {
            SLLog(@"四级界面图片请求失败:%@",error);
        }
    }];
}


@end
