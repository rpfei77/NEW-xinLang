//
//  RPFCover.h
//  MyProgrameWB
//
//  Created by 大米 on 16/5/4.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RPFCover ;

@protocol  RPFCoverDelegate <NSObject>

- (void)coverDidClickCover:(RPFCover *)cover;

@end



@interface RPFCover : UIView
+ (instancetype)show;

@property (nonatomic, assign) BOOL dimBackgrund;


@property(nonatomic,weak) id<RPFCoverDelegate> delegate;

@end
