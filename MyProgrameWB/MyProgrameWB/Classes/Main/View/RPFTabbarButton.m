//
//  RPFTabbarButton.m
//  MyProgrameWB
//
//  Created by 大米 on 16/4/24.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "RPFTabbarButton.h"
#import "RPFBadgeView.h"

//#import "UIView+frame.h"

@interface RPFTabbarButton()

@property(nonatomic,weak) RPFBadgeView *badgeView;
@end



@implementation RPFTabbarButton

#define RPFimageRideo 0.7

//重写highlighted，取消高亮状态
-(void)setHighlighted:(BOOL)highlighted{}


- (RPFBadgeView *)badgeView{
    if (_badgeView == nil) {
        
        RPFBadgeView *btn = [RPFBadgeView buttonWithType:UIButtonTypeCustom];
        
        [self addSubview:btn];
        _badgeView = btn;
    }
    return _badgeView;
}


-(void)setItem:(UITabBarItem *)item{
    
    _item = item;
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
//    [self setTitle:item.title forState:UIControlStateNormal];
//    [self setImage:item.image forState:UIControlStateNormal];
//    [self setImage:item.selectedImage forState:UIControlStateSelected];
//    
//    //设置badgeValue
//    self.badgeView.badgeValue = item.badgeValue;
    
    //KVO监听属性值的改变
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
    
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    //NSLog(@"%@",_item.badgeValue);
    [self setTitle:_item.title forState:UIControlStateNormal];
    [self setImage:_item.image forState:UIControlStateNormal];
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    
    //设置badgeValue
    self.badgeView.badgeValue = _item.badgeValue;

    
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
        self.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    
    
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH = self.bounds.size.height * RPFimageRideo;
    
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    
    CGFloat lableX = 0;
    CGFloat lableY = imageH - 3;
    CGFloat labkeW = self.bounds.size.width;
    CGFloat lableH = self.bounds.size.height - imageH;
    
    self.titleLabel.frame = CGRectMake(lableX, lableY, labkeW, lableH);
    
    
    self.badgeView.x = self.width - self.badgeView.width - 10;
    self.badgeView.y = 0;
}



@end
