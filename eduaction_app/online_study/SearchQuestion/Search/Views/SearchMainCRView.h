//
//  SearchMainCRView.h
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchMainCRView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UIButton *btn_action;

@property (nonatomic, copy) void (^blockGoOn)();
@end

NS_ASSUME_NONNULL_END
