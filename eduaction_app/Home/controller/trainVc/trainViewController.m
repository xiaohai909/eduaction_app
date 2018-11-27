//
//  trainViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/7.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "trainViewController.h"
#import "trainLeftTab.h"
#import "trainRightCollection.h"
#import "searchWithKindVC.h"
@interface trainViewController ()
@property (nonatomic,strong)trainLeftTab *myTab;
@property (nonatomic,strong)trainRightCollection *myCollectionV;
@end

@implementation trainViewController
-(trainLeftTab *)myTab{
    
    if (!_myTab) {
        
        _myTab=[[trainLeftTab alloc]initWithFrame:CGRectMake(0, 0, 99, ZTHeight) style:UITableViewStyleGrouped];
        
    }
    return _myTab;
}
-(trainRightCollection *)myCollectionV{
    if (!_myCollectionV) {
           UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        
        _myCollectionV = [[trainRightCollection alloc]initWithFrame:CGRectMake(99, 0, ZTWidth - 99, ZTHeight) collectionViewLayout:layout];
        _myCollectionV.backgroundColor = [UIColor whiteColor];
        _myCollectionV.contentInset = UIEdgeInsetsMake(125, 0, 0, 0);
    }
    return _myCollectionV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setnav_BackBtn];
  
    [self.view addSubview:self.myTab];
    [self.view addSubview:self.myCollectionV];
    
    
    [self.myTab  selectindex:0];
    // Do any additional setup after loading the view.
}
-(void)rightAction:(UIButton *)sender{
    
    searchWithKindVC *cont = [[searchWithKindVC alloc]init];
    [cont setNavTitle:@"全部课程"];
    [self.navigationController pushViewController:cont animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    
   
    [super viewWillAppear:animated];
    
  
    
    [self setnavbg_defa];
    
    [self setRigthbtn_inNav:[UIImage imageNamed:@"top_btn_search"] andtitle:@""];
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
