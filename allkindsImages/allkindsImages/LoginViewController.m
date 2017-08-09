//
//  LoginViewController.m
//  allkindsImages
//
//  Created by EPIC_IOS on 2017/8/9.
//  Copyright © 2017年 ljm.ynyx. All rights reserved.
//

#import "LoginViewController.h"

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
  
}

@end
