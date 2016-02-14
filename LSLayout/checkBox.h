//
//  checkBox.h
//  SizeClass
//
//  Created by liushuang on 15-3-31.
//  Copyright (c) 2015年 PayEgis Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MarkView;
typedef  void (^CheckBoxBlock)(BOOL selected);

@interface CheckBox : UIButton

+(instancetype)checkBox:(CheckBoxBlock) action;
@property (nonatomic, strong) MarkView *mark;
@property (nonatomic, copy) CheckBoxBlock checkBoxAction;

@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) UIColor *borderColor;

@end

