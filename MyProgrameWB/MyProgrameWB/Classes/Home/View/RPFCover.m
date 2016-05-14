//
//  RPFCover.m
//  MyProgrameWB
//
//  Created by 大米 on 16/5/4.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "RPFCover.h"

@implementation RPFCover

-(void)setDimBackgrund:(BOOL)dimBackgrund{
    
    _dimBackgrund = dimBackgrund;
    
    if (dimBackgrund) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.3;
    }else{
        self.alpha = 1.0;
        self.backgroundColor = [UIColor clearColor];
    }
    
    
    
}



+ (instancetype)show{
    
    RPFCover *cover = [[RPFCover alloc]initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor clearColor];
    
    [RPFKeyWindow addSubview:cover];
    
    return cover;
   
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //移除蒙板
    [self removeFromSuperview];
    
    //移除pop
    
    if ([_delegate respondsToSelector:@selector(coverDidClickCover:)]) {
        [_delegate coverDidClickCover:self];
    }
    
}



@end
