//
//  HeroDetailViewModel.h
//  BaseProject
//
//  Created by YGZ on 16/8/16.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "HeroDetailModel.h"
typedef NS_ENUM(NSUInteger, SkillType) {
    SkillTypeB,
    SkillTypeQ,
    SkillTypeR,
    SkillTypeW,
    SkillTypeE,
 };

@interface HeroDetailViewModel : BaseViewModel
-(instancetype)initWithEnName:(NSString*)enName;
@property(nonatomic,strong) NSString * enName;
@property(nonatomic) NSInteger  rowNumber;
/** 下面7个方法，是第一个cell调用的方法 */
-(NSURL*)iconNameURLWithType:(SkillType)type;
-(NSString*)nameWithType:(SkillType)type;
-(NSString*)descWithType:(SkillType)type;
-(NSString*)costWithType:(SkillType)type;
-(NSString*)coolDownWithType:(SkillType)type;
-(NSString*)rangeWithType:(SkillType)type;
-(NSString*)effectWithType:(SkillType)type;
/** 下面的方法是除了都一个cell，其他cell使用方法，按需使用 */
-(NSString*)nomalNameForRow:(NSInteger)row;
-(NSURL*)nomalIcon1URLForRow:(NSInteger)row;
-(NSString*)nomalDesc1ForRow:(NSInteger)row;
-(NSURL*)nomalIcon2URLForRow:(NSInteger)row;
-(NSString*)nomalDesc2ForRow:(NSInteger)row;


@end

