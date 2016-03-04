//
//  ViewController.m
//  GCD
//
//  Created by xiaofu on 16/3/3.
//  Copyright © 2016年 xiaofu. All rights reserved.
//
/*
 GCD 全称是Grand Central Dispath 纯C语言编写，提供非常多强大的函数，是苹果推荐的多线程开发方法，NSOperation就是基于GCD的封装。
 GCD的优势：
   为多核的并行运算提出了解决方案
   GCD会自动利用更多的cpu内核
   GCD自动管理线程的生命周期（创建线程，调度任务，销毁线程）
   程序员只需告诉GCD要紧执行什么任务，不需要编写任何线程管理代码
 GCD的两个核心概念
   任务：执行什么操作
   队列：用来存放任务
 队列有两大类型：
   串行队列：(Serial Dispatch Queue)只有一个线程 依次执行
   并发队列：(Concurrent Dispatch Queue)多个线程，操作在可用的处理器上，同时保证先进来优先处理
   主队列 主队列永远只有一个线程－－－主线程，用来执行主线程的操作任务。
 采用GCD做多线程，可以抽象为两步
   找到队列
   在队列中用同步还异步的方式执行任务
 执行队列中任务的两个执行方式
   sync同步：只能在当前线程执行任务，不具备开启新线程的能力
   async异步：可以在新的线程中执行任务，具备开启新线程的能力
 同步串行：在主线程 等当前线程运行完了，再主线程创建新的线程
 异步串行：在子线程 等当前线程运行完了，再创建新的线程
 同步并行；在主线程
 异步并行：在子线程
 
 
 
 
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#pragma mark －－－－－－－串行同步 －－－－－－－
  /*  //找到队列  1.队列的名字 2.该队列的类型
    dispatch_queue_t serialQuequ = dispatch_queue_create("SerialQuequ", DISPATCH_QUEUE_SERIAL);
    //给队列指定任务 1.任务在哪个队列完成 2。想要的操作
    dispatch_sync(serialQuequ, ^{
        
    });
#pragma mark ----------串行异步 -----------
    //找到队列  1.队列的名字 2.该队列的类型
    dispatch_queue_t serialQuequ =  dispatch_queue_create("serialQuequ", DISPATCH_QUEUE_SERIAL);
    //给队列指定任务 1.任务在哪个队列完成 2。想要的操作
    dispatch_async(serialQuequ, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
#pragma mark -------并行同步--------------
    //找到队列  1.队列的名字 2.该队列的类型
    dispatch_queue_t concurrent = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    //给队列指定任务 1.任务在哪个队列完成 2。想要的操作
    dispatch_sync(concurrent, ^{
        
    });
#pragma mark -------并行异步--------------
    //找到队列  1.队列的名字 2.该队列的类型
    dispatch_queue_t concurrent = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    //给队列指定任务 1.任务在哪个队列完成 2。想要的操作
    dispatch_async(concurrent, ^{
        
    });
    */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
