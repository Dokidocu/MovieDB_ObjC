//
//  TvShowDetailsCell.m
//  MovieDB
//
//  Created by Henri La on 09/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import "TvShowDetailsCell.h"

@implementation TvShowDetailsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellTopWithTvShow:(TvShow *)tvShow{
    [self.lblTitle setText:tvShow.name];
    [self.imgView setImage:nil];
    NSURL *url = [NSURL URLWithString:tvShow.backdrop_path];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data != NULL) {
                [self.imgView setImage:[UIImage imageWithData:data]];
            }else{
                
            }
            //[self.activityIndicator stopAnimating];
            //[self.activityIndicator setHidden:YES];
        });
    });
}

-(void)configureCellInfo:(NSString *)info forLabel:(NSString *)label{
    [self.lblTitle setText:label];
    [self.lblValue setText:info];
}

@end
