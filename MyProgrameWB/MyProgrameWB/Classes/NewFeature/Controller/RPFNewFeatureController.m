//
//  RPFNewFeatureController.m
//  MyProgrameWB
//
//  Created by 大米 on 16/5/12.
//  Copyright © 2016年 MyProgrameWB. All rights reserved.
//

#import "RPFNewFeatureController.h"
#import "RPFNewFeatureCell.h"


@interface RPFNewFeatureController ()

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation RPFNewFeatureController

static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    

    return [super initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //self.collectionView.backgroundColor = [UIColor greenColor];
    //分页
    self.collectionView.pagingEnabled = YES;
    //垂直滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //去除弹簧效果
    self.collectionView.bounces = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[RPFNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self setUpPageContrl];
}

- (void)setUpPageContrl{
    UIPageControl *control = [[UIPageControl alloc]init];
    control.numberOfPages = 4;
    control.pageIndicatorTintColor = [UIColor blackColor];
    control.currentPageIndicatorTintColor = [UIColor redColor];
    
    control.center = CGPointMake(self.view.width * 0.5, self.view.height - 15);
    _pageControl = control;
    
    [self.view addSubview:control];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    
    self.pageControl.currentPage = page;
    
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RPFNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //NSInteger screeH = [UIScreen mainScreen].bounds.size.width;
    NSString *imageName = [NSString stringWithFormat:@"new_feature_%ld",indexPath.row + 1];
//    if (screeH > 480) {
//        imageName = [NSString stringWithFormat:@""]
//    }
//    
    cell.image = [UIImage imageNamed:imageName];
    
    [cell setIndexPath:indexPath count:4];
    
    return cell;
}


@end
