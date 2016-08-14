//
//  AllHeroCell.m
//  BaseProject
//
//  Created by YGZ on 16/8/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AllHeroCell.h"

@implementation AllHeroCell
-(TRImageView*)iconIV{
    if (!_iconIV) {
        _iconIV=[TRImageView new];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(2);
            make.bottom.mas_equalTo(-20);
            
        }];
    }
    return _iconIV;
}
-(UILabel*)nameLB{
    if (!_nameLB) {
        _nameLB=[UILabel label];
        _nameLB.font=[UIFont systemFontOfSize:14];
        _nameLB.textColor=[UIColor blackColor];
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(2);
            
        }];
    }
    return _nameLB;
}
@end
