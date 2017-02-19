//
//  ViewController.m
//  GYMultiController
//
//  Created by yangguangyu on 17/2/19.
//  Copyright © 2017年 yangguangyu. All rights reserved.
//

#import "ViewController.h"
#import "UtilsMacro.h"
#import "UIView+YGYAdd.h"

#define kCount 3
@interface ViewController ()

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) UIView *line;


@property (nonatomic, strong) UIButton *selectedButton;


@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSArray<UIViewController *> *controllers;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleArray = @[@"关注",@"喜欢",@"最热"];
    _controllers = @[[UIViewController new],[UIViewController new],[UIViewController new]];
    
    //1.导航条
    self.navigationItem.titleView = [self getTitleView];
    
    //2.控制器的view

    self.scrollView = [self getScrollView];
    
    [self.view addSubview:self.scrollView];
}

- (UIView *)getTitleView {
    UIView *navView = [[UIView alloc] init];
//    navView.backgroundColor = [UIColor redColor];
    navView.frame = Rect(0, 0, 200, 40);
    
    CGFloat width = navView.width/kCount;
    CGFloat height = navView.height;
    
    //button
    for (int i = 0; i < kCount; ++i) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        
        CGFloat x = i * width;
        button.tag = i;
        button.frame = Rect(x, 0, width, height);
        [button addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            self.selectedButton = button;
            self.selectedButton.selected = YES;
        }
        [navView addSubview:button];
    }
    
    
    //line
    UIView *line = [UIView new];
    CGFloat lineHeight = 3;
    line.frame = Rect(0, navView.height-lineHeight, width, lineHeight);
    line.backgroundColor = [UIColor blueColor];
    self.line = line;
    [navView addSubview:line];
    
    return navView;
}

- (UIScrollView *)getScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.pagingEnabled = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    scrollView.contentSize = Size(self.view.width * self.controllers.count, scrollView.height);
    
    
    for (int i = 0; i < self.controllers.count; ++i) {
        UIViewController *vc = self.controllers[i];
        
        UIView *view = vc.view;
        view.backgroundColor = YGYRandomColor;
        view.x = scrollView.width * i;
        [scrollView addSubview:vc.view];
        
    }
    
    return scrollView;
}

- (void)titleButtonClick:(UIButton *)button {
    if (self.selectedButton == button) {
        return;
    }
    
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    //line的动画
    [self moveLineWithButton:button];
    //scrollView的动画
    

}

- (void)moveLineWithButton:(UIButton *)button {
    [UIView animateWithDuration:0.25 animations:^{
        self.line.centerX = button.centerX;
    } completion:^(BOOL finished) {
        
    }];
}


@end
