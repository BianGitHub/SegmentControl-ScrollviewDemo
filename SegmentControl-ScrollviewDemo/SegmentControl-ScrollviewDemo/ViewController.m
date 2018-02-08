//
//  ViewController.m
//  SegmentControl-ScrollviewDemo
//
//  Created by 边雷 on 2018/2/8.
//  Copyright © 2018年 Mac-b. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH self.view.bounds.size.width
#define SCREEN_HEIGHT self.view.bounds.size.height

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //
    [self setUI];
}

#pragma mark - setUI
- (void)setUI {
    
    NSArray *arr = @[@"登录一",@"登录二"];
    
    // 创建segmentControl
    UISegmentedControl *segmentC = [[UISegmentedControl alloc] initWithItems:arr];
    segmentC.frame = CGRectMake(20, 20, SCREEN_WIDTH - 20 * 2, 44);
    segmentC.selectedSegmentIndex = 0;//设置默认选择项索引
    [segmentC addTarget:self action:@selector(segmentCAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentC];
    
    // 创建scrollview
    self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64,SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    self.scrollview.backgroundColor = [UIColor redColor];
    self.scrollview.delegate = self;
    self.scrollview.alwaysBounceHorizontal = YES;
    self.scrollview.contentSize = CGSizeMake(self.view.bounds.size.width * 2, self.view.bounds.size.height-164);
    self.scrollview.pagingEnabled = YES;
    self.scrollview.bounces = NO;
    [self.view addSubview:self.scrollview];
}

#pragma mark - segmentCAction
- (void)segmentCAction:(UISegmentedControl *)segmentC {
    NSLog(@"%zd", segmentC.selectedSegmentIndex);
}

@end
