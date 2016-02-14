//
//  checkBox.m
//  SizeClass
//
//  Created by liushuang on 15-3-31.
//  Copyright (c) 2015年 PayEgis Inc. All rights reserved.
//

#import "checkBox.h"
#import <QuartzCore/QuartzCore.h>
@implementation CheckBox
+(instancetype)checkBox:(CheckBoxBlock)action
{
    CheckBox *box = [[CheckBox alloc] init];
    box.layer.borderWidth = 1;
    box.layer.borderColor = [UIColor grayColor].CGColor;
    box.checkBoxAction = action;
    [box addTarget:box action:@selector(markAction:) forControlEvents:UIControlEventTouchUpInside];
   
    return box;

}

-(void)setBorderColor:(UIColor *)borderColor
{
self.layer.borderColor = borderColor.CGColor;
}
-(void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}


-(void)markAction:(id)sender
{   UIButton *btn = (UIButton *)sender;
    if (btn.selected) {
        btn.selected = NO;
    }else
    {
    btn.selected = YES;
    }

    if (self.checkBoxAction) {
        self.checkBoxAction(btn.selected);
    }
}
 


- (void)drawRect:(CGRect)rect {
    
    
    //绘制白色背景
    CGContextRef con = UIGraphicsGetCurrentContext(); //获取当前ctx
    
    CGContextAddRect(con, rect);
    CGContextSetFillColorWithColor(con, [UIColor whiteColor].CGColor);
    
    CGContextFillPath(con);
    if (self.selected) {
        
        CGFloat W = rect.size.width - 2*self.borderWidth;
        CGFloat H = rect.size.height- 2*self.borderWidth;

        //绘制勾
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        
        CGContextSetLineWidth(con, W/10);  //线宽
        
        CGContextSetAllowsAntialiasing(con, YES);
        
        CGContextSetRGBStrokeColor(con, 160/255.0, 215/255.0, 57/255.0, 1.0);  //颜色
        
        CGContextBeginPath(con);
        
        CGContextMoveToPoint(con, W/4+self.borderWidth, H/2+self.borderWidth);  //起点坐标
        CGContextAddLineToPoint(con, W/2+self.borderWidth, 11*H/16+self.borderWidth);   //终点坐标
        CGContextAddLineToPoint(con, 3*W/4+self.borderWidth, H/4+self.borderWidth);
        
        CGContextStrokePath(con);
    }        
}

@end





