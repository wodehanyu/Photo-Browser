//
//  ScrollViewController.m
//  LastObjectByTarena
//
//  Created by soft01 on 16/8/2.
//  Copyright © 2016年 soft01. All rights reserved.
//

#import "ScrollViewController.h"
#import <Masonry.h>
#import <BlocksKit/BlocksKit+UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>
@interface ScrollViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!_controllers||_controllers.count==0) {
        return;
    }
    _pageVC=[[UIPageViewController alloc]initWithTransitionStyle:0 navigationOrientation:1 options:nil];
    _pageVC.dataSource=self;
    _pageVC.delegate=self;
    [self addChildViewController:_pageVC];
    [self.view addSubview:_pageVC.view];
    [_pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [_pageVC setViewControllers:@[_controllers.firstObject] direction:0 animated:YES completion:nil];
    
    UITapGestureRecognizer* tapR=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tapR];
    tapR.numberOfTapsRequired=2;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
-(void)tap:(UITapGestureRecognizer*)tapR{
    self.navigationController.navigationBarHidden ? (self.navigationController.navigationBarHidden = NO):(self.navigationController.navigationBarHidden = YES);


}

#pragma mark - init
-(instancetype)initWithImages:(NSArray *)images{
    if (self=[super init]) {
        NSMutableArray* arr=[NSMutableArray new];
        for (int i=0; i<images.count; i++) {
            UIButton * button=[UIButton buttonWithType:UIButtonTypeSystem];
            button.enabled=NO;
            [button setBackgroundImage:images[i] forState:UIControlStateNormal];
            [button setBackgroundImage:images[i] forState:UIControlStateSelected];
            UIViewController* vc=[UIViewController new];
            vc.view=button;
            button.tag=1000+i;
            [button bk_addEventHandler:^(UIButton* sender) {
                [self.delegate scrollViewController:self didSelectedIndex:(sender.tag-1000)];
                
            } forControlEvents:UIControlEventTouchUpInside];
            [arr addObject:vc];
            
        }
        _controllers=[arr copy];
        _canCycle=YES;
        _showPageController=NO;
    }
    return self;
    
}
+(instancetype)ScrollViewWithImages:(NSArray *)images{
    return [[ScrollViewController alloc]initWithImages:images];
}
#pragma mark - UIPageVeiwControllerDatasource
-(UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSInteger index=[_controllers indexOfObject:viewController];
    if (index==_controllers.count-1) {
        return _controllers.firstObject;
    }
    return _controllers[index+1];

}
-(UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSInteger index=[_controllers indexOfObject:viewController];
    if (index==0) {
        return _controllers.lastObject;
    }
    return _controllers[index-1];
}
#pragma mark - UIPageViewControllerDelegate
-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (finished && completed) {
        NSInteger index=[_controllers indexOfObject:pageViewController.viewControllers.firstObject];
        if ([self.delegate respondsToSelector:@selector(scrollViewController:currentPage:)]) {
            [self.delegate scrollViewController:self currentPage:index];
        }
    }

}

@end
