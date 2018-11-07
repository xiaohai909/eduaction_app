//
//  Searchhot&hisV.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/4.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchhotAndhisV : UIView
@property(nonatomic,strong)RACSubject *LabClcik_action;
@property (nonatomic,strong)NSMutableArray *hisArr;
-(void)setupView:(NSArray *)titleArr;
-(void)refreshview:(NSArray *)titleArr;
@end

NS_ASSUME_NONNULL_END
