//
//  MoreViewController.m
//  GCD
//
//  Created by xiaofu on 16/3/3.
//  Copyright © 2016年 xiaofu. All rights reserved.
//

#import "MoreViewController.h"
#define kurl @"http://store.storeimages.cdn-apple.com/8748/as-images.apple.com/is/image/AppleInc/aos/published/images/s/38/s38ga/rdgd/s38ga-rdgd-sel-201601?wid=848&hei=848&fmt=jpeg&qlt=80&op_sharpen=0&resMode=bicub&op_usm=0.5,0.5,0,0&iccEmbed=0&layer=comp&.v=1454777389943"
@interface MoreViewController ()
{
    UIImage *image;
    dispatch_queue_t serialQueue;
}
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int imageIndex = 100;
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    for (int i = 0; i < 3; i++) {
        for (int y = 0; y < 2; y++) {
            UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(10+200*y,10+200*i, 200, 200)];
            imageView.backgroundColor = [UIColor redColor];
            [self.view addSubview:imageView];
            imageView.tag = imageIndex++;
        }
    }
//    //获取到系统的全局并行队列
//    dispatch_queue_t concurrent = dispatch_get_global_queue(0, 0);//优先级  保留参数
    //串行队列
    serialQueue = dispatch_queue_create("dd", DISPATCH_QUEUE_SERIAL);
   //指定任务
    for (int i = 0;  i < 6;  i++) {
        dispatch_async(serialQueue, ^{
            [NSThread sleepForTimeInterval:1];
            //加载网络资源
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:kurl]];
            image = [UIImage imageWithData:data];
            //回到主队列 刷新UI
            dispatch_sync(dispatch_get_main_queue(), ^{
                UIImageView *imageView =[self.view viewWithTag:100+i];
                imageView.image = image;
                
            });
        
        });

    }
    [self controlBtn];
}
- (void)controlBtn{
    
    
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:@[@"暂停",@"开启",]];
    
    segment.frame = CGRectMake(50, 620, 300, 50);
    
    segment.apportionsSegmentWidthsByContent = YES;
    
    [self.view addSubview:segment];
    
    [segment addTarget:self action:@selector(clickSegment:) forControlEvents:UIControlEventValueChanged];
}

- (void)clickSegment:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
            
        case 0:{
            
            dispatch_suspend(serialQueue);
        }break;
            
        case 1:{
             
            dispatch_resume(serialQueue);
            
        }break;
            
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
