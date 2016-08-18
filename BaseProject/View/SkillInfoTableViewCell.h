//
//  SkillInfoTableViewCell.h
//  BaseProject
//
//  Created by YGZ on 16/8/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillInfoTableViewCell : UITableViewCell
@property(nonatomic,strong) UIButton * btnQ;
@property(nonatomic,strong) UIButton * btnR;
@property(nonatomic,strong) UIButton * btnW;
@property(nonatomic,strong) UIButton * btnB;
@property(nonatomic,strong) UIButton * btnE;
@property(nonatomic,strong) UILabel * name;
@property(nonatomic,strong) UILabel * desc;
@property(nonatomic,strong) UILabel * cost;
@property(nonatomic,strong) UILabel * coolDown;
@property(nonatomic,strong) UILabel * range;
@property(nonatomic,strong) UILabel * effect;

@end
