//
//  TvShowCell.m
//  MovieDB
//
//  Created by Henri La on 08/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import "TvShowCell.h"

@implementation TvShowCell

-(void)configureCellWithTvShow:(TvShow *)tvShow{
    [self.lblTitle setText:tvShow.name];
    [self.activityIndicator startAnimating];
    [self.activityIndicator setHidden:NO];
    [self.imgPoster setImage:nil];
    NSURL *url = [NSURL URLWithString:tvShow.poster_path];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data != NULL) {
                [self.imgPoster setImage:[UIImage imageWithData:data]];
            }else{
                
            }
            [self.activityIndicator stopAnimating];
            [self.activityIndicator setHidden:YES];
        });
    });
}

@end
