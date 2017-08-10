//
//  HomeDetailViewController.m
//  allkindsImages
//
//  Created by ljm on 2017/8/10.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "DetailModel.h"
#import "DetailTableViewCell.h"

@interface HomeDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *myTableview;
    NSMutableArray *dataArr;
    NSString *titleHead;
}

@end

@implementation HomeDetailViewController

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
    return cell;
}

@end
