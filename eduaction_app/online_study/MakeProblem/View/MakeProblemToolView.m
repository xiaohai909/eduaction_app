//
//  MakeProblemToolView.m
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemToolView.h"

@implementation MakeProblemToolView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    //如果是iphonex，高度要修改一下
    CGRect self_frame = frame;
    if (UI_IS_IPHONE_X && (frame.size.height+frame.origin.y == ZTHeight-NaviIPHONEX)) {//是最底下的工具栏
        self_frame.origin.y = frame.origin.y-20;
        self_frame.size.height = frame.size.height+20;
    }
    self = [super initWithFrame:self_frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.btn_array = [NSMutableArray array];
        
        if (frame.size.height+frame.origin.y == ZTHeight-NaviIPHONEX) {
            UIView *line_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.py_width, 1)];
            line_view.backgroundColor = HexRGB(0xF3F3F3);
            [self addSubview:line_view];
        }
        else{
            UIView *line_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.py_width, self.py_height)];
            line_view.backgroundColor = [UIColor whiteColor];
            line_view.layer.shadowColor = HexRGBAlpha(0x212121,0.2).CGColor;
            line_view.layer.shadowOffset = CGSizeMake(0,2);
            line_view.layer.shadowOpacity = 1;
            line_view.layer.shadowRadius = 9;
            line_view.layer.cornerRadius = 2.5;
            [self addSubview:line_view];
        }
       
    }
    return self;
}
- (void)creatToolViewWithType:(MakeProblemToolType)type//WithTitle:(NSArray *)titles ansImages:(NSArray *)images
{

    self.toolType = type;
    
    NSArray *title_name;
    if (type == MakeProblemToolTypeErrorPractice) {
        title_name = @[@"收藏",@"笔记",@"切换",@"设置"];
        [self creatLineTypeBtn:YES andTitles:title_name];
    }
    else if (type == MakeProblemToolTypeSimulateExam) {
        title_name = @[@"考试用时",@"交卷"];//@"更多"
        [self creatLineTypeBtn:YES andTitles:title_name];
    }
    else if (type == MakeProblemToolTypeRandomPractice) {
        title_name = @[@"收藏",@"笔记",@"批阅",@"设置"];
        [self creatLineTypeBtn:YES andTitles:title_name];
    }
    else if (type == MakeProblemToolTypeChangeMode) {
        title_name = @[@"答题模式",@"浏览模式"];
        [self creatLineTypeBtn:NO andTitles:title_name];
    }
    else if (type == MakeProblemToolTypeMoreMode) {
        title_name = @[@"答题模式",@"考试模式",@"背题模式",@"设置"];
        [self creatLineTypeBtn:NO andTitles:title_name];
    }
    
}

- (void)creatLineTypeBtn:(BOOL)line andTitles:(NSArray *)title_name{
    /*
     MakeProblemToolTypeNormal,//错题练习模式：收藏，笔记，切换（答题模式，浏览模式），设置（答题后跳转，字体设置）
     MakeProblemToolTypeRandomExam,//随机考试模式：收藏，笔记，考试用时，更多（试题反馈，设置）
     MakeProblemToolTypeRandomPractice,//随机练习模式：收藏，笔记，批阅，设置(更多)（答题模式，考试模式，背题模式，设置（答题后跳转，字体设置））
     ？考试用时,交卷，更多
     */
    NSDictionary *image_name = @{@"收藏":@"wrong question_ico_collection",@"笔记":@"wrong question_ico_pen",@"切换":@"wrong question_ico_switch",@"设置":@"wrong question_ico_setting",@"更多":@"wrong question_ico_more",@"批阅":@"wrong question_ico_library",@"交卷":@"random_ico_carry out an assignment",@"考试用时":@"wrong question_ico_collection",@"答题模式":@"wrong question_ico_notes",@"浏览模式":@"wrong question_ico_browse",@"考试模式":@"subject_ico_examination",@"背题模式":@"subject_ico_back problem"};
    NSDictionary *image_selectName = @{@"收藏":@"subjeck_btn_collection",@"笔记":@"subjeck_btn_pen",@"切换":@"search_btn_refresh",@"设置":@"wrong question_ico_setting",@"更多":@"wrong question_ico_more",@"批阅":@"wrong question_ico_library",@"交卷":@"random_ico_carry out an assignment",@"考试用时":@"wrong question_ico_collection",@"答题模式":@"wrong question_btn_notes",@"浏览模式":@"wrong question_btn_browse",@"考试模式":@"subject_btn_examination",@"背题模式":@"subject_btn_back problem"};
    
    if (line) {//长条的一排
        float height = UI_IS_IPHONE_X?self.py_height-20:self.py_height;
        for (int i=0; i<title_name.count; i++) {
            CGRect frame = (CGRect){self.py_width/title_name.count*i,0,self.py_width/title_name.count,height};
            if ([title_name[i] isEqualToString:@"考试用时"]) {
                [self addSubview:[self timeViewWithFrame:frame]];
            }
            else{
                [self addSubview:[self creatBtnWith:frame andVerticalType:YES andImage:image_name[title_name[i]] andTitle:title_name[i] andSelectImage:image_selectName[title_name[i]]]];
            }
        }
    }
    else{//一列
        float height = self.py_height/title_name.count;
        for (int i=0; i<title_name.count; i++) {
            CGRect frame = (CGRect){0,height*i,self.py_width,height};
            [self addSubview:[self creatBtnWith:frame andVerticalType:NO andImage:image_name[title_name[i]] andTitle:title_name[i] andSelectImage:nil]];//image_selectName[title_name[i]]]
        }
    }
    
}

- (UIButton *)creatBtnWith:(CGRect)frame andVerticalType:(BOOL)vertical andImage:(NSString *)imageName andTitle:(NSString *)title andSelectImage:(NSString *)selectName
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    btn.frame = frame;    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:HexRGB(0x999999) forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    if (imageName.length) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        if (selectName.length) {
            //有选中状态
            [btn setImage:[UIImage imageNamed:selectName] forState:UIControlStateSelected];
            [btn setTitleColor:HexRGB(0xFF6B6B) forState:UIControlStateSelected];//选中的颜色
        }
        if (vertical) {
            [btn setVerticalModeTopOffset:2 andBottom:-10];
        }
    }
    
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (self.blockGoOn) {
            self.blockGoOn(btn);
        }
    }];
    [self.btn_array addObject:btn];
    return btn;
}
- (UIView *)timeViewWithFrame:(CGRect)frame
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    UIButton *btn_time = [self creatBtnWith:(CGRect){0,0,view.py_width,view.py_height/2} andVerticalType:YES andImage:nil andTitle:@"倒计时" andSelectImage:nil];
    [btn_time setTitleColor:HexRGB(0xFF6B6B) forState:UIControlStateNormal];
    [view addSubview:btn_time];
    
    [view addSubview:[self creatBtnWith:(CGRect){0,view.py_height/2,view.py_width,view.py_height/2} andVerticalType:YES andImage:nil andTitle:@"考试时间" andSelectImage:nil]];
    
    [self.btn_array addObject:btn_time];
    return view;
}



@end


