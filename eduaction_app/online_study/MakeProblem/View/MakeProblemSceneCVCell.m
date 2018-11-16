//
//  MakeProblemSceneCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemSceneCVCell.h"

@implementation MakeProblemSceneCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0.5;
    layout.minimumInteritemSpacing = 0.5;

    self.collection_main = [[MakeProblemMainCollection alloc] initWithFrame:(CGRect){0, 0, self.py_width,self.py_height} collectionViewLayout:layout andType:MakeProblemModeExam];
    self.collection_main.backgroundColor = [UIColor whiteColor];
    self.collection_main.isAutoReturn = self.isAutoReturn;
    self.collection_main.addTextFont = self.addTextFont;
    [self addSubview:self.collection_main];
    
//    self.view_bottom = [[MakeProblemToolView alloc] initWithFrame:(CGRect){0,ZTHeight-NaviIPHONEX-41,ZTWidth,41}];
//    [self.view_bottom creatToolViewWithType:MakeProblemToolTypeErrorPractice];
//    [self addSubview:self.view_bottom];
}

@end
