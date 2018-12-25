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
{
    NSMutableArray *dataSource;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if ([super initWithFrame:frame style:style]) {
        dataSource = [[NSMutableArray alloc]init];
        
        self.clickIndex = [RACSubject subject];
        self.clickDetail = [RACSubject subject];
        
        self.delegate = self;
        self.dataSource =self;
        [self registerNib:[UINib nibWithNibName:@"testGuideCell" bundle:nil] forCellReuseIdentifier:@"testGuideCell"];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    return dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    testGuideCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testGuideCell"];
    id mode = [dataSource objectAtIndex:indexPath.row];
   
    if ([mode isKindOfClass:[testGuideReqModeResultObj class]]) {
        
         cell.textLabel.text= ((testGuideReqModeResultObj*)mode).name;
    }
    else if ([mode isKindOfClass:[testGuideReqModeChildren class]]) {
        
        cell.textLabel.text= ((testGuideReqModeChildren*)mode).name;
    }
    else if ([mode isKindOfClass:[NSDictionary class]]){
        testGuideReqModeChildren *temp_mode = [[testGuideReqModeChildren alloc]initWithDictionary:mode];
        cell.textLabel.text= temp_mode.name;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    id mode = [dataSource objectAtIndex:indexPath.row];
    if ([mode isKindOfClass:[testGuideReqModeResultObj class]]) {
        
        NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:((testGuideReqModeResultObj *)mode).children];
        if (arr.count > 0) {
              [self.clickIndex sendNext:arr];
        }
        else{
            testGuideReqModeResultObj *temp = mode;
            [self.clickDetail sendNext:temp];
        }
      
    }
    else if ([mode isKindOfClass:[testGuideReqModeChildren class]]){
        
        NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:((testGuideReqModeChildren *)mode).children];
        
        if (arr.count > 0) {
             [self.clickIndex sendNext:arr];
        }
        else{
            testGuideReqModeChildren *temp = mode;
            [self.clickDetail sendNext:temp];
        }
    }
    else if ([mode isKindOfClass:[NSDictionary class]]){
        
        testGuideReqModeChildren *temp_mode = [[testGuideReqModeChildren alloc]initWithDictionary:mode];
        NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:temp_mode.children];
        if (arr.count > 0) {
            
             [self.clickIndex sendNext:arr];
        }
        else{
            [self.clickDetail sendNext:temp_mode];
        }
       
    }
 
    
}
-(void)setreqDataSource:(testGuideReqModeBaseClass *)mode{
 
    [dataSource removeAllObjects];
    [dataSource addObjectsFromArray:mode.resultObj];
    [self reloadData];
}
-(void)setereqDataSourceWitharr:(NSMutableArray *)arr{
 
    [dataSource removeAllObjects];
    [dataSource addObjectsFromArray:arr];
    [self reloadData];
}
@end
