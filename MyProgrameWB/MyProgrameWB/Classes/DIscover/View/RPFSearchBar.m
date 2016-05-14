//
//  RPFSearchBar.m
//  MyProgrameWB
//
//  Created by 大米 on 16/5/6.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "RPFSearchBar.h"

@implementation RPFSearchBar

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.font = [UIFont systemFontOfSize:13];
        //设置背景图片
        self.background = [UIImage imageWithStretchableName:@"searchbar_textfield_background"];
        
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        
        
        imageV.width += 10;
        imageV.contentMode = UIViewContentModeCenter;
        
        self.leftView = imageV;
        
        //一定要设置,左边视图模式显示的模式
        self.leftViewMode = UITextFieldViewModeAlways;
        
        
        
    }
    return self;
}
@end
