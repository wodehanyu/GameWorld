//
//  FreeHeroCell.m
//  BaseProject
//
//  Created by YGZ on 16/8/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "FreeHeroCell.h"

@implementation FreeHeroCell
-(TRImageView*)icon{
    if (!_icon) {
        _icon=[TRImageView new];
        [self.contentView addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(80, 80));
        }];
    }
    return _icon;
}
-(UILabel*)titleLB{
    if (!_titleLB) {
        _titleLB=[UILabel new];
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.icon.mas_right).mas_equalTo(7);
            make.top.mas_equalTo(self.icon.mas_top).mas_equalTo(5);
            make.height.mas_equalTo(17);
            make.right.mas_equalTo(-5);
        }];
        _titleLB.font=[UIFont systemFontOfSize:16];
        _titleLB.textColor=[UIColor blackColor];
    }
    return _titleLB;
}

-(UILabel*)nameLB{
    if (!_nameLB) {
        _nameLB=[UILabel new];
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.height.mas_equalTo(self.titleLB).mas_equalTo(0);
            make.top.mas_equalTo(self.titleLB.mas_bottom).mas_equalTo(10);
        }];
        _nameLB.font=[UIFont systemFontOfSize:14];
        _nameLB.textColor=kRGBColor(151, 153, 154);
    }
    return _nameLB;

}

-(UILabel*)locationLB{
    if (!_locationLB) {
        _locationLB=[UILabel new];
    
        [self.contentView addSubview:_locationLB];
        [_locationLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.nameLB).mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.top.mas_equalTo(self.nameLB.mas_bottom).mas_equalTo(0);
        }];
        _locationLB.font=[UIFont systemFontOfSize:12];
        _locationLB.textColor=kRGBColor(57, 77, 103);
    }
    return _locationLB;
}

@end
