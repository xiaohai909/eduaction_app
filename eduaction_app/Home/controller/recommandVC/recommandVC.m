//
//  recommandVC.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/26.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "recommandVC.h"
#import "searchresultCV.h"
#import "MainCollectionFowLayout.h"
@interface recommandVC ()
@property(strong,nonatomic)searchresultCV *resultV;
@end

@implementation recommandVC
-(searchresultCV *)resultV
{
    if (!_resultV) {
        MainCollectionFowLayout * layout = [[MainCollectionFowLayout alloc]init];
        
        _resultV = [[searchresultCV alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, ZTHeight-NaviIPHONEX) collectionViewLayout:layout];
        _resultV.headtitile = @[@"推荐",@"免费课程",@"积分兑换"];
        _resultV.showsVerticalScrollIndicator = NO;
        _resultV.backgroundColor = [UIColor whiteColor];
        _resultV.type = forrecommendtype;
        
    }
    return _resultV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setnavbg_defa];
    
    [self.view addSubview:self.resultV];
    // Do any additional setup after loading the view.
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
