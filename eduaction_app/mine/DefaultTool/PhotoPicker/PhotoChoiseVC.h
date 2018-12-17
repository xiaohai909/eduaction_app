//
//  PhotoChoiseVC.h
//  eduaction_app
//
//  Created by Mac on 2018/11/29.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^blockImage)(UIImage *image);

@interface PhotoChoiseVC : UIViewController
@end




@interface UIView (Comment_Category)

@end


@interface BaseViewController (PhotoChoise_Category)<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, copy) blockImage blokeImage;
- (void)getImageBlock:(blockImage)block;
@end

NS_ASSUME_NONNULL_END
