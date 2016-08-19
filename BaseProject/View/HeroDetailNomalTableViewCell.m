//
//  HeroDetailNomalTableViewCell.m
//  BaseProject
//
//  Created by YGZ on 16/8/19.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeroDetailNomalTableViewCell.h"

@implementation HeroDetailNomalTableViewCell
-(UILabel*)titleLB{
    if (!_titleLB) {
        _titleLB=[UILabel label];
        _titleLB.font=[UIFont systemFontOfSize:16];
        _titleLB.textAlignment=NSTextAlignmentLeft;
        _titleLB.textColor=kRGBColor(0, 0, 98);
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
        }];}
    return _titleLB;
}
-(UIImageView*)iconView{
    if (self.isContainImag) {
        if (!_iconView) {
            _iconView=[UIImageView new];
            [self.contentView addSubview:_iconView];
            [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.titleLB.mas_left).mas_equalTo(0);
                make.top.mas_equalTo(self.titleLB.mas_bottom).mas_equalTo(10);
                make.width.mas_equalTo(self.contentView.bounds.size.width/5-10);
                make.height.mas_equalTo(_iconView.mas_height).mas_equalTo(0);
                
            }];
        }
        return _iconView;
    }else{
        return nil;
    }
}
-(UILabel*)desc{
    if (!_desc) {
        _desc=[UILabel label];
        _desc.font=[UIFont systemFontOfSize:14];
        _desc.textColor=[UIColor blackColor];
        _desc.textAlignment=NSTextAlignmentLeft;
        [self.contentView addSubview:_desc];
        if (self.iconView) {
            [_desc mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.titleLB.mas_left).mas_equalTo(0);
                make.right.mas_equalTo(-10);
                make.top.mas_equalTo(self.titleLB.mas_bottom).mas_equalTo(10);
                
            }];
        }else{
            [_desc mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.iconView.mas_right).mas_equalTo(0);
                make.right.mas_equalTo(-10);
                make.top.mas_equalTo(self.titleLB.mas_bottom).mas_equalTo(10);
                
            }];
            
        }
        
    }
    return _desc;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
