//
//  UIImage+image.h
//  MyProgrameWB
//
//  Created by 大米 on 16/4/22.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)



+ (instancetype)imageWithRenderingMode:(NSString *)imageName;

//图片拉伸
+ (instancetype)imageWithStretchableName:(NSString *)imageName;

@end
