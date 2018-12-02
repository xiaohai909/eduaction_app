//
//  testCommTab.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/30.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "testCommTab.h"
#import "testGuideCell.h"
@implementation testCommTab

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if ([super initWithFrame:frame style:style]) {
    
        self.clickIndex = [RACSubject subject];
        self.delegate = self;
        self.dataSource =self;
        [self registerNib:[UINib nibWithNibName:@"testGuideCell" bundle:nil] forCellReuseIdentifier:@"testGuideCell"];
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    testGuideCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testGuideCell"];
   
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.clickIndex sendNext:nil];
}
@end
