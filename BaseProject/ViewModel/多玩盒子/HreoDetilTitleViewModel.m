//
//  HreoDetilTitleViewModel.m
//  BaseProject
//
//  Created by YGZ on 16/8/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HreoDetilTitleViewModel.h"
#import "DuoWanNetManager.h"
@implementation HreoDetilTitleViewModel
/** 初始化数据*/
-(instancetype)initWithEnName:(NSString *)enName{
    if (self=[super init]) {
      [DuoWanNetManager getHeroDetailWithHeroName:enName completionHandle:^(HeroDetailModel* model, NSError *error) {
          if (error) {
              [self showErrorMsg:error.localizedDescription];
          }else{
              _name=model.title;
              NSRange range=[model.price rangeOfString:@","];
              NSInteger num=range.location-1;
              NSString* price1=[model.price copy];
              NSString* price2=[model.price copy];
              _price=[NSString stringWithFormat:@"金 %@ ,券 %@",[price1 substringToIndex:num],[price2 substringFromIndex:num]];
              _tags=model.tags;
              _attack=model.ratingAttack;
              _magic=model.ratingMagic;
              _defense=model.ratingDefense;
              _difficulty=model.ratingDifficulty;
              _iconURL=[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",enName]];
          
          }
          
      }];
        
    }
    
    return self;

}
-(instancetype)init{
    if (self=[super init]) {
        NSAssert1(NO, @"必须使用initWithEnName初始化方法进行初始化", __func__);
    }
    return self;
}

@end
