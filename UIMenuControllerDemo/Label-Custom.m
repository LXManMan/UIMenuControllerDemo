

//
//  Label-Custom.m
//  UIMenuControllerDemo
//
//  Created by chuanglong02 on 16/11/3.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "Label-Custom.h"

@implementation Label_Custom

-(void)awakeFromNib
{
    [super awakeFromNib ];
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
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)]];
  
}
- (void)labelClick  {
    // 1.label要成为第一响应者(作用是:告诉UIMenuController支持哪些操作, 这些操作如何处理)
    [self becomeFirstResponder];
    
    // 2.显示MenuController
    UIMenuController *menu = [UIMenuController sharedMenuController];
    
    // 添加MenuItem
    UIMenuItem *ding = [[UIMenuItem alloc] initWithTitle:@"顶" action:@selector(ding:)];
    UIMenuItem *reply = [[UIMenuItem alloc] initWithTitle:@"回复" action:@selector(reply:)];
    UIMenuItem *report = [[UIMenuItem alloc] initWithTitle:@"举报" action:@selector(report:)];
    menu.menuItems = @[ding, reply, report];
    
    CGRect rect  = CGRectMake(0, self.frame.size.height * 0.5, self.frame.size.width, 20);
    [menu setTargetRect:rect inView:self];
    [menu setMenuVisible:YES animated:YES];
}
- (void)ding:(UIMenuController *)menu  {
    NSLog(@"%s %@", __func__ , menu);
    [self.delegate ding:self];
}

- (void)reply:(UIMenuController *)menu  {
    NSLog(@"%s %@", __func__ , menu);
        [self.delegate reply:self];
}

- (void)report:(UIMenuController *)menu  {
    NSLog(@"%s %@", __func__ , menu);
        [self.delegate report:self];
}
//让label 有资格成为第一响应者
-(BOOL)canBecomeFirstResponder
{
    return YES;
}
/**
 * label能执行哪些操作(比如copy, paste等等)
 * @return  YES:支持这种操作
 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender  {
    if (
        action == @selector(ding:)
        || action == @selector(reply:)
        || action == @selector(report:)) return YES;
    
    return NO;
 
}
@end
