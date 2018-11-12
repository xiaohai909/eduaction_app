//
//  ChapterScoreVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ChapterScoreVC.h"
#import "ChapterScoreCollection.h"

#import "MakeProblemMainVC.h"

@interface ChapterScoreVC ()
@property (nonatomic, strong) ChapterScoreCollection *collection_main;
@property (nonatomic, strong) UIButton *btn_redo;// 重做
@end

@implementation ChapterScoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_red"] forBarMetrics:UIBarMetricsDefault];
    self.title = @"成绩";
    
    [self.view addSubview:self.collection_main];
    [self.view addSubview:self.btn_redo];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
#pragma --- view creat
- (ChapterScoreCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.5;
        layout.minimumInteritemSpacing = 0.5;
        
        _collection_main = [[ChapterScoreCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth,UI_IS_IPHONE_X?(274+100*2+10):(230+100*2+10)} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        
        @weakify(self)
        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
            @strongify(self)
            if (indexPath.section == 0) {
                [self.navigationController popViewControllerAnimated:YES];
            }
            else{
                //跳转到,@"本章错题",@"本章收藏",@"本章笔记",@"试错解析"
                if (indexPath.row == 0) {
                    MakeProblemMainVC *vc = [MakeProblemMainVC new];
                    [vc setMode:MakeProblemMainModeErrorPractice];//MakeProblemMainModeSimulateExam,MakeProblemMainModeErrorPractice,MakeProblemMainModeRandomPractice,
                    [self.navigationController pushViewController:vc animated:YES];
                }
                else if (indexPath.row == 1) {
                    
                }
                else if (indexPath.row == 2) {
                
                }
                else {
                    
                }
            }
        }];
    }
    return _collection_main;
}
- (UIButton *)btn_redo {
    if (!_btn_redo) {
        _btn_redo = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn_redo.frame = (CGRect){15,self.collection_main.py_height+85,ZTWidth-30,45};
        _btn_redo.titleLabel.font = [UIFont systemFontOfSize:16];
        [_btn_redo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btn_redo setTitle:@"重做本章" forState:UIControlStateNormal];
        [_btn_redo setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_btn_redo setBackgroundImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:_btn_redo.frame gradientDir:leftToright] forState:UIControlStateNormal];
        
        _btn_redo.backgroundColor = HexRGB(0xF15A51);
        _btn_redo.layer.cornerRadius = 45/2.0;
        _btn_redo.layer.masksToBounds = YES;
        
        @weakify(self)
        [[_btn_redo rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            //跳转到做题
            MakeProblemMainVC *vc = [MakeProblemMainVC new];
            [vc setMode:MakeProblemMainModeErrorPractice];//MakeProblemMainModeSimulateExam,MakeProblemMainModeErrorPractice,MakeProblemMainModeRandomPractice,
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    return _btn_redo;
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
