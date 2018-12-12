//
//  MoreTypeScrollView.h
//  e-commercePlus
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MoreTypeScrollView : UIScrollView
@property (nonatomic, strong) NSMutableArray *array_btns;
@property (nonatomic, copy) void (^blockClick)(NSInteger tag);
@property (nonatomic, strong) UIImageView *image_select;

- (void)btnAction:(UIButton *)sender;
- (void)creatTypeWithArray:(NSArray *)array;
@end

NS_ASSUME_NONNULL_END
