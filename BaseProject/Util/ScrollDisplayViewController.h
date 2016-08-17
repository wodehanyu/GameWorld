//
//  ScrollDisplayViewController.h
//  BaseProject
//
//  Created by YGZ on 16/8/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ScrollDisplayViewController;
@protocol ScrollDisplayViewControllerDelegate <NSObject>

@optional
/** 当用户点击某一页触发 */
-(void)scrollDisplayViewController:(ScrollDisplayViewController*)scrollDisplayVC didSelectedIndex:(NSInteger)index;
/** 实时传回当前索引值 */
-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayVC currentIndex:(NSInteger)index;

@end

@interface ScrollDisplayViewController : UIViewController
{
    NSTimer* _timer;
}
/** 传入图片地址数据 */
-(instancetype)initWithImgPaths:(NSArray*)paths;
/** 传入图片名字数据 */
-(instancetype)initWithNames:(NSArray*)names;
/** 传入控制器数据 */
-(instancetype)initWithControllers:(NSArray*)controllers;
/** 满足的协议 */
@property(nonatomic,weak) id<ScrollDisplayViewControllerDelegate> delegate;
@property(nonatomic,strong) NSArray * paths;
@property(nonatomic,strong) NSArray * names;
@property(nonatomic,strong) NSArray * controllers;

@property(nonatomic,strong) UIPageViewController * pageVC;
@property(nonatomic,strong) UIPageControl * pageControl;
/** 设置是否循环滚动，默认为YES,循环滚动 */
@property(nonatomic) BOOL  canCycle;
/** 设置是否自动滚动，默认是YES,自动滚动 */
@property(nonatomic) BOOL autoCycle;
/** 设置自动滚动间隔时间，默认是3秒 */
@property(nonatomic) NSTimeInterval  duration;
/** 设置是否显示页数提示，默认YES,显示页数 */
@property(nonatomic) BOOL  showPageControl;
/** 当前页 */
@property(nonatomic) NSInteger currentPage;

@end
