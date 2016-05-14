//
//  AppDelegate.m
//  MyProgrameWB
//
//  Created by 大米 on 16/4/22.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "AppDelegate.h"
#import "RPFTabbarController.h"
#import "RPFNewFeatureController.h"

#import <AVFoundation/AVFoundation.h>


@interface AppDelegate ()

@property (nonatomic, strong) AVAudioPlayer *players;

@end

@implementation AppDelegate

#define RPFVersionKey @"version"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:RPFVersionKey];;
    
    
    //判断当前是不是新版本
    if ([currentVersion isEqualToString:lastVersion]) { //没有最新的版本号
        RPFTabbarController *tabbar = [[RPFTabbarController alloc]init];
    
        //设置根控制器
        self.window.rootViewController = tabbar;
    }else{ //有最新的版本号
    
        RPFNewFeatureController *newFeature = [[RPFNewFeatureController alloc]init];
        
        //设置根控制器
        self.window.rootViewController = newFeature;
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:RPFVersionKey];
    }
    

    
    
    // 显示窗口
    [self.window makeKeyAndVisible];
 
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"15834 ゝ兮雅 - 迷幻旋律，震撼心灵，.mp3" withExtension:nil];
    
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    self.players = player;
    
    [player prepareToPlay];
    
    player.numberOfLoops = -1;
    
    [player play];
    
   
}




- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    
    
     [self.players pause];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
