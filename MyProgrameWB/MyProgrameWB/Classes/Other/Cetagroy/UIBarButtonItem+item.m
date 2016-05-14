//
//  UIBarButtonItem+item.m
//  MyProgrameWB
//
//  Created by 大米 on 16/4/30.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "UIBarButtonItem+item.h"

@implementation UIBarButtonItem (item)


+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    UIButton *btn = [[UIButton alloc]init];
    
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:highImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    
    //点击事件
    [btn addTarget:target action:action forControlEvents:controlEvents];
    
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];;
}



@end
