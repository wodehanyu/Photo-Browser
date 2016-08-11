//
//  ImagesViewModel.h
//  LastObjectByTarena
//
//  Created by soft01 on 16/8/3.
//  Copyright © 2016年 soft01. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImagesViewModel;
@protocol ImageViewModelDelegate <NSObject>

-(void)dismiss:(ImagesViewModel*)model;

@end


@interface ImagesViewModel : UIViewController
-(void)imagesByCamare;
-(void)imagesByPotos;
-(void)resetImages;
@property(nonatomic,weak)id<ImageViewModelDelegate> delegate;
@property(nonatomic,strong)NSArray* images;

@end
