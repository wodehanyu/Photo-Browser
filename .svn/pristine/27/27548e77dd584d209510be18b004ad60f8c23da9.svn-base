//
//  ViewController.m
//  LastObjectByTarena
//
//  Created by soft01 on 16/8/3.
//  Copyright © 2016年 soft01. All rights reserved.
//

#import "ViewController.h"
#import <BlocksKit+UIKit.h>
#import <Masonry/Masonry.h>
#import "ImagesViewModel.h"
#import "ScrollViewController.h"
@interface ViewController ()<ImageViewModelDelegate>
@property (weak, nonatomic) IBOutlet UIButton *imageDone;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addImage;
@property(nonatomic,strong)ScrollViewController* scrollView;
@property(nonatomic,strong)ImagesViewModel* model;
@end

@implementation ViewController
- (ImagesViewModel *)model {
    if(_model == nil) {
        _model = [[ImagesViewModel alloc] init];

        _model.delegate=self;
    }
    return _model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.imageDone bk_addEventHandler:^(id sender) {
        if (self.model.images && self.model.images.count>0) {
            self.scrollView=[ScrollViewController ScrollViewWithImages:self.model.images];
        [self.navigationController pushViewController:self.scrollView animated:YES];
        }else{
            [self showAlert];
        }
        
    } forControlEvents:UIControlEventTouchUpInside];
    [self button];
    
}

-(void)showAlert{
    UIAlertController* alertVC=[UIAlertController alertControllerWithTitle:@"警告" message:@"请先添加图片" preferredStyle:1];
    UIAlertAction* action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:action];
    
    [self presentViewController:alertVC animated:YES completion:nil];
    
    

}
-(void)button{

    UIButton* but=[UIButton buttonWithType:UIButtonTypeSystem];
    [but setTitle:@"请添加图片" forState:0];
    [self.view addSubview:but];
    but.tag=1000;
    [but mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
    [but bk_addEventHandler:^(id sender) {
        [self presentViewController: self.model animated:YES completion:nil];
        [self.model imagesByPotos];
    } forControlEvents:UIControlEventTouchUpInside];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIButton *btn=[self.view viewWithTag:1000];
    if (self.model.images && self.model.images.count>0) {
        [btn setTitle:@"重置" forState:0];
        [btn bk_removeEventHandlersForControlEvents:UIControlEventTouchUpInside];
        [btn bk_addEventHandler:^(id sender) {
            
            [self.model resetImages];
        } forControlEvents:UIControlEventTouchUpInside];
        
    }else{
        if ([btn.currentTitle isEqualToString:@"请添加图片"]) {
        }else{
            [btn setTitle:@"请添加图片" forState:0];
            [btn bk_removeEventHandlersForControlEvents:UIControlEventTouchUpInside];
            [btn bk_addEventHandler:^(id sender) {
                [self presentViewController: self.model animated:YES completion:nil];
                [self.model imagesByPotos];
            } forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)addImageM:(UIBarButtonItem *)sender {
    [self presentViewController: self.model animated:YES completion:nil];
    [self.model imagesByPotos];
}
#pragma mark - ImageViewModelDelegate
-(void)dismiss:(ImagesViewModel *)model{
    [model dismissViewControllerAnimated:YES completion:nil];
}
@end
