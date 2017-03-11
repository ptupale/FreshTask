//
//  PageViewController.m
//  FreshTask
//
//  Created by Pavankumar on 11/03/17.
//  Copyright © 2017 Sample. All rights reserved.
//

#import "PageViewController.h"
#import <CHTCollectionViewWaterfallLayout.h>
#define IconWidth 20


@interface PageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    UICollectionView *colectionViewTwo;
    NSInteger checkCollection;
    NSInteger index;
    
}
@property (strong, nonatomic) UICollectionView *collectionViewImages;
@property (assign, nonatomic)NSInteger index;
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (void)loadData
{
    self.menuTitles = @[@"Images",@"Videos"];
    
}

#pragma mark - Events

- (void)switchStyle:(id)sender
{
    
    self.sectionBar.highlightedTextColor = [UIColor blueColor];
    self.sectionBar.textColor = [UIColor redColor];
    self.sectionBar.indicatorHeight = 5.0f;
    self.menuHeight = 64.0f;
    
    self.useTransform3DEffects = YES;
    
    [self refreshViews];
}

- (void)moveManually:(id)sender
{
    [self.pagingView moveToPageAtFloatIndex:arc4random() % (self.menuTitles.count - 1) animated:YES];
}



#pragma mark - ZWSPagingViewDataSource

- (ZWSPage *)pagingView:(ZWSPagingView *)pagingView pageForIndex:(NSUInteger)index
{
    ZWSPage *page = [super pagingView:pagingView pageForIndex:index];
    return page;
}


// Example 2
- (UIView *)contentViewForPage:(ZWSPage *)page atIndex:(NSInteger)index
{
    if (index == 1) {

        UIView *viewone = [[UIView alloc]init];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, [UIScreen mainScreen].bounds.size.height/2-84, [UIScreen mainScreen].bounds.size.width-20, 40)];
        label.text = @"The contents are removed by autorisation";
        [viewone addSubview:label];
        [label setTextAlignment:NSTextAlignmentCenter];
        return viewone;
        

        
    }else if (index == 0) {
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
        colectionViewTwo=[[UICollectionView alloc] initWithFrame:page.bounds collectionViewLayout:layout];
        [colectionViewTwo registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"kCellIdentifier"];
        colectionViewTwo.dataSource = self;
        colectionViewTwo.delegate = self;
        colectionViewTwo.userInteractionEnabled = YES;
        colectionViewTwo.allowsSelection = YES;
        colectionViewTwo.backgroundColor = [UIColor whiteColor];
        
        return  colectionViewTwo;
        
    }
    UIView *view = [[UIView alloc] init];
    return view;
}


//#pragma mark - Collection View Data source
//
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return 9;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"kCellIdentifier" forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor whiteColor];
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-20, 235)];
//    
//    [cell.contentView addSubview:imageView];
//    UIImageView *youTubeIcon = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-22, 97.5, IconWidth, IconWidth)];
//    youTubeIcon.image = [UIImage imageNamed:@"YouTubeicon.png"];
//    [cell.contentView addSubview:youTubeIcon];
//    
//    
//    return  cell;
//}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *collectionIdentifier=@"kCellIdentifier";
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:collectionIdentifier forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[UICollectionViewCell alloc]init];
    }

        UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, [UIScreen mainScreen].bounds.size.width-20, [UIScreen mainScreen].bounds.size.width / 2 -15)];
        icon.image = [UIImage imageNamed:@"Default.jpg"];
        [cell.contentView addSubview:icon];
    return  cell;
}


#pragma mark - Collection View Delegate

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    index = indexPath.row;
//    [self performSegueWithIdentifier:@"PushToPromotion" sender:self];
//}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"SETTING SIZE FOR ITEM AT INDEX %ld", (long)indexPath.row);
    CGSize mElementSize = CGSizeMake(self.view.frame.size.width- 20, self.view.frame.size.width / 2 -15);
    return mElementSize;
}


@end
