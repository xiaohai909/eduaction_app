//
//  MakeProblemPopView.m
//  eduaction_app
//
//  Created by Mac on 2018/11/8.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemPopView.h"

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

    return setView;
}
- (IBAction)switchChange:(UISwitch *)sender {
    sender.on = !sender.on;
    //改变存储
}
- (IBAction)btnTextFontChange:(UIButton *)sender {
    self.btn_normal.selected = self.btn_big.selected = self.btn_bigger.selected = NO;
    sender.selected = YES;
    //改变存储
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
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"点击这里，添加笔记"]) {
        textView.text = @"";
        textView.textColor = HexRGB(0x333333);
    }
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@""] && range.location==0 && range.length==1){
        self.btn_send.userInteractionEnabled = NO;
        self.btn_send.selected = NO;
        self.btn_send.layer.borderWidth = 1.0;
        self.btn_send.backgroundColor = [UIColor whiteColor];
    }
    else if (![text isEqualToString:@"点击这里，添加笔记"]) {
        self.btn_send.userInteractionEnabled = YES;
        self.btn_send.selected = YES;
        self.btn_send.layer.borderWidth = 0.0;
        self.btn_send.backgroundColor = HexRGB(0xFF6B6B);
    }
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.text.length>0 && ![textView.text isEqualToString:@"点击这里，添加笔记"]) {
        self.btn_send.userInteractionEnabled = YES;
        self.btn_send.selected = YES;
        self.btn_send.layer.borderWidth = 0.0;
        self.btn_send.backgroundColor = HexRGB(0xFF6B6B);
    }
    else{
        textView.text = @"点击这里，添加笔记";
        textView.textColor = HexRGB(0x999999);
        self.btn_send.userInteractionEnabled = NO;
        self.btn_send.selected = NO;
        self.btn_send.layer.borderWidth = 1.0;
        self.btn_send.backgroundColor = [UIColor whiteColor];
    }
}
@end
