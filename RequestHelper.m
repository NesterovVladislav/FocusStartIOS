//
//  RequestHelper.m
//  ConverterMany
//
//  Created by Student on 19.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import "RequestHelper.h"
#import "AppConfig.h"
 


@implementation RequestHelper
{
    NSURLSession *session;
    NSURLSessionDataTask *dataTask;
    
    NSString *method;
    NSDictionary *requestParams;
    NSDictionary *requestParamsSecond;
    
    NSURL *dataURL;
}

- (instancetype)initWithAppConfig:(AppConfig *)appConfig apiMethod:(NSString *)apiMethod params:(NSDictionary *)params paramsSecond:(nullable NSDictionary *)paramsSecond
{
    assert( nil != appConfig );
    assert( nil != apiMethod );
    
    self = [super init];
    
    session = [NSURLSession sharedSession];
    dataURL = appConfig.exchangeRateURL;
    method = [apiMethod copy];
    
    if( nil != params )
    {
        requestParams = [params copy];
    }
    if( nil != paramsSecond )
    {
        requestParamsSecond = [paramsSecond copy];
    }
    
    return self;
}
-(void)execute
{
    assert( NULL != _responseHandler );
    NSURL * requestURL = [self makeURL ];
    typeof(self) __weak weakSelf = self;
    dataTask = [session dataTaskWithURL:requestURL
                      completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                          [weakSelf processData:data error:error];
                      }];
    
    [dataTask resume];
}
-(NSURL *) makeURL{
    NSURLComponents *components = [[ NSURLComponents alloc ] initWithURL:dataURL resolvingAgainstBaseURL :NO];
    components.path = method;
      NSMutableArray *queryItems = [[NSMutableArray alloc] init];
    if( nil != requestParams )
    {
        for (NSString *key in requestParams) {
            NSURLQueryItem *item = [NSURLQueryItem queryItemWithName:key value:requestParams[key]];
            [queryItems addObject:item];
        }
        
        components.queryItems = queryItems;
    }
    if( nil != requestParamsSecond )
    {
        
        for (NSString *key in requestParamsSecond) {
            NSURLQueryItem *item = [NSURLQueryItem queryItemWithName:key value:requestParamsSecond[key]];
            [queryItems addObject:item];
        }
        components.queryItems = queryItems;
    }
    return [components URL];

}
- (void)processData:(NSData *)data error:(NSError *)error
{
    if( nil != error )
    {
        [self handleError:error];
        return;
    }
    
    if( nil != data )
    {
        NSError *error = nil;
        
        id response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if( nil != error )
        {
            [self handleError:error];
            return;
        }
        
        _responseHandler(response);
    }
}
- (void)handleError:(NSError *)error
{
    if( NULL != _failureHandler )
    {
        _failureHandler(error);
    }
}

- (instancetype)init
{
    assert(NO);
    return nil;
}


@end
