//
//  HeroDetailViewController.m
//  BaseProject
//
//  Created by YGZ on 16/8/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "HreoDetilTitleViewModel.h"
#import "TRImageView.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define KMutiplier 0.16
@interface HeroDetailViewController ()
@property(nonatomic,strong)HreoDetilTitleViewModel* model;
@property(nonatomic,strong)UIView* TitleView;
@end

@implementation HeroDetailViewController
-(HreoDetilTitleViewModel*)model{
    if (!_model) {
        _model=[[HreoDetilTitleViewModel alloc]initWithEnName:_enName];
    }
    return _model;

}
-(UIView*)TitleView{
    if (!_TitleView) {
        _TitleView=[UIView new];
        _TitleView.backgroundColor=[UIColor whiteColor];
        TRImageView* imageView=[TRImageView new];
        [imageView.imageView setImageWithURL:self.model.iconURL placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [_TitleView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(7);
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(16);
            make.width.mas_equalTo(imageView.mas_height).mas_equalTo(0);
            
        }];
        
        UILabel* titleLB=[UILabel label];
        titleLB.font=[UIFont systemFontOfSize:16];
        titleLB.textColor=[UIColor blackColor];
        titleLB.text=self.model.name;
        [imageView addSubview:titleLB];
        [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(8);
            make.top.mas_equalTo(15);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(25);
            
        }];
        
        UILabel* tagsLB=[UILabel label];
        tagsLB.font=[UIFont systemFontOfSize:14];
        tagsLB.textAlignment=NSTextAlignmentCenter;
        tagsLB.textColor=[UIColor whiteColor];
        tagsLB.backgroundColor=kRGBColor(73, 101, 150);
        tagsLB.text=self.model.tags;
        [_TitleView addSubview:tagsLB];
        [tagsLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titleLB.mas_right).mas_equalTo(2);
            make.centerY.mas_equalTo(titleLB.mas_centerY).mas_equalTo(0);
            make.width.mas_equalTo(35);
            make.height.mas_equalTo(25);
        }];
        
        UILabel* priceLB=[UILabel label];
        priceLB.font=[UIFont systemFontOfSize:14];
        priceLB.backgroundColor=[UIColor whiteColor];
        priceLB.textColor=kRGBColor(142, 143, 144);
        priceLB.text=self.model.price;
        [_TitleView addSubview:priceLB];
        [priceLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titleLB.mas_left).mas_equalTo(0);
            make.right.mas_equalTo(tagsLB.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(titleLB.mas_bottom).mas_equalTo(5);
            make.height.mas_equalTo(20);
        }];
        
        UILabel* attackLB=[UILabel label];
        attackLB.font=[UIFont systemFontOfSize:14];
        attackLB.textColor=kRGBColor(142, 143, 144);
        attackLB.backgroundColor=[UIColor whiteColor];
        attackLB.text=[NSString stringWithFormat:@"攻%@",self.model.attack];
        [_TitleView addSubview:attackLB];
        [attackLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titleLB.mas_left).mas_equalTo(0);
            make.top.mas_equalTo(priceLB.mas_bottom).mas_equalTo(3);
            make.height.mas_equalTo(priceLB.mas_height).mas_equalTo(0);
            make.width.mas_equalTo(25);
            
        }];
        
        UILabel* defenseLB=[UILabel label];
        defenseLB.font=[UIFont systemFontOfSize:14];
        defenseLB.textColor=kRGBColor(142, 143, 144);
        defenseLB.backgroundColor=[UIColor whiteColor];
        defenseLB.text=[NSString stringWithFormat:@"防%@",self.model.defense];
        [_TitleView addSubview:defenseLB];
        [defenseLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(attackLB.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(priceLB.mas_bottom).mas_equalTo(3);
            make.height.mas_equalTo(priceLB.mas_height).mas_equalTo(0);
            make.width.mas_equalTo(25);
            
        }];
        
        UILabel* magicLB=[UILabel label];
        magicLB.font=[UIFont systemFontOfSize:14];
        magicLB.textColor=kRGBColor(142, 143, 144);
        magicLB.backgroundColor=[UIColor whiteColor];
        magicLB.text=[NSString stringWithFormat:@"法%@",self.model.magic];
        [_TitleView addSubview:magicLB];
        [magicLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(defenseLB.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(priceLB.mas_bottom).mas_equalTo(3);
            make.height.mas_equalTo(priceLB.mas_height).mas_equalTo(0);
            make.width.mas_equalTo(25);
            
        }];

        
        UILabel* difficutyLB=[UILabel label];
        difficutyLB.font=[UIFont systemFontOfSize:14];
        difficutyLB.textColor=kRGBColor(142, 143, 144);
        difficutyLB.backgroundColor=[UIColor whiteColor];
        difficutyLB.text=[NSString stringWithFormat:@"法%@",self.model.difficulty];
        [_TitleView addSubview:difficutyLB];
        [difficutyLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(magicLB.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(priceLB.mas_bottom).mas_equalTo(3);
            make.height.mas_equalTo(priceLB.mas_height).mas_equalTo(0);
            make.width.mas_equalTo(40);
            
        }];
        
        
        
        
    }
    return _TitleView;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.TitleView];
    [self.TitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(KMutiplier*kScreenHeight);
        
    }];
    
    
    
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
