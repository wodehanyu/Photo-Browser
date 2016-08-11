//
//  ImagesViewModel.m
//  LastObjectByTarena
//
//  Created by soft01 on 16/8/3.
//  Copyright © 2016年 soft01. All rights reserved.
//

#import "ImagesViewModel.h"

@interface ImagesViewModel ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property(nonatomic,strong)NSMutableArray* arr;
@end

@implementation ImagesViewModel
- (NSArray *)images {
    if(_images == nil) {
        _images = [[NSArray alloc] init];
    }
    return _images;
}
- (NSMutableArray *)arr {
    if(_arr == nil) {
        _arr = [[NSMutableArray alloc] init];
    }
    return _arr;
}

-(void)imagesByPotos{
    UIImagePickerController* imagePicker=[UIImagePickerController new];
    imagePicker.delegate=self;
    [self presentViewController:imagePicker animated:YES completion:nil];
}
-(void)imagesByCamare{
    UIImagePickerController* imagePicker=[UIImagePickerController new];
    imagePicker.delegate=self;
    imagePicker.sourceType=UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:imagePicker animated:YES completion:nil];
}
-(void)resetImages{
    [self.arr removeAllObjects];
    self.images=[_arr copy];
}

#pragma mark - UIImagePikerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [self.arr addObject:info[UIImagePickerControllerOriginalImage]];
    self.images=[self.arr copy];
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self.delegate dismiss:self];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self.delegate dismiss:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
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

@end
