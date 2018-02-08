//
//  LoginView1.m
//  SegmentControl-ScrollviewDemo
//
//  Created by 边雷 on 2018/2/8.
//  Copyright © 2018年 Mac-b. All rights reserved.
//

#import "LoginView1.h"

@interface LoginView1()
@property (nonatomic, strong) UITextField *tf;
@end

@implementation LoginView1

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

- (void)setUI{
    self.backgroundColor = [UIColor redColor];
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, self.frame.size.width-40, 50)];
    self.tf.placeholder = @"请输入密码";
    self.tf.borderStyle = UITextBorderStyleLine;
    self.tf.keyboardType = UIKeyboardTypeNumberPad;
    self.tf.backgroundColor = [UIColor whiteColor];
    self.tf.textColor = [UIColor blackColor];
    [self addSubview:self.tf];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.tf endEditing:YES];
}

@end
