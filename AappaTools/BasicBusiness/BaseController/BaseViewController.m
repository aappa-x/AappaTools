//
//  BaseViewController.m
//  AappaTools
//
//  Created by Tyler on 2020/3/10.
//  Copyright © 2020 Aappa. All rights reserved.
//

#import "BaseViewController.h"
#import "LoginViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor qmui_colorWithHexString:@"F1F1F1"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.delegate = self;
    self.navigationController.navigationBar.tintColor = [UIColor qmui_colorWithHexString:@"FFFFFF"];
    self.navigationController.navigationBar.barTintColor = [UIColor qmui_colorWithHexString:@"F33252"];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showLoginVC) name:@"showLoginVC" object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"showLoginVC" object:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (BOOL)isShowNavigationBar
{
    return YES;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    BOOL isShowNaviBar = YES;
    
    if ([viewController isKindOfClass:[BaseViewController class]]) {
        isShowNaviBar = [(BaseViewController *)viewController isShowNavigationBar];
    }
    
    [self.navigationController setNavigationBarHidden:!isShowNaviBar animated:YES];
}

- (void)showLoginVC
{
    if ([self.navigationController.topViewController isKindOfClass:[LoginViewController class]]) {
        
    } else {
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:loginVC animated:YES];
    }
}

@end
