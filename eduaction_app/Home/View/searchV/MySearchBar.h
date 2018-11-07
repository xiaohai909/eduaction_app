//
//  MySearchBar.h
//  LTExchangeRate
//
//  Created by legendlxd on 15/8/1.
//  Copyright (c) 2015年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MySearchBardelaget

-(void)ClickCancelBtn:(UIButton *)btn;
-(void)ClickBackBtn:(UIButton *)btn;
-(void)ClickCartBtn:(UIButton *)btn;
@end
@interface MySearchBar : UISearchBar<UITextFieldDelegate>
@property (nonatomic,strong)UIButton *CancelBtn;
@property (nonatomic,assign) id<MySearchBardelaget> Mydelaget;
@property (nonatomic,strong)UIButton *BackBtn;
@property (nonatomic,strong)UIButton *ShopCartBtn;
@property(nonatomic,strong)UILabel *BagView;
@property (nonatomic,strong)UIView *Bage;
@property (nonatomic,strong)UIButton *ShopCartClickBtn;
@property (nonatomic,assign)BOOL isKindSearch;
@property (nonatomic,strong)NSString *Keyword;
-(UITextField *)GetSearchTextFiled;
-(void)SetBagNumber:(NSInteger )numb;
@end
