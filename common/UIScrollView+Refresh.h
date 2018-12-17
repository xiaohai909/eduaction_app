//
//  UIScrollView+Refresh.h
//  HotLucky
//
//  Created by Admin on 2017/12/6.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>

typedef void(^HeaderRefreshBlock)(void); //刷新数据代码块
typedef void(^FooterRefreshBlock)(void); //加载更多代码块

@interface UIScrollView (Refresh)

@property (strong, nonatomic) HeaderRefreshBlock refeshNewDataHandle;
@property (strong, nonatomic) FooterRefreshBlock loadMoreDataHandle;

-(void)setupRefresh;
-(void)setupHeaderRefresh;
-(void)setupFooterRefresh;

-(void)stopHeaderRefresh;
-(void)stopFooterRefresh;

-(void)setupHeaderRefresh:(HeaderRefreshBlock)block;
-(void)setupFooterRefresh:(FooterRefreshBlock)block;

@end
