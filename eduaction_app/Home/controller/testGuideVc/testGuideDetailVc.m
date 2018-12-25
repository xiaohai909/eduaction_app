//
//  testGuideDetailVc.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/30.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "testGuideDetailVc.h"
#import "testGuideDetailV.h"
@interface testGuideDetailVc ()
@property (nonatomic,strong)testGuideDetailV *headV;
@end

@implementation testGuideDetailVc
-(testGuideDetailV *)headV{
    if (!_headV) {
        _headV =[testGuideDetailV creatXib];
        
    }
    return _headV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.headV];
    
    [self detailrefresh];
    // Do any additional setup after loading the view.
}
-(void)detailrefresh{
    
    [[myNetworkManager sharemyNetworkManager] getGuideById:self.keyId Andsuccess:^(id  _Nonnull response) {
        DDLogVerbose(@"getGuideById == %@",[CommonFunciton dictionaryToJson:response]);
        
        testGuideDetailBaseClass *mode = [[testGuideDetailBaseClass alloc]initWithDictionary:response];
        if (mode.resultCode == 10000) {
            
            [self.headV setdataSourcce:mode];
        }
        
    } Andfailure:^(NSError * _Nonnull err) {
        
        
    }];
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
