//
//  MakeProblemPopView.m
//  eduaction_app
//
//  Created by Mac on 2018/11/8.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemPopView.h"

NSString *const MakeProblemSetMessage = @"MakeProblemSetMessage";
NSString *const MakeProblemSetMessageGO = @"MakeProblemSetMessageGO";
NSString *const MakeProblemSetMessageTextFont = @"MakeProblemSetMessageTextFont";


@implementation MakeProblemPopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (MakeProblemPopView *)creatSetPopView
{
 
    static MakeProblemPopView *setView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MakeProblemPopView class]) owner:nil options:nil];
        setView = [arr firstObject];
        setView.frame = (CGRect){2,ZTHeight,ZTWidth-4,UI_IS_IPHONE_X?150:130};
        
        [setView.btn_normal setVerticalModeTopOffset:2 andBottom:-25];
        [setView.btn_big setVerticalModeTopOffset:2 andBottom:-25];
        [setView.btn_bigger setVerticalModeTopOffset:2 andBottom:-25];
        
        setView.layer.cornerRadius = 5;
    });
    //数据控制,跳转下一题，字体大小
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:MakeProblemSetMessage]];
    setView.switch_auto.on = [[dic objectForKey:MakeProblemSetMessageGO] boolValue];
    NSInteger tag = [[dic objectForKey:MakeProblemSetMessageTextFont] integerValue];
    setView.btn_normal.selected = setView.btn_big.selected = setView.btn_bigger.selected = NO;
    if (tag == 0) {
        setView.btn_normal.selected = YES;
    }
    else if (tag == 2){
        setView.btn_big.selected = YES;
    }
    else if (tag == 4){
        setView.btn_bigger.selected = YES;
    }
    return setView;
}
- (IBAction)switchChange:(UISwitch *)sender {
    sender.on = !sender.on;
    //改变存储
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:MakeProblemSetMessage]];
    [dic setObject:[NSNumber numberWithBool:sender.on] forKey:MakeProblemSetMessageGO];
    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:MakeProblemSetMessage];
    if (self.blockChange) {
        self.blockChange();
    }
}

- (IBAction)btnTextFontChange:(UIButton *)sender {
    self.btn_normal.selected = self.btn_big.selected = self.btn_bigger.selected = NO;
    sender.selected = YES;
    //改变存储
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:MakeProblemSetMessage]];
    [dic setObject:[NSNumber numberWithInteger:sender.tag] forKey:MakeProblemSetMessageTextFont];//
    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:MakeProblemSetMessage];
    if (self.blockChange) {
        self.blockChange();
    }
}

+ (MakeProblemPopView *)creatNotePopView
{
    static MakeProblemPopView *noteView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *arr = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([MakeProblemPopView class]) owner:nil options:nil];
        noteView = arr[1];
        noteView.frame = (CGRect){2,ZTHeight,ZTWidth-4,ZTHeight-NaviIPHONEX};
        
        noteView.btn_send.layer.borderWidth = 1.0;
        noteView.btn_send.layer.borderColor = HexRGB(0x333333).CGColor;
        noteView.btn_send.layer.masksToBounds = YES;
        noteView.btn_send.layer.cornerRadius = 2.5;
        
        noteView.layer.cornerRadius = 5;
        noteView.view_text.delegate = noteView;
        noteView.view_text.placeholder = @"点击这里，添加笔记";
    });
    [noteView.view_text becomeFirstResponder];
    return noteView;
}
- (IBAction)btnCancelAction:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.py_y = ZTHeight;
    } completion:^(BOOL finished) {
        [self.superview removeFromSuperview];
        [self removeFromSuperview];
    }];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@""] && range.location==0 && range.length==1){
        self.btn_send.userInteractionEnabled = NO;
        self.btn_send.selected = NO;
        self.btn_send.layer.borderWidth = 1.0;
        self.btn_send.backgroundColor = [UIColor whiteColor];
    }
    else {
        self.btn_send.userInteractionEnabled = YES;
        self.btn_send.selected = YES;
        self.btn_send.layer.borderWidth = 0.0;
        self.btn_send.backgroundColor = HexRGB(0xFF6B6B);
    }
    return YES;
}
@end
