//
//  RPFOneViewController.m
//  MyProgrameWB
//
//  Created by 大米 on 16/5/5.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "RPFOneViewController.h"


#import "RPFTwoViewController.h"

@interface RPFOneViewController ()

@end

@implementation RPFOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
   // self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


- (IBAction)backToTwo:(id)sender {
    
    RPFTwoViewController *two = [[RPFTwoViewController alloc]init];
    [self.navigationController pushViewController:two animated:YES];
    
}


//
//#pragma mark - Table view data source
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    return 3;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    static NSString *ID = @"one";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
//    
//    cell.userInteractionEnabled = YES;
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//        
//        cell.backgroundColor = [UIColor clearColor];
//    }
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
//    
//    return cell;
//}
//


@end
