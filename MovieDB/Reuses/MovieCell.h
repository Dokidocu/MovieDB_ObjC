//
//  MovieCell.h
//  MovieDB
//
//  Created by Henri La on 04/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgPoster;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPopularityValue;
@property (weak, nonatomic) IBOutlet UILabel *lblOverview;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;


-(void)configureTopMovieCell:(Movie *)movie;

@end
