//
//  MovieDetailsVC.h
//  MovieDB
//
//  Created by Henri La on 06/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import "AppManager.h"

@interface MovieDetailsVC : UIViewController<AppRequestProtocol>

@property (nonatomic) Movie *movie;

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgMovie;
@property (weak, nonatomic) IBOutlet UIButton *btnHomepage;
@property (weak, nonatomic) IBOutlet UILabel *lblTagline;
@property (weak, nonatomic) IBOutlet UILabel *lblGenres;
@property (weak, nonatomic) IBOutlet UILabel *lblRelease;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblOverview;





@end
