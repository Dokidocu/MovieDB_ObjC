//
//  MovieDetailsVC.m
//  MovieDB
//
//  Created by Henri La on 06/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import "MovieDetailsVC.h"

@interface MovieDetailsVC ()

@end

@implementation MovieDetailsVC


#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [[AppManager sharedAppManager]retrieveMovie:self.movie withDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)assignValues{
    [self.lblTitle setText:self.movie.original_title];
    [self.lblGenres setText:self.movie.stringGenres];
    [self.lblRelease setText:self.movie.release_date];
    [self.lblTagline setText:self.movie.tagline];
    [self.lblOverview setText:self.movie.overview];
    [self.lblStatus setText:self.movie.status];
    NSURL *url = [NSURL URLWithString:self.movie.backdrop_path];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data != NULL) {
                [self.imgMovie setImage:[UIImage imageWithData:data]];
            }else{
                
            }
        });
    });
}

#pragma mark - AppRequestProtocol
-(void)didRetrieveResponse:(id)response forRequest:(int)request{
     NSLog(@"%@", response);
    [self assignValues];
}

-(void)didFailRetrieveResponse:(id)response forRequest:(int)request{
    NSLog(@"%@", response);
}

@end
