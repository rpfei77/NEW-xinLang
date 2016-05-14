//
//  RPFTabbarController.m
//  MyProgrameWB
//
//  Created by 大米 on 16/4/22.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "RPFTabbarController.h"
#import "UIImage+image.h"
#import "RPFTabbar.h"

#import "RPFHomeViewController.h"
#import "RPFDIscoverViewController.h"
#import "RPFMessageViewController.h"
#import "RPFProfileViewController.h"

#import "RPFNavigationController.h"

@interface RPFTabbarController ()<RPFTabbarDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, weak)  RPFHomeViewController *Home;

@end

@implementation RPFTabbarController


- (void)viewDidLoad {
    [super viewDidLoad];
    //添加所有的子控制器
    [self setupAllChilkViewcontroller];
    //设置tabbar
    [self setupTabbar];
}

//设置tabbar
- (void)setupTabbar{
    
    RPFTabbar *tabbar = [[RPFTabbar alloc]initWithFrame:self.tabBar.bounds];
    
    tabbar.delegate = self;
    
    tabbar.backgroundColor = [UIColor whiteColor];
    tabbar.items = self.items;
    //移除系统的tabbar
    //[self.tabBar removeFromSuperview];
    
    [self.tabBar addSubview:tabbar];
}


//
- (void)tabbar:(RPFTabbar *)tabbar didClickButton:(NSInteger)index{
    self.selectedIndex = index;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //移除系统的tabBarButton
    for (UIView *tabbarButton in self.tabBar.subviews) {
        if ([tabbarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarButton removeFromSuperview];
        }
    }
 
}


#pragma mark - 添加所有的子控制器
- (void)setupAllChilkViewcontroller{
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
    //管理子控制器
    //主界面
    RPFHomeViewController *Home = [[RPFHomeViewController alloc]init];
    //Home.view.backgroundColor = [UIColor grayColor];
    [self setUpAllChilkViewController:Home image:[UIImage imageNamed:@"tabbar_home"] selected:[UIImage imageWithRenderingMode:@"tabbar_home_selected"] title:@"首页"];
    _Home = Home;
    
    //消息
    RPFMessageViewController *message = [[RPFMessageViewController alloc]init];
    //message.view.backgroundColor = [UIColor greenColor];
    [self setUpAllChilkViewController:message image:[UIImage imageNamed:@"tabbar_message_center"] selected:[UIImage imageWithRenderingMode:@"tabbar_message_center_selected"] title:@"消息"];
    //发现
    RPFDIscoverViewController *discover = [[RPFDIscoverViewController alloc]init];
    //discover.view.backgroundColor = [UIColor yellowColor];
    [self setUpAllChilkViewController:discover image:[UIImage imageNamed:@"tabbar_discover"] selected:[UIImage imageWithRenderingMode:@"tabbar_discover_selected"] title:@"发现"];
    //我
    RPFProfileViewController *profile = [[RPFProfileViewController alloc]init];
    //profile.view.backgroundColor = [UIColor blueColor];
    [self setUpAllChilkViewController:profile image:[UIImage imageNamed:@"tabbar_profile"] selected:[UIImage imageWithRenderingMode:@"tabbar_profile_selected"] title:@"我"];
    

}


//添加一个子控制器
- (void)setUpAllChilkViewController:(UIViewController *)vc image:(UIImage *)image selected:(UIImage *)selectedImage title:(NSString *)title{
    
    //navigationItem的模型
//    vc.navigationItem.title = title;
//    vc.tabBarItem.title = title;
    vc.title = title;
    vc.tabBarItem.image = image;

    //vc.tabBarItem.badgeValue = @"100";
   
    vc.tabBarItem.selectedImage = selectedImage;
    
    [self.items addObject:vc.tabBarItem];
    
    
    RPFNavigationController *nav = [[RPFNavigationController alloc]initWithRootViewController:vc];
    
    
    [self addChildViewController:nav];
  
}


#pragma mark - 懒加载
- (NSMutableArray *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
        
    }
    return _items;
}



@end
