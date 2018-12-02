//
//  HomeViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/1.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeaderView.h"
#import "HomeCollection.h"
#import "ScanQRViewController.h"
#import "SearchViewController.h"
#import "trainViewController.h"
#import "searchWithKindVC.h"
#import "recommandVC.h"
#import "couresListVC.h"
#import "testGuideVC.h"
#import "medicineVC.h"
@interface HomeViewController ()
@property(strong,nonatomic)UIButton *rightBtn;
@property(strong,nonatomic)UIButton *searchBtn;
@property(strong,nonatomic)HomeCollection *homeCollectionV;
@end

@implementation HomeViewController
-(HomeCollection *)homeCollectionV{
    if (!_homeCollectionV) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        
        _homeCollectionV = [[HomeCollection alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, ZTHeight-NaviIPHONEX-TabIPHONEX) collectionViewLayout:layout];
        _homeCollectionV.backgroundColor =  HexRGB(0xF1F0F0);
   
        //XFAdjustsScrollViewInsets(_homeCollectionV);
    }
    return _homeCollectionV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightBtn setImage:[UIImage imageNamed:@"index_btn_scan"] forState:UIControlStateNormal];
    [[self.rightBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        ScanQRViewController *cont = [[ScanQRViewController alloc]init];
        [self.navigationController pushViewController:cont animated:YES];
    }];
    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.searchBtn setTitle:@"搜索你喜欢……" forState:UIControlStateNormal];
    [self.searchBtn setImage:[UIImage imageNamed:@"index_ico_search"] forState:UIControlStateNormal];
    [self.searchBtn setBackgroundColor:HexRGB(0xF1F0F0)];
    [self.searchBtn setTitleColor:HexRGB(0x999999) forState:UIControlStateNormal];
    self.searchBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    self.searchBtn.frame = CGRectMake(0, 5, 240, 32);
    self.searchBtn.layer.masksToBounds = YES;
    self.searchBtn.layer.cornerRadius = 10;

    self.searchBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [[self.searchBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
    
        SearchViewController *cont = [[SearchViewController alloc]init];
        MyNav *nav =[[MyNav alloc]initWithRootViewController:cont];
        //nav.navigationBarHidden = YES;
        [self presentViewController:nav animated:YES completion:nil];
    }];
    
    CGFloat bgheight = (btnwidth*2+2*topspace+centerspcae+2*titlespcae+2*btn_title_height);
    
    
    HomeHeaderView *header = [[HomeHeaderView alloc]initWithFrame:CGRectMake(0, -(ZTWidth*0.4+bgheight+104), ZTWidth, ZTWidth*0.4+bgheight+104)];
    @weakify(self);
    [header.ClickHeader_btn subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        DDLogVerbose(@"点击首页按钮%@",x);
        [self headerjump:x];
       
    }];
    [self.view addSubview:self.homeCollectionV];
    self.homeCollectionV.contentInset = UIEdgeInsetsMake(ZTWidth*0.4+bgheight+104, 0, 0, 0);
    [self.homeCollectionV addSubview:header];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    //[self.navigationController.navigationBar setBackgroundImage:[CommonFunciton createImageWithColor:HexRGB(0xFFFFFF)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[CommonFunciton createImageWithColor:HexRGB(0xFFFFFF)] forBarMetrics:UIBarMetricsDefault];
    self.tabBarController.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    
    self.tabBarController.navigationItem.titleView = self.searchBtn;
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
-(void)headerjump:(id)x{
    
    switch ([x integerValue]) {
#pragma mark 跳转到培训界面
        case 1:
        {
            trainViewController *cont = [[trainViewController alloc]init];
            [cont setNavTitle:@"选择分类"];
            [self.navigationController pushViewController:cont animated:YES];
            
        }
            break;
#pragma mark 技能培训
        case 2:
        {
            searchWithKindVC *cont =[[searchWithKindVC alloc]init];
            [cont setNavTitle:@"技能培训"];
            [self.navigationController pushViewController:cont animated:YES];
            
        }
            break;
#pragma mark 课程推荐
        case 3:
        {
            searchWithKindVC *cont =[[searchWithKindVC alloc]init];
            [cont setNavTitle:@"课程推荐"];
            [self.navigationController pushViewController:cont animated:YES];
            
        }
            break;
#pragma mark 公开课
        case 4:
        {
            recommandVC *cont =[[recommandVC alloc]init];
            [cont setNavTitle:@"公开课"];
            [self.navigationController pushViewController:cont animated:YES];
            
        }
            break;
#pragma mark 下载管理
        case 5:
        {
            
        }
            break;
#pragma mark 考试指南
        case 6:
        {
            testGuideVC *cont =[[testGuideVC alloc]init];
            [cont setNavTitle:@"考试指南"];
            [self.navigationController pushViewController:cont animated:YES];
        }
            break;
#pragma mark 药物查询
        case 7:
        {
            medicineVC *cont =[[medicineVC alloc]init];
            [cont setNavTitle:@"药物查询"];
            [self.navigationController pushViewController:cont animated:YES];
            
        }
            break;
        case 8:
        {
            [self.tabBarController setSelectedIndex:1];
        }
            break;
        case 9:
        {
            couresListVC *cont =[[couresListVC alloc]init];
            [cont setNavTitle:@"课程表"];
            [self.navigationController pushViewController:cont animated:YES];
            
        }
            break;
        case 10:
        {
            
        }
            break;
            
        default:
            break;
    }
    
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
