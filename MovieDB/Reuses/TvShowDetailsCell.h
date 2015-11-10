//
//  TvShowDetailsCell.h
//  MovieDB
//
//  Created by Henri La on 09/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TvShow.h"

@interface TvShowDetailsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblValue;

-(void)configureCellTopWithTvShow:(TvShow *)tvShow;
-(void)configureCellInfo:(NSString *)info forLabel:(NSString *)label;



@end
