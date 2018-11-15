//
//  SearchMainCRView.m
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "SearchMainCRView.h"

@implementation SearchMainCRView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)btnAction:(UIButton *)sender {
    if (self.blockGoOn) {
        self.blockGoOn();
    }
}

@end
