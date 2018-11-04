//
//  MYtabarViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/1.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "MYtabarViewController.h"
static MYtabarViewController * mainViewInstance=nil;
@interface MYtabarViewController ()

@end

@implementation MYtabarViewController
+(MYtabarViewController *)shareGWHomeViewController
{
    MYtabarViewController * bar = [[MYtabarViewController alloc]init];
    return bar;
    
}
+ (MYtabarViewController *) instance
{
    return mainViewInstance;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    mainViewInstance = self;
    self.navigationItem.hidesBackButton = YES;
    
    [self setupView];
    // Do any additional setup after loading the view.
}
-(void)setupView
{
    
    UITabBarItem * homeT = [[UITabBarItem alloc]init];
    homeT.tag = 1;
    homeT.title = @"首页";
    
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    normalAttrs[NSForegroundColorAttributeName] = HexRGB(0x999999);
    
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    
    selectAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    selectAttrs[NSForegroundColorAttributeName] = HexRGB(0xFC5F5F);
    
    
    [homeT setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [homeT setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
    
    [self tabbarItem:homeT
           imageName:@"bottom_btn_index_sel"
     selectImageName:@"bottom_btn_index_sel"];
    
    UITabBarItem * stu_item = [[UITabBarItem alloc]init];
    stu_item.title =@"在线题库";
    stu_item.tag = 2;
    [self tabbarItem:stu_item
           imageName:@"bottom_btn_question_nor"
     selectImageName:@"bottom_btn_question_nor"];
    
    [stu_item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [stu_item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
    
    UITabBarItem * mine_item = [[UITabBarItem alloc]init];
    mine_item.title = @"我的";
    mine_item.tag = 3;
    [self tabbarItem:mine_item
           imageName:@"bottom_btn_mine_nor"
     selectImageName:@"bottom_btn_mine_nor"];
    
    [mine_item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [mine_item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
    
    HomeViewController * home = [[HomeViewController alloc]init];;
    home.tabBarItem = homeT;
  
    StudyViewController * stu = [[StudyViewController alloc]init];
    stu.tabBarItem = stu_item;

    
    MineViewController * mine = [[MineViewController alloc]init];
    mine.tabBarItem = mine_item;

    

    
    self.selectedIndex = 1;
    self.viewControllers = @[home,stu,mine];
    
}

/**
 tabbar图片
 
 @param item <#item description#>
 @param imageName <#imageName description#>
 @param selectImageName <#selectImageName description#>
 */
- (void)tabbarItem:(UITabBarItem *)item
         imageName:(NSString *)imageName
   selectImageName:(NSString *)selectImageName
{
//    if (IS_IPHONE)
//    {
//        if (UI_IS_IPHONE_X)
//        {
//            [item setImageInsets:UIEdgeInsetsMake(23, 0, -23, 0)];
//
//        }else
//        {
//            [item setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
//        }
//    }else
//    {
//        [item setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
//    }
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.image = image;
    UIImage *selectImage = [UIImage imageNamed:selectImageName];
    selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.selectedImage = selectImage;
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
