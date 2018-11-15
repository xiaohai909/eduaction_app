//
//  SyllabusMainCRView.m
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "SyllabusMainCRView.h"

@implementation SyllabusMainCRView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [RACObserve(self.btn_sign, selected) subscribeNext:^(NSNumber *x) {
        if ([x boolValue]) {
            self.btn_sign.transform = CGAffineTransformMakeRotation(M_PI_2);
        }
        else{
            self.btn_sign.transform = CGAffineTransformMakeRotation(0);
        }
    }];
}
- (IBAction)btnAction:(UIButton *)sender {
    if (self.blockClick) {
        self.blockClick();
    }
}

@end
