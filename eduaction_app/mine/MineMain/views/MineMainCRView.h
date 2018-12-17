//
//  MineMainCRView.h
//  eduaction_app
//
//  Created by Mac on 2018/11/26.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineMainCRView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIImageView *image_bg;
@property (weak, nonatomic) IBOutlet UIButton *btn_head;
@property (weak, nonatomic) IBOutlet UIButton *btn_point_bg;
@property (weak, nonatomic) IBOutlet UIButton *btn_accountPoint;
@property (weak, nonatomic) IBOutlet UILabel *lbl_nameAndLevel;


@property (weak, nonatomic) IBOutlet UIButton *btn_data;
@property (weak, nonatomic) IBOutlet UIButton *btn_sign;

@property (weak, nonatomic) IBOutlet UIButton *btn_night;
@property (weak, nonatomic) IBOutlet UIButton *btn_message;
@property (weak, nonatomic) IBOutlet UILabel *lbl_messageNumber;

@end

NS_ASSUME_NONNULL_END
