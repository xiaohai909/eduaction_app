//
//  testGuideDetailV.h
//  eduaction_app
//
//  Created by legendlxd on 2018/12/17.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface testGuideDetailV : UIView
@property (weak, nonatomic) IBOutlet UILabel *timelab;
@property (weak, nonatomic) IBOutlet UILabel *titlelab;
@property (weak, nonatomic) IBOutlet UILabel *contentlab;
+(instancetype)creatXib;
-(void)setdataSourcce:(testGuideDetailBaseClass *)mode;
@end

NS_ASSUME_NONNULL_END
