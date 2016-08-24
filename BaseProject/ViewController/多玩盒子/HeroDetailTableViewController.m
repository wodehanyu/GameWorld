//
//  HeroDetailTableViewController.m
//  BaseProject
//
//  Created by YGZ on 16/8/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeroDetailTableViewController.h"
#import "SkillInfoTableViewCell.h"
#import "HeroDetailNomalTableViewCell.h"
#import "HeroDetailViewModel.h"
#import <UITableView+FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>
@interface HeroDetailTableViewController ()
@property(nonatomic,strong)HeroDetailViewModel* model;
@property(nonatomic,strong) UIButton * selectedButton;

@end

@implementation HeroDetailTableViewController
- (HeroDetailViewModel *)model {
    if(_model == nil) {
        _model = [[HeroDetailViewModel alloc]initWithEnName:_enName];;
    }
    return _model;
}

-(instancetype)initWithEnName:(NSString *)enName{
    if (self=[super initWithStyle:UITableViewStylePlain]) {
        _enName=enName;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[SkillInfoTableViewCell class] forCellReuseIdentifier:@"skillCell"];
    [self.tableView registerClass:[HeroDetailNomalTableViewCell class] forCellReuseIdentifier:@"nomalCell"];
    self.tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.model getDataFromNetCompleteHandle:^(NSError *error) {
            if (!error) {
               [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                   [self.tableView reloadData];
                   [self.tableView.header endRefreshing];
                   
               }];
            }
            
        }];
        
    }];
    self.tableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    [self.tableView.header beginRefreshing];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.model.rowNumber;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row==0) {
        SkillInfoTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"skillCell"];
        [cell.btnB setImageForState:UIControlStateNormal withURL:[self.model iconNameURLWithType:SkillTypeB] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [self tableViewCellContent:cell withType:SkillTypeB];
        cell.btnB.selected=YES;
        _selectedButton=cell.btnB;
        [cell.btnB bk_addEventHandler:^(UIButton* sender) {
            if (!sender.selected) {
                _selectedButton.selected=NO;
                _selectedButton=sender;
                _selectedButton.selected=YES;
                [self tableViewCellContent:cell withType:SkillTypeB];
                
            }
        } forControlEvents:UIControlEventTouchUpInside];
        
        [cell.btnQ setImageForState:UIControlStateNormal withURL:[self.model iconNameURLWithType:SkillTypeQ] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.btnQ bk_addEventHandler:^(UIButton* sender) {
            if (!sender.selected) {
                _selectedButton.selected=NO;
                _selectedButton=sender;
                _selectedButton.selected=YES;
                [self tableViewCellContent:cell withType:SkillTypeQ];
                
            }
        } forControlEvents:UIControlEventTouchUpInside];

        [cell.btnR setImageForState:UIControlStateNormal withURL:[self.model iconNameURLWithType:SkillTypeR] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.btnR bk_addEventHandler:^(UIButton* sender) {
            if (!sender.selected) {
                _selectedButton.selected=NO;
                _selectedButton=sender;
                _selectedButton.selected=YES;
                [self tableViewCellContent:cell withType:SkillTypeR];
                
            }
        } forControlEvents:UIControlEventTouchUpInside];

        [cell.btnW setImageForState:UIControlStateNormal withURL:[self.model iconNameURLWithType:SkillTypeW] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.btnW bk_addEventHandler:^(UIButton* sender) {
            if (!sender.selected) {
                _selectedButton.selected=NO;
                _selectedButton=sender;
                _selectedButton.selected=YES;
                [self tableViewCellContent:cell withType:SkillTypeW];
                
            }
        } forControlEvents:UIControlEventTouchUpInside];


        [cell.btnE setImageForState:UIControlStateNormal withURL:[self.model iconNameURLWithType:SkillTypeE] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.btnE bk_addEventHandler:^(UIButton* sender) {
            if (!sender.selected) {
                _selectedButton.selected=NO;
                _selectedButton=sender;
                _selectedButton.selected=YES;
                [self tableViewCellContent:cell withType:SkillTypeE];
                
            }
        } forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else {
        HeroDetailNomalTableViewCell* cell=[self.tableView dequeueReusableCellWithIdentifier:@"nomalCell"];
        if(indexPath.row == 1 || indexPath.row == 2){
        
        }
        return cell;
    
    
    }
    
}
-(void)tableViewCellContent:(SkillInfoTableViewCell*)cell withType:(SkillType)type{
    
    
    cell.desc.text=[[self.model descWithType:type] isEqualToString:@""]? @"无" : [self.model descWithType:type];
    cell.name.text=[[self.model nameWithType:type] isEqualToString:@""]? @"无" : [self.model nameWithType:type];
    cell.cost.text=[[self.model costWithType:type] isEqualToString:@""]? @"无" : [self.model costWithType:type];
    cell.coolDown.text=[[self.model coolDownWithType:type] isEqualToString:@""]? @"无" : [self.model coolDownWithType:type];
    cell.range.text=[[self.model rangeWithType:type] isEqualToString:@""]? @"无" : [self.model rangeWithType:type];
    cell.effect.text=[[self.model effectWithType:type] isEqualToString:@""]? @"无" : [self.model effectWithType:type];

}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return [tableView fd_heightForCellWithIdentifier:@"skillCell" cacheByIndexPath:indexPath configuration:^(SkillInfoTableViewCell* cell) {
            [cell.btnB setImageForState:UIControlStateNormal withURL:[self.model iconNameURLWithType:SkillTypeB] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
            [self tableViewCellContent:cell withType:SkillTypeB];
            cell.btnB.selected=YES;
            _selectedButton=cell.btnB;
            [cell.btnB bk_addEventHandler:^(UIButton* sender) {
                if (!sender.selected) {
                    _selectedButton.selected=NO;
                    _selectedButton=sender;
                    _selectedButton.selected=YES;
                    [self tableViewCellContent:cell withType:SkillTypeB];
                    
                }
            } forControlEvents:UIControlEventTouchUpInside];
            
            [cell.btnQ setImageForState:UIControlStateNormal withURL:[self.model iconNameURLWithType:SkillTypeQ] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
            [cell.btnQ bk_addEventHandler:^(UIButton* sender) {
                if (!sender.selected) {
                    _selectedButton.selected=NO;
                    _selectedButton=sender;
                    _selectedButton.selected=YES;
                    [self tableViewCellContent:cell withType:SkillTypeQ];
                    
                }
            } forControlEvents:UIControlEventTouchUpInside];
            
            [cell.btnR setImageForState:UIControlStateNormal withURL:[self.model iconNameURLWithType:SkillTypeR] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
            [cell.btnR bk_addEventHandler:^(UIButton* sender) {
                if (!sender.selected) {
                    _selectedButton.selected=NO;
                    _selectedButton=sender;
                    _selectedButton.selected=YES;
                    [self tableViewCellContent:cell withType:SkillTypeR];
                    
                }
            } forControlEvents:UIControlEventTouchUpInside];
            
            [cell.btnW setImageForState:UIControlStateNormal withURL:[self.model iconNameURLWithType:SkillTypeW] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
            [cell.btnW bk_addEventHandler:^(UIButton* sender) {
                if (!sender.selected) {
                    _selectedButton.selected=NO;
                    _selectedButton=sender;
                    _selectedButton.selected=YES;
                    [self tableViewCellContent:cell withType:SkillTypeW];
                    
                }
            } forControlEvents:UIControlEventTouchUpInside];
            
            
            [cell.btnE setImageForState:UIControlStateNormal withURL:[self.model iconNameURLWithType:SkillTypeE] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
            [cell.btnE bk_addEventHandler:^(UIButton* sender) {
                if (!sender.selected) {
                    _selectedButton.selected=NO;
                    _selectedButton=sender;
                    _selectedButton.selected=YES;
                    [self tableViewCellContent:cell withType:SkillTypeE];
                    
                }
            } forControlEvents:UIControlEventTouchUpInside];

            
}];
    }else{
        return [tableView fd_heightForCellWithIdentifier:@"nomalCell" cacheByIndexPath:indexPath configuration:^(HeroDetailNomalTableViewCell* cell){
        
        }];
    }

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
