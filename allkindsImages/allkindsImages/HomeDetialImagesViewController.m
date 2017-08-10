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
    CGFloat historyY;
}



@end

@implementation HomeDetialImagesViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarHidden = YES;
    
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

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarHidden = NO;
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
    myTableview.rowHeight = kselfWidth * 1.2;
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

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self updateImageViewCellOffset:(DetailImagesTableViewCell *)cell];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.navigationController.navigationBar.hidden = NO;
}

#pragma mark - UIScrollViewdelegate methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    for (DetailImagesTableViewCell *cell in myTableview.visibleCells) {
        [self updateImageViewCellOffset:cell];
    }
    
    CGFloat offsetY = scrollView.contentOffset.y + myTableview.contentInset.top;
    CGFloat panTranslationY = [scrollView.panGestureRecognizer translationInView:myTableview].y;
    if (offsetY > 64) {
        if (panTranslationY > 0) {
            //下滑趋势，显示
            self.navigationController.navigationBar.hidden = NO;
            
        }else{
            //上滑趋势，隐藏
            self.navigationController.navigationBar.hidden = YES;
        }
    }else{
        self.navigationController.navigationBar.hidden = NO;
    }
}


#pragma mark -- 设置偏移量
/**
 *  设置imageView的偏移量
 *
 */
- (void)updateImageViewCellOffset:(DetailImagesTableViewCell *)cell
{
    // 获取cell的偏移量
    CGFloat cellOffset = cell.frame.origin.y - myTableview.contentOffset.y;
    // 获取imageView的最大偏移量
    CGFloat imgMaxHeight = [cell imageOverflowHeight];
    // 计算imageView新的偏移量
    CGFloat offset = 0.0f - imgMaxHeight * cellOffset / myTableview.frame.size.height;
    // 设置imageView新的偏移量
    [cell setImageOffset:CGPointMake(0.0f, offset)];
    
}

@end
