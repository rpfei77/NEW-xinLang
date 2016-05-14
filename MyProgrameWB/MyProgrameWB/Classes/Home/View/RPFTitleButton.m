//
//  RPFTitleButton.m
//  MyProgrameWB
//
//  Created by 大米 on 16/4/30.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "RPFTitleButton.h"

//#import "UIImage+image.h"



@implementation RPFTitleButton

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
       [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
       [self setBackgroundImage:[UIImage imageWithStretchableName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
        
    }
    
    return self;
}


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (self.currentImage == nil) return;
    
    
//    //设置title
//    self.titleLabel.x = self.imageView.x;
//    NSLog(@"第二次%f==%f",self.titleLabel.x,self.imageView.x);
//    //设置image
//    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
//     NSLog(@"第三次%f ==%f",self.titleLabel.x,self.imageView.x);
    //获取按钮的frame
    CGFloat buttonW = self.frame.size.width;
    CGFloat buttonH = self.frame.size.height;
    //获取字体的frame
    CGFloat titleW = self.titleLabel.frame.size.width;
    //获取图片的frame
    CGFloat imageW = self.imageView.frame.size.width;
    CGFloat imageH = self.imageView.frame.size.height;
    
    CGFloat titleX = (buttonW - titleW - imageW - 5) * 0.5;
    self.titleLabel.frame = CGRectMake(titleX, 0, titleW, buttonH);
    
    CGFloat imageX = titleX + titleW + 5;
    CGFloat imageY = (buttonH - imageH) * 0.5;
    
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    
    
    
    
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self sizeToFit];
    
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self sizeToFit];
}


@end
