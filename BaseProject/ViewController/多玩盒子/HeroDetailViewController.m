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
#import "Factory.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define KMutiplier 0.16
#define kTitleTinColor kRGBColor(244, 245, 246)
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
        _TitleView.backgroundColor=kTitleTinColor;
        TRImageView* imageView=[TRImageView new];
        [_TitleView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(7);
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-16);
            make.width.mas_equalTo(imageView.mas_height).mas_equalTo(0);
            
        }];
        
        UILabel* titleLB=[UILabel label];
        titleLB.font=[UIFont systemFontOfSize:14];
        titleLB.textColor=[UIColor blackColor];
        titleLB.backgroundColor=kTitleTinColor;
        titleLB.textAlignment=NSTextAlignmentLeft;
        [_TitleView addSubview:titleLB];
        [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(8);
            make.top.mas_equalTo(15);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(25);
            
        }];
        
        UILabel* tagsLB=[UILabel label];
        tagsLB.font=[UIFont systemFontOfSize:13];
        tagsLB.textAlignment=NSTextAlignmentCenter;
        tagsLB.textColor=[UIColor whiteColor];
        tagsLB.backgroundColor=kRGBColor(73, 101, 150);
        tagsLB.layer.cornerRadius=12.5;
        tagsLB.layer.masksToBounds=YES;
        [_TitleView addSubview:tagsLB];
        [tagsLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titleLB.mas_right).mas_equalTo(2);
            make.centerY.mas_equalTo(titleLB.mas_centerY).mas_equalTo(0);
            make.width.mas_equalTo(45);
            make.height.mas_equalTo(25);
        }];
        
        UILabel* priceLB=[UILabel label];
        priceLB.font=[UIFont systemFontOfSize:13];
        priceLB.backgroundColor=kTitleTinColor;
        priceLB.textAlignment=NSTextAlignmentLeft;
        priceLB.textColor=kRGBColor(142, 143, 144);
        [_TitleView addSubview:priceLB];
        [priceLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titleLB.mas_left).mas_equalTo(0);
            make.right.mas_equalTo(tagsLB.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(titleLB.mas_bottom).mas_equalTo(5);
            make.height.mas_equalTo(20);
        }];
        
        UILabel* attackLB=[UILabel label];
        attackLB.font=[UIFont systemFontOfSize:13];
        attackLB.textColor=kRGBColor(142, 143, 144);
        attackLB.backgroundColor=kTitleTinColor;
        [_TitleView addSubview:attackLB];
        [attackLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titleLB.mas_left).mas_equalTo(0);
            make.top.mas_equalTo(priceLB.mas_bottom).mas_equalTo(3);
            make.height.mas_equalTo(priceLB.mas_height).mas_equalTo(0);
            make.width.mas_equalTo(25);
            
        }];
        
        UILabel* defenseLB=[UILabel label];
        defenseLB.font=[UIFont systemFontOfSize:13];
        defenseLB.textColor=kRGBColor(142, 143, 144);
        defenseLB.backgroundColor=kTitleTinColor;
        [_TitleView addSubview:defenseLB];
        [defenseLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(attackLB.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(priceLB.mas_bottom).mas_equalTo(3);
            make.height.mas_equalTo(priceLB.mas_height).mas_equalTo(0);
            make.width.mas_equalTo(25);
            
        }];
        
        UILabel* magicLB=[UILabel label];
        magicLB.font=[UIFont systemFontOfSize:13];
        magicLB.textColor=kRGBColor(142, 143, 144);
        magicLB.backgroundColor=kTitleTinColor;
        [_TitleView addSubview:magicLB];
        [magicLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(defenseLB.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(priceLB.mas_bottom).mas_equalTo(3);
            make.height.mas_equalTo(priceLB.mas_height).mas_equalTo(0);
            make.width.mas_equalTo(25);
            
        }];

        
        UILabel* difficutyLB=[UILabel label];
        difficutyLB.font=[UIFont systemFontOfSize:13];
        difficutyLB.textColor=kRGBColor(142, 143, 144);
        difficutyLB.backgroundColor=kTitleTinColor;
        [_TitleView addSubview:difficutyLB];
        [difficutyLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(magicLB.mas_right).mas_equalTo(0);
            make.top.mas_equalTo(priceLB.mas_bottom).mas_equalTo(3);
            make.height.mas_equalTo(priceLB.mas_height).mas_equalTo(0);
            make.width.mas_equalTo(40);
            
        }];
        
        
        [self.model getDataFromNetCompleteHandle:^(NSError *error) {
            if (!error) {
                [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                    difficutyLB.text=[NSString stringWithFormat:@"难度%@",self.model.difficulty];
                    magicLB.text=[NSString stringWithFormat:@"法%@",self.model.magic];
                    priceLB.text=self.model.price;
                    tagsLB.text=self.model.tags;
                    [imageView.imageView setImageWithURL:self.model.iconURL placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
                    titleLB.text=self.model.name;
                    attackLB.text=[NSString stringWithFormat:@"攻%@",self.model.attack];
                    defenseLB.text=[NSString stringWithFormat:@"防%@",self.model.defense];
                    
                }];
            }
        }];


        
        
        
        
    }
    return _TitleView;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.]
    [Factory addBackItemToVC:self];
        self.title=self.model.name;
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
