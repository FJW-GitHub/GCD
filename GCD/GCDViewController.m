//
//  GCDViewController.m
//  GCD
//
//  Created by xiaofu on 16/3/3.
//  Copyright © 2016年 xiaofu. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()
{
    NSLock *lock;
}
@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    lock = [NSLock new];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    __block int ticketNum = 10;
    dispatch_queue_t conturrent = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 15; i++) {
        dispatch_async(conturrent, ^{
//            [lock lock];
//            if (ticketNum > 0) {
//                ticketNum--;
//                NSLog(@"还剩下%d张票",ticketNum);
//            }
//            [lock unlock];
//            只让与self相关的线程进行一次
            @synchronized(self) {
                if (ticketNum > 0) {
                    ticketNum--;
                    NSLog(@"还剩下%d张票",ticketNum);
                }
            }
        });
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
