//
//  UIView+frame.m
//  MyProgrameWB
//
//  Created by 大米 on 16/4/24.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "UIView+frame.h"

@implementation UIView (frame)



- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


//- (void)setX:(CGFloat)x{
//    CGRect frame = self.frame;
//    frame.origin.x = x;
//    self.frame = frame;
//}
//
//- (CGFloat)x{
//    return self.frame.origin.x;
//}
//
//- (void)setY:(CGFloat)y{
//    CGRect frame = self.frame;
//    frame.origin.y = y;
//    self.frame = frame;
//}
//
//- (CGFloat)y{
//     return  self.frame.origin.y;
//}
//
//-(void)setWidth:(CGFloat)width{
//    CGRect frame = self.frame;
//    frame.size.width = width;
//    self.frame = frame;
//}
//
//- (CGFloat)width{
//    
//    return self.frame.size.width;
//}
//
//-(void)setHeight:(CGFloat)height{
//    CGRect frame = self.frame;
//    frame.size.height = height;
//    self.frame = frame;
//}
//
//-(CGFloat)height{
//    return self.frame.size.height;
//}
//


@end
