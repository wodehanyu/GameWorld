//
//  FreeHeroCell.h
//  BaseProject
//
//  Created by YGZ on 16/8/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface FreeHeroCell : UICollectionViewCell
@property(nonatomic,strong) TRImageView* icon;
@property(nonatomic,strong) UILabel* titleLB;
@property(nonatomic,strong) UILabel* nameLB;
@property(nonatomic,strong) UILabel* locationLB;
@end
