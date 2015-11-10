//
//  MoviesVC.h
//  MovieDB
//
//  Created by Henri La on 04/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCell.h"
#import "AppRequestProtocol.h"
#import "AppManager.h"

#import "MovieDetailsVC.h"

@interface MoviesVC : UIViewController<UITableViewDataSource, UITableViewDelegate, AppRequestProtocol>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

@end
