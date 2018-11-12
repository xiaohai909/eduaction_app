//
//  SearchResultH.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/7.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultH : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIImageView *SelectV;
@property (strong,nonatomic)RACSubject *ClickTop;
@property (assign,nonatomic)NSInteger current_select;
-(void)setupBtn:(NSArray *)arr;
@end

NS_ASSUME_NONNULL_END
