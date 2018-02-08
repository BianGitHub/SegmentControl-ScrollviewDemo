//
//  ViewController.m
//  SegmentControl-ScrollviewDemo
//
//  Created by 边雷 on 2018/2/8.
//  Copyright © 2018年 Mac-b. All rights reserved.
//

#import "ViewController.h"
#import "LoginView1.h"
#import "LoginView2.h"

#define SCREEN_WIDTH self.view.bounds.size.width
#define SCREEN_HEIGHT self.view.bounds.size.height

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, strong) LoginView1 *view1;
@property (nonatomic, strong) LoginView2 *view2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64,SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    self.scrollview.delegate = self;
    self.scrollview.alwaysBounceHorizontal = YES;
    self.scrollview.contentSize = CGSizeMake(SCREEN_WIDTH * 2, SCREEN_HEIGHT - 64);
    self.scrollview.pagingEnabled = YES;
    self.scrollview.bounces = NO;
    [self.view addSubview:self.scrollview];
    
    // 创建view
    _view1 = [[LoginView1 alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.scrollview.frame.size.height)];
    [self.scrollview addSubview:_view1];
    
    _view2 = [[LoginView2 alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, self.scrollview.frame.size.height)];
    [self.scrollview addSubview:_view2];
}

#pragma mark - segmentCAction
- (void)segmentCAction:(UISegmentedControl *)segmentC {
    NSLog(@"%zd", segmentC.selectedSegmentIndex);
}

@end
