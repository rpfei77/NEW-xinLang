//
//  RPFPopMenu.m
//  MyProgrameWB
//
//  Created by 大米 on 16/5/4.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "RPFPopMenu.h"

@implementation RPFPopMenu

+ (instancetype)showInRect:(CGRect)rect{
    
    RPFPopMenu *menu = [[RPFPopMenu alloc]initWithFrame:rect];
    
    menu.userInteractionEnabled = YES;
    menu.image = [UIImage imageWithStretchableName:@"popover_background"];
    
    [RPFKeyWindow addSubview:menu];
    
    return menu;
    
}


+ (void)hide{
    for (UIView *viewClick in RPFKeyWindow.subviews) {
        if ([viewClick isKindOfClass:self]) {
            [viewClick removeFromSuperview];
        }
    }
}

-(void)setContentView:(UIView *)contentView{
    
    //移除之前的
    [_contentView removeFromSuperview];
    
    _contentView = contentView;
    _contentView.backgroundColor = [UIColor clearColor];
    
    //添加到view上
    [self addSubview:contentView];
    
    
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    //计算内容视图尺寸
    
    CGFloat y = 9;
    CGFloat margin = 5;
    CGFloat x = margin;
    CGFloat w = self.width - 2 * margin;
    CGFloat h = self.height - y - margin;
    
    _contentView.frame = CGRectMake(x, y, w, h);
    
    
}




@end
