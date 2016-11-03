//
//  ViewController.m
//  UIMenuControllerDemo
//
//  Created by chuanglong02 on 16/11/3.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "Lable-menu.h"
#import "Label-Custom.h"
@interface ViewController ()<Label_CustomDeletage>
@property(nonatomic,strong)Label_Custom *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   self.label =[[Label_Custom alloc]initWithFrame:CGRectMake(0, 300, 300, 100)];
     self.label.numberOfLines = 0;
     self.label.backgroundColor =[UIColor redColor];
     self.label.textColor =[UIColor blueColor];
    self.label.delegate = self;
     self.label.text = @"哈哈哈哈哈哈哈你大爷的你去屎吧个哈哈让老公GV然后改我如果那人噶二姑家爱人噶人家管加工件爱人噶人接管";
    [self.view addSubview: self.label];
    
    
}
-(void)report:(Label_Custom *)label
{
    NSLog(@"举报");
}
-(void)ding:(Label_Custom *)label
{
    NSLog(@"顶");

}
-(void)reply:(Label_Custom *)label
{
    NSLog(@"回复");

}



@end
