//
//  HomenewsCell.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/2.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomenewsCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iamgeV;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *time;
-(void)setDataSource:(courselistdataBaseClass *)mode;
@end

NS_ASSUME_NONNULL_END
