//
//  SQSearchView.h
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQSearchBar.h"
#import "SearchCollection.h"

NS_ASSUME_NONNULL_BEGIN

@interface SQSearchView : UIView
@property (nonatomic, strong) SQSearchBar *bar;
@property (nonatomic, strong) SearchCollection *collection_main;
@property (nonatomic, copy) void (^blockGoOn)(NSString *keyValue);

+ (SQSearchView *)creatSearchViewHot:(NSArray *)hotArray andHistory:(NSArray *)historyArray;
@end

NS_ASSUME_NONNULL_END
