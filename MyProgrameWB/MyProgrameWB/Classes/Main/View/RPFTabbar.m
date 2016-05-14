//
//  RPFTabbar.m
//  MyProgrameWB
//
//  Created by 大米 on 16/4/23.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "RPFTabbar.h"
#import "RPFTabbarButton.h"

@interface RPFTabbar()

@property(nonatomic,weak) UIButton *plusButton;

@property (nonatomic, strong) NSMutableArray *buttons;

@property(nonatomic,weak) UIButton *seletedButton;


@end

@implementation RPFTabbar

#pragma mark - 懒加载

- (NSMutableArray *)buttons{
    if (_buttons== nil) {
        _buttons= [NSMutableArray array];
    }
    return _buttons;
}

-(UIButton *)plusButton{
    if (_plusButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        //按钮的尺寸根背景图片一样大
        //sizeToFit:默认会根据北京图片的大小或者根据image和文字的大小计算出按钮最合适的尺寸
        [btn sizeToFit];
        
        _plusButton = btn;
        
        [self addSubview:_plusButton];
    }
    return _plusButton;
}



-(void)setItems:(NSArray *)items{
    _items = items;
    //遍历模型数组 创建应的tabbarButton
    for (UITabBarItem *item in items) {
        
        RPFTabbarButton *btn = [RPFTabbarButton buttonWithType:UIButtonTypeCustom];
        
        //给按钮赋值模型 按钮的内容有模型决定
        btn.item = item;
        
        btn.tag = self.buttons.count;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        if (btn.tag == 0) {//选中第0个
            [self btnClick:btn];
        }
  
        [self addSubview:btn];
        
        //把按钮添加到按钮数组
        [self.buttons addObject:btn];
    }

}
//点击tabbar的响应事件
- (void)btnClick:(UIButton *)button{
    _seletedButton.selected = NO;
    button.selected = YES;
    _seletedButton = button;
    
    //通知tabbarVc切换控制器
    if ([_delegate respondsToSelector:@selector(tabbar:didClickButton:)]) {
        [_delegate tabbar:self didClickButton:button.tag];
    }
}


//布局子控件（调整子空间的位置）
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = width / (self.items.count + 1);
    CGFloat btnH = height;
    
    
    int i = 0;
    //设置tabbarButton的frame
    for (UIView *tabbarButton in self.buttons) {
   
        if (i == 2) {
            i = 3;
        }
   
        btnX = i * btnW;
        
        tabbarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);

        i++;
    }
    //添加按钮的位置
   self.plusButton.center = CGPointMake(width * 0.5, height * 0.5); 
}


    



@end
