//
//  HeroViewModel.h
//  BaseProject
//
//  Created by YGZ on 16/8/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface HeroViewModel : BaseViewModel
/**
 *  界面信息
 */
@property(nonatomic) NSInteger rowNumber;
-(NSURL*)iconURLForRow:(NSInteger)row;
-(NSString*)titleForRow:(NSInteger)row;
-(NSString*)nameForRow:(NSInteger)row;
-(NSString*)locationForRow:(NSInteger)row;

@end
