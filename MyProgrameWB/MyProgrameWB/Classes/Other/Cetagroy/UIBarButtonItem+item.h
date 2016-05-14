//
//  UIBarButtonItem+item.h
//  MyProgrameWB
//
//  Created by 大米 on 16/4/30.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (item)


+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;


@end
