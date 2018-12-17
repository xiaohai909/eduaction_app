//
//  WCNAreaPickerView.m
//  wmall
//
//  Created by w_app_01 on 15/1/12.
//  Copyright (c) 2015年 w.cn. All rights reserved.
//

#import "WCNAreaPickerView.h"
#import <QuartzCore/QuartzCore.h>

#define SCREEN_WIDTH  [[UIScreen mainScreen]bounds].size.width
#define SCREEN_HEIGHT   [[UIScreen mainScreen]bounds].size.height

@implementation ProvinceEntity

+(NSDictionary *)objectClassInArray
{
    return @{@"citys":[CityEntity class]};
}

@end
@implementation CityEntity

+(NSDictionary *)objectClassInArray
{
    return @{@"areas":[AreaEntity class]};
}

@end
@implementation AreaEntity

@end

@interface WCNAreaPickerView()<UIActionSheetDelegate>
{
   NSArray *provinces, *cities, *areas;
}
@end
@implementation WCNAreaPickerView
@synthesize delegate=_delegate;
@synthesize pickerStyle=_pickerStyle;
@synthesize locate=_locate;
@synthesize locatePicker = _locatePicker;

-(WCNLocation *)locate
{
    if (_locate == nil) {
        _locate = [[WCNLocation alloc] init];
    }
    
    return _locate;
}

- (id)initWithStyle:(WCNAreaPickerStyle)pickerStyle delegate:(id<WCNAreaPickerDelegate>)delegate
{
    self = [[[NSBundle mainBundle] loadNibNamed:@"WCNAreaPickerView" owner:self options:nil] objectAtIndex:0];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT+260);
        self.delegate = delegate;
        self.pickerStyle = pickerStyle;
        self.locatePicker.dataSource = self;
        self.locatePicker.delegate = self;
        [self query];
        self.backgroundColor = [ UIColor colorWithWhite:0.0 alpha:0.5];
        [self layoutIfNeeded];
    }
    return self;
}

//查询
- (void)query
{
    provinces = [WCNAreaPickerView configArr];
    [_locatePicker reloadComponent:0];
    [_locatePicker selectRow:0 inComponent:0 animated:YES];
    [self pickerView:_locatePicker didSelectRow:0 inComponent:0];
    
}

+(NSArray *)configArr{
    NSData *fileData = [[NSData alloc]init];
    NSUserDefaults *UD = [NSUserDefaults standardUserDefaults];
    if ([UD objectForKey:@"city"] == nil) {
        NSString *path;
        path = [[NSBundle mainBundle] pathForResource:@"address" ofType:@"json"];
        fileData = [NSData dataWithContentsOfFile:path];
        [UD setObject:fileData forKey:@"city"];
        [UD synchronize];
    }else{
        fileData = [UD objectForKey:@"city"];
    }
    NSArray *addressArr = [NSJSONSerialization JSONObjectWithData:fileData options:NSJSONReadingMutableContainers error:nil];
    return [ProvinceEntity mj_objectArrayWithKeyValuesArray:addressArr];
}


#pragma mark - PickerView lifecycle

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (self.pickerStyle == WCNAreaPickerWithStateAndCityAndDistrict) {
        return 3;
    } else{
        return 2;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (self.pickerStyle == WCNAreaPickerWithStateAndCityAndDistrict) {
        switch (component) {
            case 0:
                return [provinces count];
                break;
            case 1:
                return [cities count];
                break;
            case 2:
                return [areas count];
                break;
            
            default:
                return 0;
                break;
        }
    } else {
        switch (component) {
            case 0:
                return [provinces count];
                break;
            case 1:
                return [cities count];
                break;
            default:
                return 0;
                break;
        }
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (self.pickerStyle ==WCNAreaPickerWithStateAndCityAndDistrict) {
        switch (component) {
            case 0:
            {
                ProvinceEntity *entity = [provinces objectAtIndex:row];
                return entity.name;
            }
            break;
            case 1:
            {
                CityEntity *entity = [cities objectAtIndex:row];
                return entity.name;
            }
             break;
            case 2:
            {
                    AreaEntity *entity = [areas objectAtIndex:row];
                    return  entity.name;
            }
                break;
            default:
                return  @"";
                break;
        }
    } else{
        switch (component) {
            case 0:
            {
                    ProvinceEntity *entity = [provinces objectAtIndex:row];
                    return entity.name;
            }
               break;
            case 1:
            {
                    CityEntity *entity = [cities objectAtIndex:row];
                    return entity.name;
            }
                break;
            default:
                return @"";
                break;
        }
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (self.pickerStyle == WCNAreaPickerWithStateAndCityAndDistrict) {
        switch (component) {
            case 0:
            {
                if ([provinces count]>0) {
                    ProvinceEntity *entity =[provinces objectAtIndex:row];
                    cities = entity.citys;
                    self.locate.state = entity.name;
                    self.locate.stateCode = entity.pid;
                    [_locatePicker reloadComponent:1];
                    [_locatePicker selectRow:0 inComponent:1 animated:YES];
                    [self pickerView:_locatePicker didSelectRow:0 inComponent:1];
                }
                break;
            }
            case 1:{
                if ([cities count]>0) {
                    
                    CityEntity *entity =[cities objectAtIndex:row];
                    self.locate.city = entity.name;
                    self.locate.cityCode = entity.cid;
                    areas = entity.areas;
                    [_locatePicker reloadComponent:2];
                    [_locatePicker selectRow:0 inComponent:2 animated:YES];
                    [self pickerView:_locatePicker didSelectRow:0 inComponent:2];
                }
                break;
            }
            case 2:{
                if ([areas count] > 0) {
                    AreaEntity *entity =[areas objectAtIndex:row];
                    self.locate.district =entity.name;
                    self.locate.districtCode =entity.aid;
                } else{
                    self.locate.district = @"";
                }
                break;
            }
            default:
                break;
        }
    }else{
        switch (component) {
            case 0:
            {
                if ([provinces count]>0) {
                    ProvinceEntity *entity =[provinces objectAtIndex:row];
                    cities = entity.citys;
                    self.locate.state = entity.name;
                    self.locate.stateCode = entity.pid;
                    [_locatePicker reloadComponent:1];
                    [_locatePicker selectRow:0 inComponent:1 animated:YES];
                    [self pickerView:_locatePicker didSelectRow:0 inComponent:1];
                }
                break;
            }
            case 1:{
                if ([cities count]>0) {
                    CityEntity *entity =[cities objectAtIndex:row];
                    self.locate.city = entity.name;
                    self.locate.cityCode = entity.cid;
                }
                break;
            }
            default:
                break;
        }

    }
    
}

- (IBAction)cancelAction:(id)sender {
    [self cancelPicker];
}
- (IBAction)confirmAction:(id)sender {
    if ([_delegate respondsToSelector:@selector(pickerDidChangeStatus:)]){
        [_delegate pickerDidChangeStatus:self];
        [self cancelPicker];
    }
}

#pragma mark - animation

- (void)show
{
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
    [UIView animateWithDuration:0.25 animations:^{
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self layoutIfNeeded];
    }];
    
}

- (void)cancelPicker
{    
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height+260);
                         [self layoutIfNeeded];
                     }
                     completion:^(BOOL finished){
                         [self removeFromSuperview];
                     }];
    
}
@end
