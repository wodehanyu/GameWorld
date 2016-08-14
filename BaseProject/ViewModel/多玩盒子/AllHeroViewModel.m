//
//  AllHeroViewModel.m
//  BaseProject
//
//  Created by YGZ on 16/8/13.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AllHeroViewModel.h"
#import "DuoWanNetManager.h"
#import "AllHeroModel.h"
@implementation AllHeroViewModel
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
self.dataTask=[DuoWanNetManager getHeroWithType:HeroTypeAll completionHandle:^(AllHeroModel* model, NSError *error) {
    if (error) {
        [self showErrorMsg:error.localizedDescription];
    }else{
        self.dataArr=[model.all mutableCopy];
    }
    completionHandle(error);
    
}];

}
-(AllHeroAllModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(NSString*)nameForRow:(NSInteger)row{
    return [self modelForRow:row].cnName;
}
-(NSURL*)iconURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].enName]];
}
@end
