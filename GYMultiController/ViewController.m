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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //关注，喜欢，最热
    _titleArray = @[@"关注",@"喜欢",@"最热"];
    //1.导航条
    self.navigationItem.titleView = [self getTitleView];
    
    
    //2.控制器的view
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
    
    
    
    if (button.tag == 0) {
        
    }else if (button.tag == 1) {
        
    }else if (button.tag == 2) {
        
    }
}

- (void)moveLineWithButton:(UIButton *)button {
    [UIView animateWithDuration:0.25 animations:^{
        self.line.centerX = button.centerX;
    } completion:^(BOOL finished) {
        
    }];
}

@end
