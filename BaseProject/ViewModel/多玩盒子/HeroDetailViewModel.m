//
//  HeroDetailViewModel.m
//  BaseProject
//
//  Created by YGZ on 16/8/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HeroDetailViewModel.h"
#import "DuoWanNetManager.h"
@interface NormalCellModel : NSObject
@property(nonatomic,strong) NSString * nomalName;
@property(nonatomic,strong) NSURL * nomalIconURL1;
@property(nonatomic,strong) NSString * normalDesc1;
@property(nonatomic,strong) NSURL * nomalIconURL2;
@property(nonatomic,strong) NSString * normalDesc2;
@end

@implementation NormalCellModel



@end



@interface HeroDetailViewModel()

@property(nonatomic,strong)HeroDetailModel* model;

@end

@implementation HeroDetailViewModel
-(instancetype)init{
    NSAssert1(NO, @"请使用initWithEnName:方法初始化", __FUNCTION__);
    return self;
    
}
-(instancetype)initWithEnName:(NSString *)enName{
    if (self=[super init]) {
        _enName=enName;
    }
    return self;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[DuoWanNetManager getHeroDetailWithHeroName:_enName completionHandle:^(HeroDetailModel* model, NSError *error) {
        if (!error) {
            _model=model;
            NormalCellModel* model1=[NormalCellModel new];
            model1.nomalName=_model.desc_B.name;
            model1.normalDesc1=_model.desc_B.desc;
            [self.dataArr addObject:model1];

            
            NormalCellModel* model2=[NormalCellModel new];
            model2.nomalName=@"最佳搭档";
            model2.normalDesc1=_model.like[0].des;
            model2.nomalIconURL1=[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_model.like[0].partner]];
            model2.normalDesc1=_model.like[1].des;
            model2.nomalIconURL1=[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_model.like[1].partner]];
            
            [self.dataArr addObject:model2];

            
            NormalCellModel* model3=[NormalCellModel new];
            model3.nomalName=@"最佳克制";
            model3.normalDesc1=_model.hate[0].des;
            model3.nomalIconURL1=[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_model.hate[0].partner]];
            model3.normalDesc1=_model.hate[1].des;
            model3.nomalIconURL1=[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_model.hate[1].partner]];
            
            [self.dataArr addObject:model2];
            
            NormalCellModel* model4=[NormalCellModel new];
            model4.nomalName=@"使用技巧";
            model4.normalDesc1=_model.tips;
            [self.dataArr addObject:model4];
            
            NormalCellModel* model5=[NormalCellModel new];
            model5.nomalName=@"应对技巧";
            model5.normalDesc1=_model.opponentTips;
            [self.dataArr addObject:model5];
            
            NormalCellModel* model6=[NormalCellModel new];
            model6.nomalName=@"英雄背景";
            model6.normalDesc1=_model.description;
            [self.dataArr addObject:model6];
        }
        completionHandle(error);
        
    }];
    
}
-(HeroDetailSkillModel*)skillModelWithType:(SkillType )type{
    switch (type) {
        case 0:
            return _model.desc_B;
            break;
        case 1:
            return _model.desc_Q;
            break;
        case 2:
            return _model.desc_R;
            break;
        case 3:
            return _model.desc_W;
            break;
        case 4:
            return _model.desc_E;
            break;
        default:
            break;
    }

}

-(NSURL*)iconNameURLWithType:(SkillType)type{
    switch (type) {
        case 0:
            return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_B_64x64.png?v=10&OSType=iOS7.0.3",_enName]];
            break;
        case 1:
            return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_Q_64x64.png?v=10&OSType=iOS7.0.3",_enName]];
            break;
        case 2:
            return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_R_64x64.png?v=10&OSType=iOS7.0.3",_enName]];
            break;
        case 3:
            return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_W_64x64.png?v=10&OSType=iOS7.0.3",_enName]];
            break;
        case 4:
            return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_E_64x64.png?v=10&OSType=iOS7.0.3",_enName]];
            break;
        default:
            break;
    }
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(NSString*)nameWithType:(SkillType)type{
    return [self skillModelWithType:type].name;
}
-(NSString*)effectWithType:(SkillType)type{
    return [self skillModelWithType:type].effect;
}
-(NSString*)costWithType:(SkillType)type{
    return [self skillModelWithType:type].cost;
}
-(NSString*)coolDownWithType:(SkillType)type{
    return [self skillModelWithType:type].cooldown;
}
-(NSString*)rangeWithType:(SkillType)type{
    return [self skillModelWithType:type].range;
}
-(NSString*)descWithType:(SkillType)type{
    return [self skillModelWithType:type].desc;
}

-(NormalCellModel*)nomalModelForRow:(NSInteger)row{
    if (row == 0) {
        NSAssert1(NO, @"第一行cell，请调用withType:方法", __FUNCTION__);
    }
    return self.dataArr[row];

}
-(NSString*)nomalNameForRow:(NSInteger)row{
    return [self nomalModelForRow:row].nomalName;
}
-(NSString*)nomalDesc1ForRow:(NSInteger)row{
    return [self nomalModelForRow:row].normalDesc1;
    
}
-(NSString*)nomalDesc2ForRow:(NSInteger)row{
    return [self nomalModelForRow:row].normalDesc2;
}
-(NSURL*)nomalIcon1URLForRow:(NSInteger)row{
    return [self nomalModelForRow:row].nomalIconURL1;
}
-(NSURL*)nomalIcon2URLForRow:(NSInteger)row{
    return [self nomalModelForRow:row].nomalIconURL2;
}
@end
