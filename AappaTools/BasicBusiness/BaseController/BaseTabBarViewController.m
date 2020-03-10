//
//  BaseTabBarViewController.m
//  AappaTools
//
//  Created by Tyler on 2020/3/10.
//  Copyright © 2020 Aappa. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseNavigationViewController.h"
#import "HomeViewController.h"
#import "MineViewController.h"

@interface BaseTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tabBar.tintColor = [UIColor qmui_colorWithHexString:@"F33252"];
    self.delegate = self;
    
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    BaseNavigationViewController *homeNavigationController = [[BaseNavigationViewController alloc] initWithRootViewController:homeViewController];
    homeViewController.tabBarItem.title = @"首页";
    homeViewController.tabBarItem.image = [UIImage systemImageNamed:@"house.fill"];
    homeViewController.tabBarItem.selectedImage = [UIImage systemImageNamed:@"house.fill"];
    [self addChildViewController:homeNavigationController];

    MineViewController *mineViewController = [[MineViewController alloc] init];
    BaseNavigationViewController *mineNavigationController = [[BaseNavigationViewController alloc] initWithRootViewController:mineViewController];
    mineViewController.tabBarItem.title = @"我的";
    mineViewController.tabBarItem.image = [UIImage systemImageNamed:@"person.fill"];
    mineViewController.tabBarItem.selectedImage = [UIImage systemImageNamed:@"person.fill"];
    [self addChildViewController:mineNavigationController];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
//    if (viewController == self.viewControllers[2] && ![AccountInfoModel infoModel].isLogin) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"showLoginVC" object:self];
//        return NO;
//    }
//
//    if (viewController == self.viewControllers[3] && ![AccountInfoModel infoModel].isLogin) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"showLoginVC" object:self];
//        return NO;
//    }
    return YES;
}

@end
