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

@interface MineUserVC ()<WCNAreaPickerDelegate>
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

#pragma mark --- actions
- (void)sheetAlertController:(NSString *)type
{
    NSString *title;
    NSArray *titles;
    if ([type isEqualToString:@"职业"]) {
        title = @"选择方式";
        titles = @[@"学生",@"宠物医生",@"宠物医生助理",@"宠物美容师",@"猪场兽医",@"牛场兽医",@"禽场兽医",@"马场兽医",@"兽医科研工作者",@"其他"];
    }
    else if ([type isEqualToString:@"性别"]){
        title = @"选择性别";
        titles = @[@"男",@"女"];
    }
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSString *title in titles) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //选择的职业
            NSLog(@"%@",title);
        }];
        [sheet addAction:action];
    }
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [sheet addAction:cancel];
    [self presentViewController:sheet animated:YES completion:nil];
}
- (void)pickerDidChangeStatus:(WCNAreaPickerView *)picker
{
    //选择的地址
    if (picker.locate) {
        NSString  *area = [NSString stringWithFormat:@"%@%@%@",picker.locate.state,picker.locate.city,picker.locate.district];
        NSLog(@"%@",area);
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
