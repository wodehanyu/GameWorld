//
//  SkillInfoTableViewCell.m
//  BaseProject
//
//  Created by YGZ on 16/8/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "SkillInfoTableViewCell.h"

@interface SkillInfoTableViewCell ()
@property(nonatomic,strong)UIView* view;
@end

@implementation SkillInfoTableViewCell
-(UIButton* )btnB{
    if (!_btnB) {
        _btnB=[UIButton buttonWithType:UIButtonTypeCustom];
        _btnB.layer.masksToBounds=YES;
        _btnB.layer.cornerRadius=2;
    }
    return _btnB;
    
}

-(UIButton* )btnE{
    if (!_btnE) {
        _btnE=[UIButton buttonWithType:UIButtonTypeCustom];
        _btnE.layer.masksToBounds=YES;
        _btnE.layer.cornerRadius=2;
    }
    return _btnE;
    
}

-(UIButton* )btnQ{
    if (!_btnQ) {
        _btnQ=[UIButton buttonWithType:UIButtonTypeCustom];
        _btnQ.layer.masksToBounds=YES;
        _btnQ.layer.cornerRadius=2;
    }
    return _btnQ;
    
}

-(UIButton* )btnR{
    if (!_btnR) {
        _btnR=[UIButton buttonWithType:UIButtonTypeCustom];
        _btnR.layer.masksToBounds=YES;
        _btnR.layer.cornerRadius=2;
    }
    return _btnR;
    
}

-(UIButton* )btnW{
    if (!_btnW) {
        _btnW=[UIButton buttonWithType:UIButtonTypeCustom];
        _btnW.layer.masksToBounds=YES;
        _btnW.layer.cornerRadius=2;
    }
    return _btnW;

}

-(UILabel*)name{
    if (!_name) {
        _name=[UILabel label];
        _name.font=[UIFont systemFontOfSize:14];
        _name.textColor=[UIColor blackColor];
        _name.textAlignment=NSTextAlignmentLeft;
    }
    return _name;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
