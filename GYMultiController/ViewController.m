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

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray<UIViewController *> *controllers;

@property (nonatomic, strong) MultiController *multi;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _titleArray = @[@"关注",@"喜欢",@"最热"];
    _controllers = @[[UIViewController new],[UIViewController new],[UIViewController new]];
    
    _multi = [[MultiController alloc] initWithMainVC:self titles:_titleArray controllers:_controllers];
}



@end
