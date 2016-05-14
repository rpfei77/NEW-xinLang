//
//  RPFBadgeView.m
//  MyProgrameWB
//
//  Created by 大米 on 16/4/24.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "RPFBadgeView.h"
#import "UIView+frame.h"

@implementation RPFBadgeView

#define RPFFontSize [UIFont systemFontOfSize:11]


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        
        self.userInteractionEnabled = NO;
        //设置字体的大小
        self.titleLabel.font = RPFFontSize;
        [self sizeToFit];
    }
    
    
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue{
    _badgeValue = badgeValue;
    
    //判断badgeValue是否为空
    if (badgeValue.length == 0 || [badgeValue isEqualToString:@"0"]) {//没有内容或者字符串为空
        self.hidden = YES;
    }else{
        self.hidden = NO;
    }
    
    
    CGSize size = [badgeValue sizeWithFont:RPFFontSize];
    
    if (size.width > self.width) {
        //NSLog(@"%f==%f",size.width,self.width);
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
        [self setTitle:nil forState:UIControlStateNormal];
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        [self setTitle:badgeValue forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
    }
    
    
    
}

@end
