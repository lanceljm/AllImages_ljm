//
//  FirstViewController.m
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/10.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *dataArr;
    UITableView     *myTableView;
}

@end

@implementation FirstViewController

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

    [self loadDataSource];

    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.f];

    
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

#pragma mark -- 网络请求
- (void) loadDataSource
{
    [[NetworkTools shareTools] requestWithMethod:GET andURL:GlobalURL andParameters:@{paramDic} andCallBack:^(id data, NSError *error) {
        NSArray *dataArray = data[@"showapi_res_body"][@"list"][0][@"list"];
        if (!error) {
            SLLog(@"%@",dataArray);
            dataArr = [HomeModel mj_objectArrayWithKeyValuesArray:dataArray];
            [myTableView reloadData];
        }else{
            SLLog(@"%@",error);
        }
    }];
}

@end
