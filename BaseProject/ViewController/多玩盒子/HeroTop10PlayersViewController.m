//
//  HeroTop10PlayersViewController.m
//  BaseProject
//
//  Created by YGZ on 16/8/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeroTop10PlayersViewController.h"

@interface HeroTop10PlayersViewController ()

@end

@implementation HeroTop10PlayersViewController
-(instancetype)initWithEnName:(NSString *)enName{
    if (self=[super init]) {
        _enName=enName;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
