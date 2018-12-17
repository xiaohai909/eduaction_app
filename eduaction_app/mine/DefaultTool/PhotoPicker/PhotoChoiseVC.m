//
//  PhotoChoiseVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/29.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "PhotoChoiseVC.h"

@interface PhotoChoiseVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) UIViewController *superVC;
@property (nonatomic, copy) blockImage block;
@end

@implementation PhotoChoiseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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



static const NSString *PhotoChoiseBlockKey = @"PhotoChoiseBlockKey";

@implementation BaseViewController (PhotoChoise_Category)
@dynamic blokeImage;

-(void)setBlokeImage:(blockImage)blokeImage
{
    [self willChangeValueForKey:@"PhotoChoiseBlockKey"]; // KVO
    objc_setAssociatedObject(self, &PhotoChoiseBlockKey, blokeImage, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self didChangeValueForKey:@"PhotoChoiseBlockKey"]; // KVO
}

-(blockImage)blokeImage
{
    return objc_getAssociatedObject(self, &PhotoChoiseBlockKey);
}


- (void)getImageBlock:(blockImage)block
{
    self.blokeImage = block;
    //选择图片
    MJWeakSelf
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"选择方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertAction *camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf pushPickerController:UIImagePickerControllerSourceTypeCamera];
        }];
        [sheet addAction:camera];
    }
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf pushPickerController:UIImagePickerControllerSourceTypePhotoLibrary];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [sheet addAction:photo];
    [sheet addAction:cancel];
    [self presentViewController:sheet animated:YES completion:nil];
}
-(void)pushPickerController:(UIImagePickerControllerSourceType)sourceType
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = sourceType;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    if (self.blokeImage) {
        self.blokeImage(image);
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIImage *image = [CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:CGRectMake(0, 0, ZTWidth, 1) gradientDir:leftToright];
    [viewController.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [viewController.navigationController.navigationBar setShadowImage:image];
    [viewController.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:16],NSFontAttributeName, nil];
    [viewController.navigationController.navigationBar setTitleTextAttributes:attributes];
}

@end
