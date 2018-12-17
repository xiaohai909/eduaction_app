//
//  MineAttestationView.h
//  eduaction_app
//
//  Created by Mac on 2018/12/11.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineAttestationView : UIView
@property (weak, nonatomic) IBOutlet UITextField *text_name;
@property (weak, nonatomic) IBOutlet UITextField *text_number;
@property (weak, nonatomic) IBOutlet UIButton *btn_image1;
@property (weak, nonatomic) IBOutlet UIButton *btn_image2;
@property (weak, nonatomic) IBOutlet UIButton *btn_content;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view_images_height;
@property (nonatomic, assign) CGFloat height_Attestation;
@end

NS_ASSUME_NONNULL_END
