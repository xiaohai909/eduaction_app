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
    NSInteger selectindex;
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
        titleArr = [[NSMutableArray alloc]init];
        selectindex = 0;
        @weakify(self);
        [[[[[[myNetworkManager sharemyNetworkManager] net_courseMode] kindoftrainReqCommand]executionSignals] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            [[x takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
                @strongify(self);
                commResBaseClass *mode = x;
                if (mode.resultCode == 10000) {
                    
                    [self->titleArr removeAllObjects];
                    
                    if (mode.resultObj_arr.count > 0) {
                        for (NSInteger i = 0 ; i<mode.resultObj_arr.count; i++) {
                            
                            NSDictionary *dic = [mode.resultObj_arr objectAtIndex:i];
                            trainkindBaseClass *temp = [[trainkindBaseClass alloc]initWithDictionary:dic];
                            [self->titleArr addObject:temp];
                            
                        }
                        [self reloadData];
                        [self selectindex:self->selectindex];
                    }
                   
                    
                }
                
            }];
            [[x takeUntil:self.rac_willDeallocSignal] subscribeCompleted:^{
               
            [[GWProgressHUB sharedYGGWProgressHUB] YGDismiss:[CommonFunciton theTopviewControler].view];
            }];
            
            
        }];
        [[GWProgressHUB sharedYGGWProgressHUB] YGShowHUB_WithReturn:[CommonFunciton theTopviewControler].view AndMsg:@"加载中……"];
        [[[[myNetworkManager sharemyNetworkManager] net_courseMode] kindoftrainReqCommand] execute:nil];
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
    trainkindBaseClass *mode = [titleArr objectAtIndex:indexPath.row];
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = mode.name;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //[tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    
    //selectindex = indexPath.row;
    [self selectindex:indexPath.row];
    
    [self.didSelectTab sendNext:indexPath];
}
-(void)selectindex:(NSInteger )index{
    
    
    selectindex = index;
    
    [self selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    trainkindBaseClass *mode = [titleArr objectAtIndex:index];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:[NSString stringWithFormat:@"%0.f",mode.internalBaseClassIdentifier] forKey:@"peixunbanId"];
   [[GWProgressHUB sharedYGGWProgressHUB] YGShowHUB_WithReturn:[CommonFunciton theTopviewControler].view AndMsg:@"加载中……"];
    [[[[myNetworkManager sharemyNetworkManager] net_courseMode]queryKemuByPeixunbanIdCommand] execute:dic];
    
}
-(void)dealloc{
    
}
@end
