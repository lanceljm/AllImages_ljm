//
//  HomeDetialImagesViewController.m
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/11.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "HomeDetialImagesViewController.h"
#import "DetailImagesTableViewCell.h"

@interface HomeDetialImagesViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *myTableview;
    NSMutableArray  *dataArr;
}

@end

@implementation HomeDetialImagesViewController

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
    myTableview.delegate = self;
    myTableview.dataSource = self;
    myTableview.rowHeight = kselfWidth;
    myTableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:myTableview];
    
    dataArr = self.detailModelArr;
    SLLog(@"%@",dataArr);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cellid";
    DetailImagesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[DetailImagesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    DetailImageModel *model = dataArr[indexPath.row];
    cell.model = model;
    
    return cell;
}

@end
