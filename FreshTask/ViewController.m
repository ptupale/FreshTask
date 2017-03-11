//
//  ViewController.m
//  FreshTask
//
//  Created by Pavankumar on 11/03/17.
//  Copyright © 2017 Sample. All rights reserved.
//

#import "ViewController.h"
#import "DetailController.h"


@interface ViewController ()
@property (strong, nonatomic)NSArray *array;
@property (strong, nonatomic)NSArray *descriptionArray;
@property (assign, nonatomic)NSInteger index;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = @[@"Hi",@"This article is about the motion picture",@"For the photographic material used in cameras, see",@"A film, also called a movie",@"short for cinematography, is often used to refer to the industry of films and filmmakin",@"filmmakin",@"his article is about"];
    self.descriptionArray = @[@"The word cinema, short for cinematography, is often used to refer to the industry of films and filmmaking or to the art of filmmaking itself",@"Films were originally recorded onto plastic film through",@"The adoption of CGI-based special effects led to the",@"Films are cultural artifacts created by specific cultures. They reflect those cultures, and, in turn, affect them. Film is considered to be an important art form, a source of popular entertainment, and a powerful medium for educating",@"A film, also called a movie, motion picture, theatrical film or photoplay, is a series of still images which, when shown on a screen, creates the illusion of moving images due to the phi phenomenon.",@"d special effects led to the",@"Films are cultural artifacts created by specific cultures. They reflect those cultures, and, in turn, affect them. Film is",@"pecial effects led to the",@"Films are cultural artifacts created by specific cultures. They reflect those cultures, and, in turn, affect them. Film is considered to be an important art form, a source of popular entertainment, and a"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"go"]){
        DetailController *vc = segue.destinationViewController;
        vc.titleString = [self.array objectAtIndex:self.index];
        vc.subString = [self.descriptionArray objectAtIndex:self.index];

    }
}

#pragma mark - Collection View Data source

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *collectionIdentifier=@"collectionItem";
    
    CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:collectionIdentifier forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[CollectionViewCell alloc]init];
    }
    
    cell.titleLabel.text = [self.array objectAtIndex:indexPath.row];
    cell.descriptionLabel.text = [self.descriptionArray objectAtIndex:indexPath.row];
    
    [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    return  cell;
}

#pragma mark - Collection View Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.index = indexPath.row;
    [self performSegueWithIdentifier:@"go" sender:self];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize calculateTitleSize,calculateSize;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold]};
    calculateTitleSize =[[self.array objectAtIndex:indexPath.row] sizeWithAttributes:attributes];
    
    attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
    
    calculateSize =[[self.descriptionArray objectAtIndex:indexPath.row]  sizeWithAttributes:attributes];
    calculateSize.width = [UIScreen mainScreen].bounds.size.width;
    calculateSize.height = 8 + calculateTitleSize.height + calculateSize.height + 42;
    NSLog(@"%f     %f",calculateSize.height, calculateSize.width);
    return calculateSize;
    
}




@end
