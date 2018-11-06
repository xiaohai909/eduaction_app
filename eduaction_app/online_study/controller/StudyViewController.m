//
//  StudyViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/1.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "StudyViewController.h"
#import "StudyCollection.h"

#import "ChapterVC.h"

@interface StudyViewController ()
@property (nonatomic, strong) StudyCollection *collection_main;

@end

@implementation StudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collection_main];
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
- (StudyCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.5;
        layout.minimumInteritemSpacing = 0.5;
        
        
        //@[@"章节练习",@"模拟考试",@"历年真题",@"随机练习",@"错题练习",@"巩固练习",@"考试大纲",@"试题查找",@"排行榜"];
        _collection_main = [[StudyCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-TabIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = [UIColor whiteColor];
        
        _collection_main.bounces = NO;
        
        //跳转动作
        @weakify(self)
        [_collection_main setBlockGoOn:^(NSString * _Nonnull title) {
            @strongify(self)
            if ([title isEqualToString:@"充值"]) {
                
            }
            else if ([title isEqualToString:@"继续学习"]){
                
            }
            else if ([title isEqualToString:@"章节练习"]) {
                [self.navigationController pushViewController:[ChapterVC new] animated:YES];
            }
        }];        
    }
    return _collection_main;
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
