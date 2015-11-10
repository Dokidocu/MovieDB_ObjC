//
//  AppRequestProtocol.h
//  MovieDB
//
//  Created by Henri La on 04/11/15.
//  Copyright (c) 2015 HLA. All rights reserved.
//

@protocol AppRequestProtocol <NSObject>
@required
-(void)didRetrieveResponse:(id)response forRequest:(int)request;
-(void)didFailRetrieveResponse:(id)response forRequest:(int)request;
@end
