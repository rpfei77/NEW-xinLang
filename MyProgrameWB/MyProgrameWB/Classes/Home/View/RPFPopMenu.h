//
//  RPFPopMenu.h
//  MyProgrameWB
//
//  Created by 大米 on 16/5/4.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPFPopMenu : UIImageView


+(instancetype)showInRect:(CGRect)rect;

+ (void)hide;

@property (nonatomic, weak) UIView *contentView;


@end
