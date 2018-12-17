//
//  UIScrollView+Refresh.m
//  HotLucky
//
//  Created by Admin on 2017/12/6.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)

@dynamic refeshNewDataHandle;
@dynamic loadMoreDataHandle;

-(void)setupRefresh{
    // 设置刷新头
    [self setupHeaderRefresh];
    //设置刷新尾部
    [self setupFooterRefresh];
}
-(void)setupHeaderRefresh
{
    // 设置刷新头
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 设置文字
        [header setTitle:@"下拉可刷新数据" forState:MJRefreshStateIdle];
        [header setTitle:@"松开刷新数据" forState:MJRefreshStatePulling];
        [header setTitle:@"刷新数据中" forState:MJRefreshStateRefreshing];
        header.lastUpdatedTimeLabel.hidden = YES;

    self.mj_header = header;
}
-(void)setupFooterRefresh
{
    //设置刷新尾部
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 设置文字
    [footer setTitle:@"点击或上拉加载更多" forState:MJRefreshStateIdle];
    [footer setTitle:@"正在加载更多数据" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"没有更多数据了" forState:MJRefreshStateNoMoreData];
    footer.stateLabel.font = [UIFont systemFontOfSize:15];
    self.mj_footer = footer;
}
-(void)stopHeaderRefresh
{
    [self.mj_header endRefreshing];
}
-(void)stopFooterRefresh
{
    [self.mj_footer endRefreshing];
}
static const char RefreshReloadDataBlockKey = '\0';
-(void)setRefeshNewDataHandle:(HeaderRefreshBlock)refeshNewDataHandle
{
    [self willChangeValueForKey:@"reloadDataBlock"]; // KVO
    objc_setAssociatedObject(self, &RefreshReloadDataBlockKey, refeshNewDataHandle, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self didChangeValueForKey:@"reloadDataBlock"]; // KVO
}

-(HeaderRefreshBlock)refeshNewDataHandle
{
    return objc_getAssociatedObject(self, &RefreshReloadDataBlockKey);
}

static const char RefreshLoadMoreDataBlockKey = '\0';
-(void)setLoadMoreDataHandle:(FooterRefreshBlock)loadMoreDataHandle
{
    [self willChangeValueForKey:@"loadMoreDataBlock"]; // KVO
    objc_setAssociatedObject(self, &RefreshLoadMoreDataBlockKey, loadMoreDataHandle, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self didChangeValueForKey:@"loadMoreDataBlock"]; // KVO
}

-(FooterRefreshBlock)loadMoreDataHandle
{
    return objc_getAssociatedObject(self, &RefreshLoadMoreDataBlockKey);
}
-(void)setupHeaderRefresh:(HeaderRefreshBlock)block
{
    self.refeshNewDataHandle = block;
    [self setupHeaderRefresh];
}
-(void)setupFooterRefresh:(FooterRefreshBlock)block
{
    self.loadMoreDataHandle = block;
    [self setupFooterRefresh];
}
-(void)loadNewData {
    if (self.refeshNewDataHandle) {
        self.refeshNewDataHandle();
    }
}

-(void)loadMoreData {
    if (self.loadMoreDataHandle) {
        self.loadMoreDataHandle();
    }
}

@end
