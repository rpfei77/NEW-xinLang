//
//  RPFNavigationController.m
//  MyProgrameWB
//
//  Created by 大米 on 16/5/6.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "RPFNavigationController.h"
#import "UIBarButtonItem+item.h"


@interface RPFNavigationController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) id popDelegate;


@end

@implementation RPFNavigationController

+(void)initialize{
    //获取当前类下的barbuttonitem
    UIBarButtonItem *buttonItem = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    //设置导航条按钮的颜色
    NSMutableDictionary *titleArr = [NSMutableDictionary dictionary];
    titleArr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [buttonItem setTitleTextAttributes:titleArr forState:UIControlStateNormal];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //纪录一下
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    
    
    
    self.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    UIWindow *KayWindow = [UIApplication sharedApplication].keyWindow;
    
    UITabBarController *tabbarVC = (UITabBarController *)KayWindow.rootViewController;
    
    
    //移除系统的tabBarButton
    for (UIView *tabbarButton in tabbarVC.tabBar.subviews) {
        if ([tabbarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarButton removeFromSuperview];
        }
    }
    
}


-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController == self.viewControllers[0]) {//显示根控制器
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }else {//不现实根控制
        
        //实现滑动返回功能
        //清空滑动返回手势的代理，就能实现滑动功能
        self.interactivePopGestureRecognizer.delegate = nil;
        
    }
}



- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count != 0) {//非根控制器
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_back"] highImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] target:self action:@selector(backToPre) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_more"] highImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] target:self action:@selector(backToRoot) forControlEvents:UIControlEventTouchUpInside];
        

    }
    
    [super pushViewController:viewController animated:animated];
}



- (void)backToPre{
    [self popViewControllerAnimated:YES];
}



- (void)backToRoot{
    [self popToRootViewControllerAnimated:YES];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
