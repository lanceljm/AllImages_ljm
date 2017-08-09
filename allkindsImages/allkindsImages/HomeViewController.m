//
//  HomeViewController.m
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/9.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "HomeViewController.h"
#import "GenoryTableViewCell.h"
#import "GenoryModel.h"

static NSString *cellID = @"cellId";

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArr;
    UITableView    *_myTableview;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
  
    _dataArr = [NSMutableArray new];
    /* < 网络请求 > */
    [self loadNetworkDataSource];
    
    
    _myTableview = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _myTableview.frame = [UIScreen mainScreen].bounds;
    _myTableview.delegate = self;
    _myTableview.dataSource = self;
    _myTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _myTableview.estimatedRowHeight = 60.f;
    _myTableview.rowHeight = 60.f;
    [self.view addSubview:_myTableview];
    
  
}

#pragma mark -- uitableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
    SLLog(@"此时数组中的元素有:%lu",(unsigned long)_dataArr.count);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GenoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[GenoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    GenoryModel *model = _dataArr[indexPath.row];
    cell.model = model;
    
    return cell;
}

#pragma mark -- 网络请求
- (void) loadNetworkDataSource
{
    [[NetworkTools shareTools] requestWithMethod:GET andURL:GlobalURL andParameters:@{paramDic} andCallBack:^(id data, NSError *error) {
        
        NSArray *dataArray = data[@"showapi_res_body"][@"list"];
        /* < 网络请求成功 > */
        if (!error) {
            SLLog(@"+++++++++++++++++++\n网络请求成功：%@",dataArray);
            _dataArr = [GenoryModel mj_objectArrayWithKeyValuesArray:dataArray];
            [_myTableview reloadData];
//            SLLog(@"此时模型中的数据是:%@",_dataArr);
        }else
        {
            /* < 网络请求失败 > */
            SLLog(@"-------------------\n网络请求失败：%@",error);
        }
    }];
}



@end
