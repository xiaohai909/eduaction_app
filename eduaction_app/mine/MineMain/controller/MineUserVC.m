//
//  MineUserVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/27.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineUserVC.h"
#import "MineUserCollection.h"
#import "PhotoChoiseVC.h"
#import "WCNAreaPickerView.h"
#import "MineUserProfessionVC.h"
#import "MineAttestationVC.h"
#import "MineChangePasswardVC.h"
#import "MineChangePhoneVC.h"

@interface MineUserVC ()
{
    BOOL firstIn;
}
@property (nonatomic, strong) MineUserCollection *collection_main;
@end

@implementation MineUserVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setnavbg_defa];
    self.title = @"个人资料";
    
    [self.view addSubview:self.collection_main];
    
    @weakify(self);
    [[[[noticeSubjectmanager sharenoticeSubjectmanager] shouldTabar_jump2] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self->firstIn = YES;
    }];
    
}
- (MineUserCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.5;
        layout.minimumInteritemSpacing = 0.5;
        
        _collection_main = [[MineUserCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collection_main.showsVerticalScrollIndicator = NO;
        @weakify(self)
        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
            @strongify(self)
            if (indexPath.section == 0) {
                //选择头像并上传
                [self getImageBlock:^(UIImage * _Nonnull image) {
                    NSLog(@"%@",image);
                }];
            }
            else if (indexPath.section == 1){
                if (indexPath.row == 0) {
                    //选择职业
                    [self.navigationController pushViewController:[MineUserProfessionVC new] animated:YES];
//                    [self sheetAlertController:@"职业"];
                }
            }
            else if (indexPath.section == 2) {
                if (indexPath.row == 1) {
                    //选择性别
                    [self sheetAlertController:@"性别"];
                }
                else if (indexPath.row == 2) {
                    //选择地区
                    WCNAreaPickerView *pickerView = [[WCNAreaPickerView alloc] initWithStyle:WCNAreaPickerWithStateAndCityAndDistrict delegate:self];
                    [pickerView show];
                }
            }
            else if (indexPath.section == 3) {
                if (indexPath.row == 0) {
                    [self.navigationController pushViewController:[MineChangePhoneVC new] animated:YES];
                }
                else if (indexPath.row == 3) {
                    //修改密码
                    [self.navigationController pushViewController:[MineChangePasswardVC new] animated:YES];

                } else if(indexPath.row == 4){
                    //查看实名认证或实名认证
                    [self.navigationController pushViewController:[MineAttestationVC new] animated:YES];
                }
            }
        }];
    }
    return _collection_main;
}
- (void)viewWillAppear:(BOOL)animated {
    
    
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
    
    self.tabBarController.navigationItem.rightBarButtonItem =nil;
    self.tabBarController.navigationItem.titleView = nil;
//    if (firstIn) {
//        firstIn = NO;
//    }
//    else{
//        [self.navigationController setNavigationBarHidden:YES animated:YES];
//    }
}
-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
//    self.navigationController.navigationBarHidden = YES;
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
