//
//  RPFTabbar.h
//  MyProgrameWB
//
//  Created by 大米 on 16/4/23.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RPFTabbar;

@protocol RPFTabbarDelegate <NSObject>

@optional
- (void)tabbar:(RPFTabbar *)tabbar didClickButton:(NSInteger)index;

@end


@interface RPFTabbar : UIView

@property (nonatomic, strong) NSArray *items;

@property (nonatomic,weak) id<RPFTabbarDelegate> delegate;


@end
