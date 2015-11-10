//
//  TvShowsVC.h
//  MovieDB
//
//  Created by Henri La on 08/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppManager.h"
#import "TvShowCell.h"
#import "TvShowDetailsVC.h"

@interface TvShowsVC : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, AppRequestProtocol>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;



@end
