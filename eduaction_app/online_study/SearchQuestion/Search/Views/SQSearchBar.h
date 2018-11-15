//
//  SQSearchBar.h
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SQSearchBar : UIView<UITextFieldDelegate>
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIButton *searchBtn;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, copy) void (^blockGoOn)(NSString *keyValue);
+(instancetype)creatSearchBar;
@end

NS_ASSUME_NONNULL_END
