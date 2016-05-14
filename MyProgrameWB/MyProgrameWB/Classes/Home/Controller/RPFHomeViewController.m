//
//  RPFHomeViewController.m
//  MyProgrameWB
//
//  Created by 大米 on 16/4/29.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "RPFHomeViewController.h"
#import "UIBarButtonItem+item.h"
#import "RPFTitleButton.h"

#import "RPFPopMenu.h"
#import "RPFCover.h"

#import "RPFOneViewController.h"

@interface RPFHomeViewController ()<RPFCoverDelegate>


@property (nonatomic, weak) RPFTitleButton *titleButton;

@property (nonatomic, strong) RPFOneViewController *one;

@end

@implementation RPFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条
    [self setupNavgation];
    
    
    
}

-(RPFOneViewController *)one{
    if (_one == nil) {
        _one = [[RPFOneViewController alloc]init];
        
        
    }
    return _one;
}



- (void)setupNavgation{
    //左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] highImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(friends) forControlEvents:UIControlEventTouchUpInside];
    
    //右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_pop"] highImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    RPFTitleButton *titleButton = [RPFTitleButton buttonWithType:UIButtonTypeCustom];
    
    _titleButton = titleButton;
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    
    //高亮状态的时候不转换图片
    titleButton.adjustsImageWhenHighlighted = NO;
    
    [titleButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.navigationItem.titleView = titleButton;
    

}

- (void)buttonClick:(UIButton *)button{
    
    button.selected = !button.selected;
    
    RPFCover *cover =[RPFCover show];
    
    cover.delegate = self;
    
    
    cover.dimBackgrund = YES;
    
    
    CGFloat popW = 200;
    CGFloat popX = (self.view.width - popW) * 0.5;
    CGFloat popH = popW;
    CGFloat popY = 55;
    
    
    RPFPopMenu *menu = [RPFPopMenu showInRect:CGRectMake(popX, popY, popW, popH)];
    menu.contentView = self.one.view;
    
    
    
}

- (void)friends{
    [_titleButton setTitle:@"首页首页" forState:UIControlStateNormal];
    
}

- (void)pop{
    
    RPFOneViewController *one = [[RPFOneViewController alloc]initWithNibName:nil bundle:nil];
    
    //当push的时候隐藏导航条.
    //前提条件是只会隐藏系统的导航条
    one.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:one animated:YES];
    
    
    
    
}

//点击蒙板时候调用
- (void)coverDidClickCover:(RPFCover *)cover{
    //隐藏菜单栏
    [RPFPopMenu hide];
    
    
    _titleButton.selected = NO;
    
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


@end
