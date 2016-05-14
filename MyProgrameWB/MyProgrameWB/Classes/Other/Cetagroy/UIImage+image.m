//
//  UIImage+image.m
//  MyProgrameWB
//
//  Created by 大米 on 16/4/22.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)


+ (instancetype)imageWithRenderingMode:(NSString *)imageName{
    
    UIImage *selImage = [UIImage imageNamed:imageName];
    return [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

//图片拉伸
+ (instancetype)imageWithStretchableName:(NSString *)imageName{
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    
}







@end
