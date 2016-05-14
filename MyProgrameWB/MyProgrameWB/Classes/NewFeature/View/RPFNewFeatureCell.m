//
//  RPFNewFeatureCell.m
//  MyProgrameWB
//
//  Created by 大米 on 16/5/12.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "RPFNewFeatureCell.h"
#import "RPFTabbarController.h"


@interface RPFNewFeatureCell()
@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, weak) UIButton *shardButton;

@property (nonatomic, weak) UIButton *startButton;

@end

@implementation RPFNewFeatureCell

- (UIButton *)shardButton{
    if (_shardButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitle:@"分享给大家" forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn sizeToFit];
        
        [btn addTarget:self action:@selector(shard) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:btn];
        _shardButton = btn;
    }
    return _shardButton;
}

- (UIButton *)startButton{
    
    if (_startButton == nil) {
        
        UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [startButton setTitle:@"开始微博" forState:UIControlStateNormal];
        
        [startButton setImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        [startButton setImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
        
        [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [startButton sizeToFit];
        
        [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.contentView addSubview:startButton];
        
        _startButton = startButton;

    }
    return _startButton;
}




- (UIImageView *)imageView{
    
    if (_imageView == nil) {
        UIImageView *imageV = [[UIImageView alloc]init];
        
        _imageView = imageV;
        
        //注意：一定要加载contentView
        [self.contentView addSubview:imageV];
    }
    
    return _imageView;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    
    self.shardButton.center = CGPointMake(self.width * 0.5, self.height * 0.7);
    self.startButton.center = CGPointMake(self.width * 0.5 + 35, self.height * 0.8);
    
    
    
}

- (void)setImage:(UIImage *)image{
    _image = image;
    
    self.imageView.image = self.image;
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count{
    if (indexPath.row == count - 1) {
        self.shardButton.hidden = NO;
        self.startButton.hidden = NO;
    }else{
        self.shardButton.hidden = YES;
        self.startButton.hidden = YES;
    }
}


- (void)shard{
    
    self.shardButton.selected = !self.shardButton.selected;
}


- (void)start{
    RPFLog(@"%s",__func__);
    
    RPFTabbarController *tabbar = [[RPFTabbarController alloc]init];
    RPFKeyWindow.rootViewController = tabbar;
    
}




@end
