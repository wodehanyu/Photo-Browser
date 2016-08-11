//
//  ScrollViewController.h
//  LastObjectByTarena
//
//  Created by soft01 on 16/8/2.
//  Copyright © 2016年 soft01. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ScrollViewController;

@protocol ScrollViewViewControllerDelegate <NSObject>
-(void)scrollViewController:(ScrollViewController*)scrollViewController didSelectedIndex:(NSInteger)index;
-(void)scrollViewController:(ScrollViewController *)scrollViewController currentPage:(NSInteger)index;


@end

@interface ScrollViewController : UIViewController
-(instancetype)initWithImages:(NSArray*)images;
+(instancetype)ScrollViewWithImages:(NSArray*)images;
@property(nonatomic,strong)NSArray* images;
@property(nonatomic,strong)NSArray* controllers;
@property(nonatomic,strong)UIPageControl* pageControl;
@property(nonatomic,strong)UIPageViewController* pageVC;
@property(nonatomic,weak)id<ScrollViewViewControllerDelegate> delegate;

@property(nonatomic)BOOL canCycle;
@property(nonatomic)BOOL showPageController;

@end
