//
//  LSCoustomAlert.h
//  SizeClass
//
//  Created by liushuang on 15-1-19.
//  Copyright (c) 2015年 PayEgis Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  enum
{   alertType_alert,
    alertType_sheetAction,
} alertType;
typedef void(^CancleBlock)();
@interface LSCoustomAlert : UIView

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, assign) alertType type;
@property (nonatomic, assign) BOOL isCancle;  //defult is YES

-(void)show;
-(void)showInView:(UIView *)view;
-(void)cancle:(CancleBlock)completion;
-(instancetype)initWithType:(alertType)type;



@end
