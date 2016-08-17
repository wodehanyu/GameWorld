//
//  HreoDetilTitleViewModel.h
//  BaseProject
//
//  Created by YGZ on 16/8/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "HeroDetailModel.h"
@interface HreoDetilTitleViewModel : BaseViewModel
@property(nonatomic,strong) NSString * name;
@property(nonatomic,strong) NSString * attack;
@property(nonatomic,strong) NSString * defense;
@property(nonatomic,strong) NSString * magic;
@property(nonatomic,strong) NSString * difficulty;
@property(nonatomic,strong) NSString * price;
@property(nonatomic,strong) NSString * tags;
@property(nonatomic,strong) NSURL * iconURL;
@property(nonatomic,strong) NSString * enName;
-(instancetype)initWithEnName:(NSString*)enName;
@end
