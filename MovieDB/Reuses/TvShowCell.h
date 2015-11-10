//
//  TvShowCell.h
//  MovieDB
//
//  Created by Henri La on 08/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TvShow.h"

@interface TvShowCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgPoster;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

-(void)configureCellWithTvShow:(TvShow *)tvShow;

@end
