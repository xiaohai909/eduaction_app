//
//  WCNAreaPickerView.h
//  wmall
//
//  Created by w_app_01 on 15/1/12.
//  Copyright (c) 2015年 w.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCNLocation.h"


typedef enum {
    WCNAreaPickerWithStateAndCity,
    WCNAreaPickerWithStateAndCityAndDistrict
} WCNAreaPickerStyle;

@interface ProvinceEntity : NSObject
@property (nonatomic,strong) NSString *pid;
@property (nonatomic,strong) NSString *name;
@property (nonatomic, strong) NSArray *citys;
@end
@interface CityEntity : NSObject

@property (nonatomic,strong) NSString *cid;
@property (nonatomic,strong) NSString *name;
@property (nonatomic, strong) NSArray *areas;

@end

@interface AreaEntity : NSObject

@property (nonatomic, strong) NSString *aid;
@property (nonatomic, strong) NSString *name;

@end

@class WCNAreaPickerView;
@protocol WCNAreaPickerDelegate <NSObject>

@optional
- (void)pickerDidChangeStatus:(WCNAreaPickerView *)picker;

@end

@interface WCNAreaPickerView : UIView <UIPickerViewDelegate, UIPickerViewDataSource>

@property (assign, nonatomic) id <WCNAreaPickerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIPickerView *locatePicker;
@property (strong, nonatomic) WCNLocation *locate;
@property (nonatomic) WCNAreaPickerStyle pickerStyle;

- (id)initWithStyle:(WCNAreaPickerStyle)pickerStyle delegate:(id <WCNAreaPickerDelegate>)delegate;
- (void)show;
- (void)cancelPicker;
+(NSArray *)configArr;

@end
