//
//  SGSViewController.h
//  StaggeredFlowTest
//
//  Created by PJ Gray on 5/24/13.
//  Copyright (c) 2013 Say Goodnight Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SGSViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *internalCollectionView;

@end
