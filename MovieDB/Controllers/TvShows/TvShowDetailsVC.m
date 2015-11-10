//
//  TvShowDetailsVC.m
//  MovieDB
//
//  Created by Henri La on 09/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import "TvShowDetailsVC.h"

@interface TvShowDetailsVC ()

@end

@implementation TvShowDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 279;
    }
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 279;
    }
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TvShowDetailsCell *cell;
    static NSString *identifier1 = @"TvShowDetailsCell_1";
    static NSString *identifier2 = @"TvShowDetailsCell_2";
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:identifier1 forIndexPath:indexPath];
        [cell configureCellTopWithTvShow:self.tvShow];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:identifier2 forIndexPath:indexPath];
        switch (indexPath.row) {
            case 1:{
                [cell configureCellInfo:self.tvShow.first_air_date forLabel:@"First Air date"];
                break;
            }
            case 2:{
                [cell configureCellInfo:self.tvShow.overview forLabel:@"Overview"];
                break;
            }
                
            default:
                break;
        }
    }
    return cell;
}

@end
