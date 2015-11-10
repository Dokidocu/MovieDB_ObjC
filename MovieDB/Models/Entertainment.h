//
//  Entertainment.h
//  MovieDB
//
//  Created by Henri La on 08/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

#import <Foundation/Foundation.h>

static const NSString * KIMAGE_URL = @"http://image.tmdb.org/t/p/w500";

@interface Entertainment : NSObject

@property (nonatomic) NSString *backdrop_path;
@property (nonatomic, strong) NSMutableArray *genre_ids;
@property (nonatomic) NSString *pk_id;
@property (nonatomic) NSString *original_language;
@property (nonatomic) NSString *original_title;
@property (nonatomic) NSString *overview;
@property (nonatomic) NSString *poster_path;
@property (nonatomic) NSNumber *popularity;
@property (nonatomic) NSNumber *vote_average;
@property (nonatomic) NSNumber *vote_count;

@end
