//
//  AppDelegate.m
//  GCD
//
//  Created by xiaofu on 16/3/3.
//  Copyright © 2016年 xiaofu. All rights reserved.
//
#import "AppDelegate.h"
#import "MoreViewController.h"
#import "ViewController.h"
#import "OneViewController.h"
#import "GCDViewController.h"
@interface AppDelegate ()
{
    UIViewController *VC;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    VC = [[UIViewController alloc]init];
    
    VC.view.backgroundColor = [UIColor whiteColor];
    
    VC.title = @"GCD";
    
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:VC];
    
    UIButton *button0 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button0.frame = CGRectMake(100, 200, 0,0);
    
    [button0 setTitle:@"GCD的四种使用方式" forState:UIControlStateNormal];
    
    [button0 sizeToFit];
    
    [VC.view addSubview:button0];
    
    [button0 addTarget:self action:@selector(clickBtn0) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button1.frame = CGRectMake(100, 300, 0,0);
    
    [button1 setTitle:@"多线程加载一张图片" forState:UIControlStateNormal];
    
    [button1 sizeToFit];
    
    [VC.view addSubview:button1];
    
    [button1 addTarget:self action:@selector(clickBtn1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button2.frame = CGRectMake(100, 400, 0,0);
    
    [button2 setTitle:@"多线程加载多张图片" forState:UIControlStateNormal];
    
    [button2 sizeToFit];
    
    [VC.view addSubview:button2];
    
    [button2 addTarget:self action:@selector(clickBtn2) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button3.frame = CGRectMake(100, 500, 0,0);
    
    [button3 setTitle:@"线程锁" forState:UIControlStateNormal];
    
    [button3 sizeToFit];
    
    button3.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [VC.view addSubview:button3];
    
    [button3 addTarget:self action:@selector(clickBtn3) forControlEvents:UIControlEventTouchUpInside];
    
    
    [button0 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    return YES;
}

- (void)clickBtn0{
    
    [VC.navigationController pushViewController:[ViewController new] animated:YES];
    
}

- (void)clickBtn1{
    
    [VC.navigationController pushViewController:[OneViewController new] animated:YES];
}

- (void)clickBtn2{
    
    [VC.navigationController pushViewController:[MoreViewController new] animated:YES];
    
}

- (void)clickBtn3{
    
    [VC.navigationController pushViewController:[GCDViewController new] animated:YES];
}


@end