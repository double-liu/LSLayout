//
//  LSCoustomAlert.m
//  SizeClass
//
//  Created by liushuang on 15-1-19.
//  Copyright (c) 2015年 PayEgis Inc. All rights reserved.
//

#import "LSCoustomAlert.h"
#define sheetH 168
#define contentViewColor [UIColor whiteColor]
#define alertBgColor [UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.4]


@implementation LSCoustomAlert

-(instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = alertBgColor;
        CGRect rect = [UIApplication sharedApplication].keyWindow.bounds;
        self.frame = rect;
        self.contentView = [[UIView alloc] init];
        self.isCancle = YES;
        
        //点按手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remove:)];
        [self addGestureRecognizer:tap];
        
    }

    return self;
}

-(instancetype)initWithType:(alertType)type
{
    self = [self init];
    self.type = type;
    if (type == alertType_alert) {
       
        self.contentView.bounds = CGRectMake(0, 0, 200, 100);
        self.contentView.backgroundColor = contentViewColor;
        
    }
    else if(type == alertType_sheetAction)
    {
       CGRect rect = [UIApplication sharedApplication].keyWindow.bounds;
      
       self.contentView.frame = CGRectMake(0, rect.size.height-sheetH, rect.size.width, sheetH);
       self.contentView.backgroundColor = contentViewColor;
    
    }
    
        
    return self;
}



- (void)remove:(UITapGestureRecognizer *)sender
{
    if (self.isCancle) {
        [self cancle:^{
            
        }];
    }else
    {
        return;
    }
    
    
}
-(void)cancle:(CancleBlock)completion
{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = [UIApplication sharedApplication].keyWindow.bounds;
        if (self.type == alertType_sheetAction) {
            self.contentView.frame = CGRectMake(0, rect.size.height, rect.size.width, sheetH);
        }
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.contentView removeFromSuperview];
        
        if (completion) {
            completion();
        }
    }];

}

-(void)show
{
    //动画
    CGRect rect = [UIApplication sharedApplication].keyWindow.bounds;
  
    [UIView animateWithDuration:0.5 animations:^{
        if (self.type == alertType_sheetAction) {
             self.contentView.frame = CGRectMake(0, rect.size.height-sheetH, self.contentView.frame.size.width, self.contentView.frame.size.height);
        }
       
    }];
    

    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
       
    if([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)
    {
        
        //解决旋转问题
        float angle = 0.0 ;
        switch ([UIApplication sharedApplication].statusBarOrientation) {
            case 1:
                angle = 0.0;
                break;
            case 2:
                angle = M_PI;
                break;
            case 3:
                angle = M_PI_2;
             
                break;
            case 4:
                angle = -M_PI_2;
         
                break;
                
            default:
                
                break;
        }
     self.contentView.transform = CGAffineTransformMakeRotation(angle);
    }
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.contentView];

}

-(void)showInView:(UIView *)view
{
    //动画
    CGRect rect = [UIApplication sharedApplication].keyWindow.bounds;
   
    [UIView animateWithDuration:0.5 animations:^{
        if (self.type == alertType_sheetAction) {
            self.contentView.frame = CGRectMake(0, rect.size.height-sheetH, self.contentView.frame.size.width, self.contentView.frame.size.height);
        }
        
        
    }];
     [[UIApplication sharedApplication].keyWindow addSubview:self];
     [view addSubview:self.contentView];

}


@end
