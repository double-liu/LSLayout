//
//  ViewController.m
//  LSLayoutDemo
//
//  Created by liushuang on 15-3-23.
//  Copyright (c) 2015年 PayEgis Inc. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LSLayout.h"
#import "checkBox.h"
#import "LSCoustomAlert.h"
@interface ViewController ()
{
     UIButton *btn1;
     UIButton *btn2;
     UIButton *btn3;
     UIButton *btn4;
     UIButton *btn5;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
     btn1 = [[UIButton alloc] init];
     btn2 = [[UIButton alloc] init];
     btn3 = [[UIButton alloc] init];
     btn4 = [[UIButton alloc] init];
     btn5 = [[UIButton alloc] init];
     [self setBtn:btn1 index:1];
     [self setBtn:btn2 index:2];
     [self setBtn:btn3 index:3];
     [self setBtn:btn4 index:4];
     [self setBtn:btn5 index:5];
    btn1.centerX = self.view.centerX.offset(-60);
    btn1.centerY = self.view.centerY.offset(-60);
    btn1.sizeBy(100,100);
    

    btn2.top = btn1.bottom.offset(20);
    btn2.left = btn1.left;
    btn2.WHequalTo(btn1);
    
    btn3.leftSpacingBy(btn1,20);
    btn3.topAlignBy(btn1);
    btn3.WHequalTo(btn1);
    
    btn4.edge(-1,20,10,20);
    btn4.sizeBy(-1,30);
   
    btn5.topSpacingBy(btn3,20);
    btn5.WHequalTo(btn1);
    btn5.leftAlignBy(btn3);
    
    
    CheckBox *box = [CheckBox checkBox:^(BOOL selected) {
        
        if (selected) {

            [btn1 resetConstraint:0 constant:-70];
            [btn1 resetConstraint:1 constant:-70];
            
             [btn3 resetConstraint:0 constant:40];
             [btn2 resetConstraint:0 constant:40];
             [btn5 resetConstraint:0 constant:40];
            
            
        }else
        {
            [btn1 resetConstraint:0 constant:-60];
            [btn1 resetConstraint:1 constant:-60];
            
            [btn3 resetConstraint:0 constant:20];
            [btn2 resetConstraint:0 constant:20];
            [btn5 resetConstraint:0 constant:20];
        }
        
    }];
    
    [self.view addSubview:box];
    box.centerX.centerY = self.view.centerX.centerY;
   
    box.sizeBy(20,20);
  
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

-(void)setBtn:(UIButton *)btn index:(NSInteger) index
{
 btn.translatesAutoresizingMaskIntoConstraints = NO;
 btn.backgroundColor = [UIColor brownColor];
 [btn setTitle:[NSString stringWithFormat:@"btn%li",(long)index] forState:UIControlStateNormal];
 [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
 [self.view addSubview:btn];

}

-(void)onClick:(id)sender
{
    
    
 //在viewDidAppear后，通过设置frame的动画没有效果，可以通过设置transform实现动画效果
 
    if (sender == btn5) {
        if (btn5.selected != YES) {
            [UIView animateWithDuration:1 animations:^{
                btn5.changeOrigin(0,10);
                btn5.changeSize(0,20);
                
            } completion:^(BOOL finished) {
               
                btn5.selected = YES;
               
            }];
        }else
        {
            [UIView animateWithDuration:1 animations:^{
                 btn5.transform  = CGAffineTransformIdentity;
                
            } completion:^(BOOL finished) {
            btn5.selected = NO;
               
            }];
        
        }
       
    }else if (sender == btn4)
    {
        LSCoustomAlert *alert = [[LSCoustomAlert alloc] initWithType:alertType_sheetAction];
       
        [alert show];
    
    }

}


@end
