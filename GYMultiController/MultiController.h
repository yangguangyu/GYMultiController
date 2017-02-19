//
//  MultiController.h
//  GYMultiController
//
//  Created by yangguangyu on 17/2/19.
//  Copyright © 2017年 yangguangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiController : NSObject

@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIButton *selectedButton;

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray<UIViewController *> *controllers;


- (instancetype)initWithMainVC:(UIViewController *)vc titles:(NSArray *)titles controllers:(NSArray *)controllers;
@end
