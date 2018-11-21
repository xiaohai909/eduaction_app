//
//  searchWithKindVC.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/19.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "searchWithKindVC.h"
#import "TopfilteringV.h"
@interface searchWithKindVC ()
@property (strong, nonatomic) searchKindVM *filterVM;
@property (strong, nonatomic) TopfilteringV *topMenu;
@end

@implementation searchWithKindVC
-(TopfilteringV *)topMenu{
    
    if (!_topMenu) {
        
        _topMenu = [[TopfilteringV alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, ZTHeight - NaviIPHONEX)];
        _topMenu.viewMode = self.filterVM;
        @weakify(self);
        @strongify(self);
        [_topMenu setfilterV:self];
        
    }
    return _topMenu;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.filterVM = [[searchKindVM alloc]init];

    [self.view addSubview:self.topMenu];

    

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
