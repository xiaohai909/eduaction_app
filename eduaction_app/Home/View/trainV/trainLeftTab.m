//
//  trainLeftTab.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/19.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "trainLeftTab.h"
#import "trainLeftCell.h"
@implementation trainLeftTab
{
    NSMutableArray *titleArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if ([super initWithFrame:frame style:style]) {
        
        self.didSelectTab = [RACSubject subject];
        self.delegate = self;
        self.dataSource = self;
        [self registerNib:[UINib nibWithNibName:@"trainLeftCell" bundle:nil] forCellReuseIdentifier:@"trainLeftCell"];
        titleArr = [[NSMutableArray alloc]initWithArray:@[@"基础班",@"冲刺班"]];
        
    }
    return self;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    trainLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"trainLeftCell"];
    cell.backgroundColor = HexRGB(0xF7F7F7);
    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.bounds];
    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text =titleArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    
    [self.didSelectTab sendNext:indexPath];
}
-(void)selectindex:(NSInteger )index{
    
    
    
    [self selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
}
@end
