//
//  AllHeroViewModel.h
//  BaseProject
//
//  Created by YGZ on 16/8/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"

@interface AllHeroViewModel : BaseViewModel
@property(nonatomic)  NSInteger rowNumber;
-(NSURL*)iconURLForRow:(NSInteger)row;
-(NSString*)nameForRow:(NSInteger)row;
@end
