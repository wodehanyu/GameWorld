//
//  ScrollDisplayViewController.m
//  BaseProject
//
//  Created by YGZ on 16/8/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ScrollDisplayViewController.h"

@interface ScrollDisplayViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@end

@implementation ScrollDisplayViewController
/** 初始化 */
-(instancetype)initWithControllers:(NSArray *)controllers{
    if (self=[super init]) {
        _controllers=[controllers copy];
        _autoCycle = YES;
        _canCycle = YES;
        _showPageControl = YES;
        _duration = 3 ;
    }
    return self;
}

-(instancetype)initWithNames:(NSArray *)names{
    NSMutableArray* arr=[NSMutableArray new];
    _names=[names copy];
    for (int i=0; i<_names.count; i++) {
        UIImage* image=[UIImage imageNamed:_names[i]];
        UIButton* but=[UIButton buttonWithType:UIButtonTypeCustom];
        [but setBackgroundImage:image forState:UIControlStateNormal];
        UIViewController *vc=[UIViewController new];
        vc.view=but;
        but.tag=100+i;
        [but bk_addEventHandler:^(UIButton* sender) {
            //预防性编程，看是否代理实现了这个方法
            if ([self.delegate respondsToSelector:@selector(scrollDisplayViewController:didSelectedIndex:)]) {
                [self.delegate scrollDisplayViewController:self didSelectedIndex:sender.tag-100];
            }
            
        } forControlEvents:UIControlEventTouchUpInside];
        [arr addObject:vc];
    }
    if (self=[self initWithControllers:arr]) {
    }
    return self;

}



-(instancetype)initWithImgPaths:(NSArray *)paths{
//路径中可能存在的类型：NSURL ,Http:// ,Https:// ,本地路径:file://
    NSMutableArray * arr=[NSMutableArray new];
    _paths=[paths copy];
    for (int i=0; i<_paths.count; i++) {
        id path = _paths[i];
        UIButton* but = [UIButton buttonWithType:UIButtonTypeCustom];
        if ([self isURL:path]) {
            [but setBackgroundImageForState:UIControlStateNormal withURL:path placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        }else if([self isNetPath:path]){
            NSURL *url=[NSURL URLWithString:path];
            [but setBackgroundImageForState:UIControlStateNormal withURL:url placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        }else if([path isKindOfClass:[NSString class]]){
            NSURL *url=[NSURL URLWithString:path];
            [but setBackgroundImageForState:UIControlStateNormal withURL:url placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        }else{
            [but setImage:[UIImage imageNamed:@"ImageError@3x"] forState:UIControlStateNormal];
        }
        UIViewController * vc=[UIViewController new];
        vc.view=but;
        but.tag=100+i;
        [but bk_addEventHandler:^(UIButton* sender) {
            if ([self.delegate respondsToSelector:@selector(scrollDisplayViewController:didSelectedIndex:)]) {
                [self.delegate scrollDisplayViewController:self didSelectedIndex:sender.tag-100];
            }
            
        } forControlEvents:UIControlEventTouchUpInside];
        [arr addObject:vc];
        
        
    }
    if (self=[self initWithControllers:arr]) {
    }
    return self;
}
-(BOOL)isURL:(id)path{
    return [path isKindOfClass:[NSURL class]];
}
-(BOOL)isNetPath:(id)path{
    // http:// https://
    if (![path isKindOfClass:[NSString class]]) {
        return NO;
    }
    BOOL isContainHttp=[path rangeOfString:@"http"].location !=NSNotFound;
    BOOL isContainTile=[path rangeOfString:@"://"].location !=NSNotFound;
    return isContainHttp && isContainTile;
}
-(void)setShowPageControl:(BOOL)showPageControl{
    _showPageControl = showPageControl;
    _pageControl.hidden =!showPageControl;
    
}
-(void)setDuration:(NSTimeInterval)duration{
    _duration = duration;
    self.autoCycle = _autoCycle;
}
-(void)setCurrentPage:(NSInteger)currentPage{
    _currentPage = currentPage;
    UIViewController* vc = _controllers[currentPage];
    [_pageVC setViewControllers:@[vc] direction:0 animated:YES completion:nil];

}
-(void)setAutoCycle:(BOOL)autoCycle{
    _autoCycle = autoCycle;
    [_timer invalidate];
    if (!autoCycle) {
        return;
    }
    _timer=[NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
        UIViewController* vc=_pageVC.viewControllers.firstObject;
        NSInteger index = [_controllers indexOfObject:vc];
        UIViewController* nextVC =nil;
        if (index == _controllers.count-1) {
            if (!_canCycle) {
                return ;
            }
            nextVC = _controllers.firstObject;
        }else{
            nextVC = _controllers[index+1];
        }
        __block ScrollDisplayViewController* weekSelf= self;
        [_pageVC setViewControllers:@[nextVC] direction:0 animated:YES completion:^(BOOL finished) {
            [weekSelf configPageControl];
            
        }];
        
    } repeats:YES];

}
-(void)configPageControl{
    NSInteger index = [_controllers indexOfObject:_pageVC.viewControllers.firstObject];
    _pageControl.currentPage = index;

}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (!_controllers ||_controllers.count == 0) {
        return;
    }
    _pageVC=[[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:nil];
    _pageVC.delegate=self;
    _pageVC.dataSource=self;
    [self addChildViewController:_pageVC];
    [self.view addSubview:_pageVC.view];
    [_pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
        
    }];
    [_pageVC setViewControllers:@[_controllers.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages=_controllers.count;
    [self.view addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(0);
    }];
    _pageControl.userInteractionEnabled = NO;
    
    self.autoCycle = _autoCycle;
    self.showPageControl = _showPageControl;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UIPageViewControllerDataSource
//这两个协议只有触屏滑动有效
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSInteger index=[_controllers indexOfObject:viewController];
    if (index == 0) {
        return _canCycle? _controllers.lastObject : nil;
    }
    return _controllers[index-1];

}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger index = [_controllers indexOfObject:viewController];
    if (index == _controllers.count-1) {
        return _canCycle ? _controllers.firstObject : nil;
    }
    return _controllers[index+1];
}

#pragma mark - UIPageViewConttrollerDelegate
-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{

    if (finished && completed) {
        [self configPageControl];
        NSInteger index=[_controllers indexOfObject:pageViewController.viewControllers.firstObject];
        if ([self.delegate respondsToSelector:@selector(scrollDisplayViewController:currentIndex:)]) {
            [self.delegate scrollDisplayViewController:self currentIndex:index];
        }
    }
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
