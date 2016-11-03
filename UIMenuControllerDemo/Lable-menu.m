

//
//  Lable-menu.m
//  UIMenuControllerDemo
//
//  Created by chuanglong02 on 16/11/3.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "Lable-menu.h"

@implementation Lable_menu
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
-(void)setup
{
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lableClick)]];
}
//让label 有资格成为第一响应者
-(BOOL)canBecomeFirstResponder
{
    return self;
}
/**
 * label能执行哪些操作(比如copy, paste等等)
 * @return  YES:支持这种操作
 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    if (action == @selector(cut:) || action == @selector(copy:) || action == @selector(paste:)) return YES;
    return NO;
}
- (void)cut:(UIMenuController *)menu {
    // 将自己的文字复制到粘贴板
    [self copy:menu];
    // 清空文字
    self.text = @"";
}
- (void)copy:(UIMenuController *)menu  {
    // 将自己的文字复制到粘贴板
    UIPasteboard *board = [UIPasteboard generalPasteboard];
  
    
//    if (self.text) {
        board.string = self.text;
    

}
- (void)paste:(UIMenuController *)menu {
    // 将粘贴板的文字 复制 到自己身上
    UIPasteboard *board = [UIPasteboard generalPasteboard];
//    if (board.string) {
        self.text = board.string;
//    }
}
- (void)lableClick  {
    // 1.label要成为第一响应者(作用是:告诉UIMenuController支持哪些操作, 这些操作如何处理)
    [self becomeFirstResponder];
    
    // 2.显示MenuController
    UIMenuController *menu = [UIMenuController sharedMenuController];
    // targetRect: MenuController需要指向的矩形框
    menu.arrowDirection = UIMenuControllerArrowDown;

    // targetView: targetRect会以targetView的左上角为坐标原点
    [menu setTargetRect:self.bounds inView:self];
    //    [menu setTargetRect:self.frame inView:self.superview];
    [menu setMenuVisible:YES animated:YES];
}

@end
