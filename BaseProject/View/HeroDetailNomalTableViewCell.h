//
//  HeroDetailNomalTableViewCell.h
//  BaseProject
//
//  Created by YGZ on 16/8/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroDetailNomalTableViewCell : UITableViewCell
@property(nonatomic,strong) UILabel * titleLB;
@property(nonatomic,strong) UILabel * desc;
@property(nonatomic,strong) UIImageView * iconView;
@property(nonatomic)BOOL isContainImag;
@end
