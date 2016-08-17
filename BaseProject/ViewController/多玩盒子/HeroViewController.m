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
#import "AllHeroViewModel.h"
#import "AllHeroCell.h"
#import "HeroDetailViewController.h"
@interface HeroViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView * freeHreoCollectionView;
@property(nonatomic,strong) UICollectionView * allHreoCollectionView;
@property(nonatomic,strong) UIView * titleView;
@property(nonatomic,strong) FreeHeroViewModel * freeModel;
@property(nonatomic,strong) AllHeroViewModel * allModel;

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
                    if (![self.freeHreoCollectionView isDescendantOfView:self.view]) {
                        [self.view addSubview:self.freeHreoCollectionView];
                        [self.freeHreoCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.mas_equalTo(self.titleView.mas_bottom).mas_equalTo(0);
                            make.left.right.bottom.mas_equalTo(0);
                        }];
                    }else if ([self.allHreoCollectionView isDescendantOfView:self.view ]) {
                        [self.allHreoCollectionView setHidden:YES];
                        //[self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
                    }
                    
                }];
            }
        }];
        [but2 bk_addObserverForKeyPath:@"selected" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld task:^(id obj, NSDictionary *change) {
            NSNumber* num=change[@"new"];
            if (num.integerValue==1) {
                [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                    but2.titleLabel.font=[UIFont systemFontOfSize:18];
                    but1.titleLabel.font=[UIFont systemFontOfSize:16];
                    if (![self.allHreoCollectionView isDescendantOfView:self.view]) {
                        [self.view insertSubview:self.allHreoCollectionView aboveSubview:self.freeHreoCollectionView];
                        [self.allHreoCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.mas_equalTo(self.titleView.mas_bottom).mas_equalTo(0);
                            make.bottom.right.left.mas_equalTo(0);
                        }];
                        
                    }else{
                        [self.allHreoCollectionView setHidden:NO];
                    }
                }];
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
        /**
         *为两个按钮添加约束
         */
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
        flowLayout.itemSize=CGSizeMake(170, 100);
        flowLayout.minimumLineSpacing=10.0F;
        _freeHreoCollectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _freeHreoCollectionView.backgroundColor=[UIColor whiteColor];
        _freeHreoCollectionView.delegate=self;
        _freeHreoCollectionView.dataSource=self;
        [_freeHreoCollectionView registerClass:[FreeHeroCell class] forCellWithReuseIdentifier:@"cell"];
        _freeHreoCollectionView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            if (self.freeModel && self.freeModel.rowNumber>0) {
               [_freeHreoCollectionView.header endRefreshing];
            }else{
                [self.freeModel getDataFromNetCompleteHandle:^(NSError *error) {
                    if (error) {
                        [self showErrorMsg:error.localizedDescription];
                    }else{
                        
                        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                            [_freeHreoCollectionView reloadData];
                            [_freeHreoCollectionView.header endRefreshing];
                        }];
                    }
                }];
         
            }
        }];
        
        [_allHreoCollectionView.header beginRefreshing];
    }
    return _freeHreoCollectionView;
}
-(AllHeroViewModel*)allModel{
    if (!_allModel) {
        _allModel=[AllHeroViewModel new];
    }
    return _allModel;
}
-(UICollectionView*)allHreoCollectionView{
    if (!_allHreoCollectionView) {
        UICollectionViewFlowLayout* flowLayout=[UICollectionViewFlowLayout new];
        flowLayout.itemSize=CGSizeMake(70, 75);
        flowLayout.minimumLineSpacing=5.0f;
        flowLayout.minimumInteritemSpacing=10.f;
        flowLayout.sectionInset=UIEdgeInsetsMake(5, 15, 10, 15);
        _allHreoCollectionView=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _allHreoCollectionView.backgroundColor=[UIColor whiteColor];
        _allHreoCollectionView.delegate=self;
        _allHreoCollectionView.dataSource=self;
        [_allHreoCollectionView registerClass:[AllHeroCell class] forCellWithReuseIdentifier:@"cell"];
        
        _allHreoCollectionView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            if (self.allModel && self.allModel.rowNumber>0){
                [_allHreoCollectionView.header endRefreshing];
            }else{
                [self.allModel getDataFromNetCompleteHandle:^(NSError *error) {
                    if (error) {
                        [self showErrorMsg:error.localizedDescription];
                        
                    }else{
                        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                            [_allHreoCollectionView reloadData];
                            [_allHreoCollectionView.header endRefreshing];
                        }];
                    }
                }];
            }            
        }];
        
        [_allHreoCollectionView.header beginRefreshing];
    }
    return _allHreoCollectionView;

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
    if ([collectionView isEqual:self.freeHreoCollectionView]) {
        return self.freeModel.rowNumber;
    }else{
        return self.allModel.rowNumber;
    }
    

}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([collectionView isEqual:self.freeHreoCollectionView]) {
        FreeHeroCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.icon.imageView setImageWithURL:[self.freeModel iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.nameLB.text=[self.freeModel nameForRow:indexPath.row];
    cell.titleLB.text=[self.freeModel titleForRow:indexPath.row];
    cell.locationLB.text=[self.freeModel locationForRow:indexPath.row];
    return cell;
    }else{
        AllHeroCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        [cell.iconIV.imageView setImageWithURL:[self.allModel iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        cell.nameLB.text=[self.allModel nameForRow:indexPath.row];
    return cell;
    }
        
}
#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    HeroDetailViewController* vc=[HeroDetailViewController new];
    if ([collectionView isEqual:self.freeHreoCollectionView]) {
        vc.enName=[self.freeModel enNameForRow:indexPath.row];
    }else{
        vc.enName=[self.allModel enNameForRow:indexPath.row];
    }
    [self.navigationController pushViewController:vc animated:YES];
    

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
