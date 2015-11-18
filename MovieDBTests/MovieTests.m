//
//  MovieTests.m
//  MovieDB
//
//  Created by Henri La on 18/11/15.
//  Copyright © 2015 HLA. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Movie.h"

@interface MovieTests : XCTestCase

@end

@implementation MovieTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testStringGenres{
    //given
    NSMutableArray* genres = [[NSMutableArray alloc]init];
    [genres addObject:@{@"name":@"Sci-fi", @"id":@"1"}];
    [genres addObject:@{@"name":@"Thriller", @"id":@"2"}];
    [genres addObject:@{@"name":@"Drama", @"id":@"3"}];
    Movie* movie = [[Movie alloc]init];
    //when
    XCTAssertNil([movie genres], @"Genres is not nil");
    XCTAssertTrue([[movie stringGenres]isEqualToString:@""], @"stringGenres is not = ''");
    [movie setGenres:genres];
    //then
    XCTAssertNotNil([movie genres], @"Genres is nil");
    XCTAssertTrue([[movie stringGenres]isEqualToString:@"Sci-fi, Thriller, Drama"], @"Is not equal to Sci-fi, Thriller, Drama");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
