//
//  HeroVideoTableViewController.h
//  BaseProject
//
//  Created by YGZ on 16/8/18.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroVideoTableViewController : UITableViewController
@property(nonatomic,strong) NSString * enName;
-(instancetype)initWithEnName:(NSString *)enName;
@end
