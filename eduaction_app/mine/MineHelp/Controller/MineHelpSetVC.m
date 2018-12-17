//
//  MineHelpSetVC.m
//  eduaction_app
//
//  Created by Mac on 2018/12/11.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineHelpSetVC.h"
#import "MineHelpSet.h"
#import "MineUserVC.h"
#import "MineHelpFeedBackVC.h"
#import "MineHelpUSVC.h"

@interface MineHelpSetVC ()
@property (nonatomic, strong) MineHelpSet *collection_main;
@property (nonatomic, strong) UIButton *btn_send;
@end

@implementation MineHelpSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setnavbg_defa];
    self.title = @"设置";
    
    [self.view addSubview:self.collection_main];
    [self.view addSubview:self.btn_send];
}
- (MineHelpSet *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.5;
        layout.minimumInteritemSpacing = 0.5;
        
        _collection_main = [[MineHelpSet alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX-(NaviIPHONEX-20)} collectionViewLayout:layout];
        _collection_main.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collection_main.showsVerticalScrollIndicator = NO;
        
        @weakify(self)
        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
            //选择cell
            @strongify(self)
            if (indexPath.section == 0) {
                //个人中心
                [self.navigationController pushViewController:[MineUserVC new] animated:YES];
            }
            else if (indexPath.section == 1 && indexPath.row == 0) {
                //清除
            }
            else if (indexPath.section == 2) {
                if (indexPath.row == 0) {
                 //常见问题
                }else if(indexPath.row == 1){
                 //评分
                }else if (indexPath.row == 2){
                 //意见反馈
                    [self.navigationController pushViewController:[MineHelpFeedBackVC new] animated:YES];
                }else{
                 //关于我们
                    [self.navigationController pushViewController:[MineHelpUSVC new] animated:YES];
                }
            }
        }];
    }
    return _collection_main;
}
- (UIButton *)btn_send
{
    if (!_btn_send) {
        _btn_send = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn_send.frame = (CGRect){0,ZTHeight-NaviIPHONEX-(NaviIPHONEX-20),ZTWidth,NaviIPHONEX-20};
        [_btn_send setTitle:@"退出" forState:UIControlStateNormal];
        _btn_send.layer.masksToBounds = YES;
        [_btn_send setBackgroundImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:_btn_send.frame gradientDir:leftToright] forState:UIControlStateNormal];
        
        [[_btn_send rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
        }];
    }
    return _btn_send;
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
