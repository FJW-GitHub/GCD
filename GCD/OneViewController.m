//
//  OneViewController.m
//  GCD
//
//  Created by xiaofu on 16/3/3.
//  Copyright © 2016年 xiaofu. All rights reserved.
//

#import "OneViewController.h"
#define kurl @"http://store.storeimages.cdn-apple.com/8748/as-images.apple.com/is/image/AppleInc/aos/published/images/s/38/s38ga/rdgd/s38ga-rdgd-sel-201601?wid=848&hei=848&fmt=jpeg&qlt=80&op_sharpen=0&resMode=bicub&op_usm=0.5,0.5,0,0&iccEmbed=0&layer=comp&.v=1454777389943"
@interface OneViewController ()
{
    UIImageView *imageView;
    UIImage *image;
}
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //创建视图
    imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:imageView];
    //创建一个串行队列
    dispatch_queue_t SerialQuequ = dispatch_queue_create("SerialQuequ", DISPATCH_QUEUE_SERIAL);
    //用异步方式执行串行队列中的任务
    dispatch_async(SerialQuequ, ^{
        //加载网络资源
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:kurl]];
        image = [UIImage imageWithData:data];
        //回到主线程 回到主队列(一般都是同步执行的)
        dispatch_queue_t mainQuequ = dispatch_get_main_queue();
        dispatch_sync(mainQuequ, ^{
            imageView.image = image;
        });
    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
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
