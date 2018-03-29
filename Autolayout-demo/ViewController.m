//
//  ViewController.m
//  coredata-demo
//
//  Created by shujucn on 26/03/2018.
//  Copyright © 2018 shuju. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) MASConstraint *topConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self masonryLayout];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)masonryLayout {
    
    UIView *superView = [[UIView alloc] init];
    superView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:superView];
    [superView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.equalTo(self);
    }];
    
    UIView *subRedView = [[UIView alloc] init];
    subRedView.backgroundColor = [UIColor redColor];
    [superView addSubview:subRedView];
    [subRedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(subRedView);
        make.left.equalTo(subRedView);
        make.width.equalTo(subRedView);
        make.height.equalTo(subRedView);
    }];
    
    [subRedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@18);
        make.left.equalTo(@16);
        make.width.equalTo(@16);
        make.height.equalTo(@16);
    }];
    
    [subRedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(18);
        make.centerY.mas_equalTo(16);
        make.width.mas_equalTo(16);
        make.height.mas_equalTo(16);
    }];
    
    [subRedView mas_makeConstraints:^(MASConstraintMaker *make) {
        _topConstraint = make.top.equalTo(superView.mas_top).with.offset(10);
        //这里是保存了已经设定好的约束
        make.left.equalTo(superView.mas_left).with.offset(10);
    }];
    
    //之后需要取消的时候
    [_topConstraint uninstall];
    
    //也可以安装
    [_topConstraint install];
    
    UIView *subGreenView = [[UIView alloc] init];
    subGreenView.backgroundColor = [UIColor greenColor];
    
    [subGreenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(subGreenView.mas_left).offset(10);
        make.right.equalTo(subGreenView.mas_right).offset(10);
    }];
    
    [subGreenView mas_makeConstraints:^(MASConstraintMaker *make) {
        //width >= 200 && width <= 400
        make.width.mas_lessThanOrEqualTo(200);
        make.width.mas_greaterThanOrEqualTo(400);
    }];
    
    
    UIView *subGrayView = [[UIView alloc] init];
    subGrayView.backgroundColor = [UIColor grayColor];
    
}


@end
