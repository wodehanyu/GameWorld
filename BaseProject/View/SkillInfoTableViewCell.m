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
        [_name addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _name;
}

-(UILabel*)desc{
    if (!_desc) {
        _desc=[UILabel label];
        _desc.font=[UIFont systemFontOfSize:14];
        _desc.textColor=[UIColor blackColor];
        _desc.textAlignment=NSTextAlignmentLeft;
        [_desc addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _desc;
}

-(UILabel*)coolDown{
    if (!_coolDown) {
        _coolDown=[UILabel label];
        _coolDown.font=[UIFont systemFontOfSize:14];
        _coolDown.textColor=[UIColor blackColor];
        _coolDown.textAlignment=NSTextAlignmentLeft;
        [_coolDown addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _coolDown;
}

-(UILabel*)cost{
    if (!_cost) {
        _cost=[UILabel label];
        _cost.font=[UIFont systemFontOfSize:14];
        _cost.textColor=[UIColor blackColor];
        _cost.textAlignment=NSTextAlignmentLeft;
        [_cost addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _cost;
}

-(UILabel*)range{
    if (!_range) {
        _range=[UILabel label];
        _range.font=[UIFont systemFontOfSize:14];
        _range.textColor=[UIColor blackColor];
        _range.textAlignment=NSTextAlignmentLeft;
        [_range addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _range;
}


-(UILabel*)effect{
    if (!_effect) {
        _effect=[UILabel label];
        _effect.font=[UIFont systemFontOfSize:14];
        _effect.textColor=[UIColor blackColor];
        _effect.textAlignment=NSTextAlignmentLeft;
        [_effect addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _effect;
}
-(UIView*)view{
    if (!_view) {
        _view=[UIView new];
        [_view addSubview:self.btnB];
        [_view addSubview:self.btnE];
        [_view addSubview:self.btnQ];
        [_view addSubview:self.btnR];
        [_view addSubview:self.btnW];
        NSArray* btns=@[self.btnB,self.btnE,self.btnQ,self.btnR,self.btnW];
        UILabel* titleLB=[UILabel label];
        titleLB.font=[UIFont systemFontOfSize:16];
        titleLB.textAlignment=NSTextAlignmentLeft;
        titleLB.textColor=kRGBColor(0, 0, 98);
        titleLB.text=@"技能说明";
        [_view addSubview:titleLB];
        [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(titleLB.bounds.size.height);
        }];
        int btnsCount=(int)btns.count;
        for (int i=0; i<btnsCount; i++) {
                [btns[i] mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(titleLB.mas_bottom).mas_equalTo(5);
                    if (i == 0) {
                        make.left.mas_equalTo(20);
                        make.height.mas_equalTo(((UIButton *)btns[0]).mas_width).mas_equalTo(0);
                    }else if (i == btnsCount-1){
                        make.right.mas_equalTo(-20);
                        make.height.mas_equalTo(((UIButton *)btns[0]).mas_height).mas_equalTo(0);
                        make.width.mas_equalTo(((UIButton *)btns[0]).mas_width).mas_equalTo(0);
                        make.left.mas_equalTo(((UIButton*)btns[i-1]).mas_right).mas_equalTo(20);
                    }else{
                        make.height.mas_equalTo(((UIButton *)btns[0]).mas_height).mas_equalTo(0);
                        make.width.mas_equalTo(((UIButton *)btns[0]).mas_width).mas_equalTo(0);
                        make.left.mas_equalTo(((UIButton*)btns[i-1]).mas_right).mas_equalTo(20);
                        
                    }
                    
                }];
            }
        [_view addSubview:self.name];
        [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.btnB.mas_bottom).mas_equalTo(5);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(self.name.bounds.size.height);
            
        }];
        
        [_view addSubview:self.desc];
        UILabel* descLB=[UILabel label];
        descLB.font=[UIFont systemFontOfSize:13];
        descLB.textAlignment=NSTextAlignmentLeft;
        descLB.textColor=kRGBColor(166, 167, 168);
        descLB.text=@"描述";
        [_view addSubview:descLB];
        [descLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.name.mas_bottom).mas_equalTo(15);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(25);
        }];
        [self.desc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(descLB.mas_top).mas_equalTo(0);
            make.left.mas_equalTo(descLB.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(descLB.mas_height).mas_equalTo(0).priorityLow();
            
            
        }];
        
        
        [_view addSubview:self.cost];
        UILabel* costLB=[UILabel label];
        costLB.font=[UIFont systemFontOfSize:13];
        costLB.textAlignment=NSTextAlignmentLeft;
        costLB.textColor=kRGBColor(166,167,168);
        costLB.text=@"消耗";
        [_view addSubview:costLB];
        [costLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.desc.mas_bottom).mas_equalTo(15);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(25);
        }];
        [self.cost mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(costLB.mas_top).mas_equalTo(0);
            make.left.mas_equalTo(costLB.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(costLB.mas_height).mas_equalTo(0).priorityLow();
        }];
        
        
        [_view addSubview:self.coolDown];
        UILabel* coolDownLB=[UILabel label];
        coolDownLB.font=[UIFont systemFontOfSize:13];
        coolDownLB.textAlignment=NSTextAlignmentLeft;
        coolDownLB.textColor=kRGBColor(166,167,168);
        coolDownLB.text=@"冷却";
        [_view addSubview:coolDownLB];
        [coolDownLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.cost.mas_bottom).mas_equalTo(15);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(25);
        }];
        [self.coolDown mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(coolDownLB.mas_top).mas_equalTo(0);
            make.left.mas_equalTo(coolDownLB.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(coolDownLB.mas_height).mas_equalTo(0).priorityLow();
            
        }];

        
        [_view addSubview:self.range];
        [_view addSubview:self.range];
        UILabel* rangLB=[UILabel label];
        rangLB.font=[UIFont systemFontOfSize:13];
        rangLB.textAlignment=NSTextAlignmentLeft;
        rangLB.textColor=kRGBColor(166,167,168);
        rangLB.text=@"范围";
        [_view addSubview:rangLB];
        [rangLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.coolDown.mas_bottom).mas_equalTo(15);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(25);
        }];
        [self.range mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(rangLB.mas_top).mas_equalTo(0);
            make.left.mas_equalTo(rangLB.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(rangLB.mas_height).mas_equalTo(0).priorityLow();
            
        }];

        
        [_view addSubview:self.effect];
        UILabel* effectLB=[UILabel label];
        effectLB.font=[UIFont systemFontOfSize:13];
        effectLB.textAlignment=NSTextAlignmentLeft;
        effectLB.textColor=kRGBColor(166,167,168);
        effectLB.text=@"效果";
        [_view addSubview:effectLB];
        [effectLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.range.mas_bottom).mas_equalTo(15);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(25);
        }];
        [self.effect mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(effectLB.mas_top).mas_equalTo(0);
            make.left.mas_equalTo(effectLB.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(effectLB.mas_height).mas_equalTo(0).priorityLow();
            
            
        }];
        _view.tag=100;
    }
    return _view;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.view];
        [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
            
        }];
    }
    return self;

}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    UILabel* lable=(UILabel*)object;
    NSDictionary* attribute=@{NSFontAttributeName:lable.font};
    CGSize lableSize=[lable.text boundingRectWithSize:self.contentView.bounds.size options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    [lable mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(lableSize.height);
        
    }];

}
-(CGFloat)getCellHight{
    UIView* view=[self viewWithTag:100];
    return view.bounds.size.height;

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
