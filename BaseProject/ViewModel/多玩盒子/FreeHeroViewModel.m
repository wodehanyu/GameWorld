//
//  FreeHeroViewModel.m
//  BaseProject
//
//  Created by YGZ on 16/8/12.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "FreeHeroViewModel.h"
#import "DuoWanNetManager.h"
@implementation FreeHeroViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask=[DuoWanNetManager getHeroWithType:HeroTypeFree completionHandle:^(FreeHeroModel* model, NSError *error) {
        if (!error) {
            self.dataArr= [model.free mutableCopy];
        }
        completionHandle(error);
    }];
    
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(FreeHeroFreeModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
    
}
-(NSURL*)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].enName]];
    
}
-(NSString*)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
-(NSString*)nameForRow:(NSInteger)row{
    return [self modelForRow:row].cnName;
    
}
-(NSString*)locationForRow:(NSInteger)row{
    return [self modelForRow:row].location;
}
-(NSString*)enNameForRow:(NSInteger)row{
    return [self modelForRow:row].enName;
}

@end
