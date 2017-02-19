//
//  ViewController.m
//  GYMultiController
//
//  Created by yangguangyu on 17/2/19.
//  Copyright © 2017年 yangguangyu. All rights reserved.
//

#import "ViewController.h"
#import "MultiController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.titleArray = @[@"关注",@"喜欢",@"最热"];
    self.controllers = @[[UIViewController new],[UIViewController new],[UIViewController new]];
    
    [self setupAll];
    
}



@end
