//
//  medicineVC.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/30.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "medicineVC.h"
#import "BATableViewIndex.h"
#import "searchresultCV.h"
#import "MainCollectionFowLayout.h"
@interface medicineVC ()
@property (nonatomic,strong)BATableViewIndex *indexTab;
@property(strong,nonatomic)searchresultCV *resultV;
@end

@implementation medicineVC
-(searchresultCV *)resultV
{
    if (!_resultV) {
        MainCollectionFowLayout * layout = [[MainCollectionFowLayout alloc]init];
        
        _resultV = [[searchresultCV alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, ZTHeight-NaviIPHONEX) collectionViewLayout:layout];
        _resultV.headtitile = @[@"药品名",@"商品名",@"配伍禁忌"];
        _resultV.showsVerticalScrollIndicator = NO;
        _resultV.backgroundColor = [UIColor whiteColor];
        _resultV.type = forrecommendtype;
        
    }
    return _resultV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.resultV];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [self setnavbg_defa];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
