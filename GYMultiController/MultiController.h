//
//  MultiController.h
//  GYMultiController
//
//  Created by yangguangyu on 17/2/19.
//  Copyright © 2017年 yangguangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiController : UIViewController

@property (nonatomic, strong) UIView *line;
@property (nonatomic, strong) UIButton *selectedButton;

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray<UIViewController *> *controllers;

- (void)setupAll;
//- (instancetype)initWithTitles:(NSArray *)titles controllers:(NSArray *)controllers;
@end
