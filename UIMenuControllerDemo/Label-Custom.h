//
//  Label-Custom.h
//  UIMenuControllerDemo
//
//  Created by chuanglong02 on 16/11/3.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Label_Custom;
@protocol Label_CustomDeletage<NSObject>
-(void)ding:(Label_Custom *)label;
-(void)reply:(Label_Custom *)label;
-(void)report:(Label_Custom *)label;
@end

@interface Label_Custom : UILabel
@property(nonatomic,assign)id<Label_CustomDeletage>delegate;
@end
