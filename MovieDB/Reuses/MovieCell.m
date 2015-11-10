//
//  MovieCell.m
//  MovieDB
//
//  Created by Henri La on 04/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureTopMovieCell:(Movie *)movie{
    [self.imgPoster setImage:nil];
    [self.activityView startAnimating];
    [self.activityView setHidden:NO];
    [self.lblTitle setText:movie.original_title];
    [self.lblPopularityValue setText:[NSString stringWithFormat:@"%.2f",[movie.popularity doubleValue]]];
    [self.lblOverview setText:movie.overview];
    NSURL *url = [NSURL URLWithString:movie.poster_path];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data != NULL) {
                [self.imgPoster setImage:[UIImage imageWithData:data]];
            }else{
                
            }
            [self.activityView stopAnimating];
            [self.activityView setHidden:YES];
        });
    });
}

@end
