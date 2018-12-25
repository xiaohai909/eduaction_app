//
//  testCommTab.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/30.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface testCommTab : UITableView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)RACSubject *clickIndex;
@property (nonatomic,strong)RACSubject *clickDetail;
-(void)setreqDataSource:(testGuideReqModeBaseClass *)mode;
-(void)setereqDataSourceWitharr:(NSMutableArray *)arr;
@end

NS_ASSUME_NONNULL_END
