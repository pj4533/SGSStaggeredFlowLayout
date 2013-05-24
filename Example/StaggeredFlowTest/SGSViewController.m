//
//  SGSViewController.m
//  StaggeredFlowTest
//
//  Created by PJ Gray on 5/24/13.
//  Copyright (c) 2013 Say Goodnight Software. All rights reserved.
//

#import "SGSViewController.h"
#import "SGSStaggeredFlowLayout.h"

@interface SGSViewController () {
    SGSStaggeredFlowLayout* _flowLayout;
    NSMutableArray* _photos;
}

@end

@implementation SGSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _photos = [NSMutableArray arrayWithCapacity:30];
    for (NSInteger i=0; i < 30; i++) {
        NSString *imageToLoad = [NSString stringWithFormat:@"photo%d.jpg", arc4random() % 7];
        [_photos addObject:imageToLoad];
    }
    
    _flowLayout = [[SGSStaggeredFlowLayout alloc] init];
    _flowLayout.layoutMode = SGSStaggeredFlowLayoutMode_Even;
    _flowLayout.minimumLineSpacing = 2.0f;
    _flowLayout.minimumInteritemSpacing = 2.0f;
    _flowLayout.sectionInset = UIEdgeInsetsMake(0.0f, 10.0f, 0.0f, 10.0f);
    _flowLayout.itemSize = CGSizeMake(75.0f, 75.0f);
    
    self.internalCollectionView.collectionViewLayout = _flowLayout;

    [self.internalCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"generic"];
    [self.internalCollectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UIImage* thisImage = [UIImage imageNamed:_photos[indexPath.item]];

    CGSize cellSize;
    CGFloat deviceCellSizeConstant = _flowLayout.itemSize.height;
    cellSize = CGSizeMake((thisImage.size.width*deviceCellSizeConstant)/thisImage.size.height, deviceCellSizeConstant);
    
    return cellSize;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return _photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"generic" forIndexPath:indexPath];
    
    // load the image for this cell
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:cell.contentView.frame];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = [UIImage imageNamed:_photos[indexPath.item]];

    cell.contentView.clipsToBounds = YES;

    [cell.contentView addSubview:imageView];
    
    return cell;
}

@end
