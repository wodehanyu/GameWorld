//
//  HeroViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroViewController.h"
#import "FreeHeroCell.h"
#import "FreeHeroViewModel.h"
@interface HeroViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView * freeHreoCollectionView;
@property(nonatomic,strong) UICollectionView * allHreoCollectionView;
@property(nonatomic,strong) UIView * titleView;
@property(nonatomic,strong) FreeHeroViewModel * freeModel;

@end
@implementation HeroViewController
- (id)init{
    if (self=[super init]) {
        self.title=@"英雄";
    }
    return self;
}
-(UIView*)titleView{
    if (!_titleView) {
        _titleView=[UIView new];
        [_titleView setBackgroundColor:kRGBColor(245, 245, 245)];
        [self.view addSubview:_titleView];
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(40);
            
        }];

        UIButton* but1=[UIButton buttonWithType:UIButtonTypeSystem];
        [but1 setTitle:@"免费英雄" forState:UIControlStateNormal];
        [but1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        but1.titleLabel.font=[UIFont systemFontOfSize:16];
        
        but1.tag=100;
        UIButton* but2=[UIButton buttonWithType:UIButtonTypeSystem];
        [but2 setTitle:@"全部英雄" forState:UIControlStateNormal];
        [but2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        but2.titleLabel.font=[UIFont systemFontOfSize:16];
        
        but2.tag=200;
        [_titleView addSubview:but1];
        [_titleView addSubview:but2];
        //添加按钮状态的监听
        [but1 bk_addObserverForKeyPath:@"selected" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld task:^(id obj, NSDictionary *change) {
            NSNumber* num=change[@"new"];
            if (num.integerValue==1) {
                [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                    but1.titleLabel.font=[UIFont systemFontOfSize:18];
                    but2.titleLabel.font=[UIFont systemFontOfSize:16];
                    [self.view addSubview:self.freeHreoCollectionView];
                    [self.freeHreoCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.top.mas_equalTo(self.titleView.mas_bottom).mas_equalTo(0);
                        make.bottom.right.left.mas_equalTo(0);
                    }];
                }];
            }
        }];
        [but2 bk_addObserverForKeyPath:@"selected" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld task:^(id obj, NSDictionary *change) {
            
            NSNumber* num=change[@"new"];
            if (num.integerValue==1) {
                but2.titleLabel.font=[UIFont systemFontOfSize:18];
                but1.titleLabel.font=[UIFont systemFontOfSize:16];
                [self.view addSubview:[UIView new]];
//                [[NSOperationQueue mainQueue]addOperationWithBlock:^{
//                    [self.view addSubview:self.freeHreoCollectionView];
//                    [self.freeHreoCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//                        make.top.mas_equalTo(self.titleView.mas_bottom).mas_equalTo(0);
//                        make.bottom.right.left.mas_equalTo(0);
//                    }];
//                }];
            }
        }];

        //添加事件响应
    
        [but1 bk_addEventHandler:^(UIButton* sender) {
            if(!sender.selected){
                but2.selected=NO;
                sender.selected=YES;
            }
        } forControlEvents:UIControlEventTouchUpInside];
        [but2 bk_addEventHandler:^(UIButton* sender) {
            if (!sender.selected) {
                sender.selected=YES;
                but1.selected=NO;
            }
        } forControlEvents:UIControlEventTouchUpInside];
        
        [but1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30);
            make.centerY.mas_equalTo(0);
            make.width.mas_equalTo(80);
        }];
        [but2 mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.right.mas_equalTo(-30);
            make.centerY.mas_equalTo(0);
            make.width.mas_equalTo(80);
        }];
    }
    return _titleView;
}
-(FreeHeroViewModel*)freeModel{
    if (!_freeModel) {
        _freeModel=[FreeHeroViewModel new];
    }
    return _freeModel;

}
-(UICollectionView*)freeHreoCollectionView{
    if (!_freeHreoCollectionView) {
        UICollectionViewFlowLayout* flowLayout=[UICollectionViewFlowLayout new];
        flowLayout.itemSize=CGSizeMake(125, 70);
        flowLayout.minimumLineSpacing=10.0F;
        _freeHreoCollectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _freeHreoCollectionView.backgroundColor=[UIColor whiteColor];
        _freeHreoCollectionView.delegate=self;
        _freeHreoCollectionView.dataSource=self;
        [_freeHreoCollectionView registerClass:[FreeHeroCell class] forCellWithReuseIdentifier:@"cell"];
        _freeHreoCollectionView.header=[MJRefreshHeader headerWithRefreshingBlock:^{
            if (self.freeModel && self.freeModel.rowNumber>0) {
                
            }else{
            [self.freeModel getDataFromNetCompleteHandle:^(NSError *error) {
                 if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_freeHreoCollectionView reloadData];
                    [_freeHreoCollectionView.header endRefreshing];
                }
                
            }];

            }
                        
        }];
        
    }
    return _freeHreoCollectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Factory addMenuItemToVC:self];
    [self.freeHreoCollectionView.header beginRefreshing];;
    UIButton* btn1=[self.titleView viewWithTag:100];
    btn1.selected=YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.freeModel.rowNumber;

}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FreeHeroCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.icon.imageView setImageWithURL:[self.freeModel iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.nameLB.text=[self.freeModel nameForRow:indexPath.row];
    cell.titleLB.text=[self.freeModel titleForRow:indexPath.row];
    cell.locationLB.text=[self.freeModel locationForRow:indexPath.row];
    return cell;
    
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
