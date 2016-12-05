//
//  RequestHelper.h
//  ConverterMany
//
//  Created by Student on 19.11.16.
//  Copyright © 2016 CFT:FocusStart. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppConfig;

NS_ASSUME_NONNULL_BEGIN

@interface RequestHelper< T : Class > : NSObject

@property (nonatomic, copy) void (^responseHandler)(T response);
@property (nonatomic, nullable, copy) void (^failureHandler)(NSError *error);

- (instancetype)initWithAppConfig:(AppConfig *)appConfig apiMethod:(NSString *)apiMethod params:(nullable NSDictionary *)params paramsSecond:(nullable NSDictionary *)paramsSecond;

- (void)execute;

- (instancetype)init NS_UNAVAILABLE;

NS_ASSUME_NONNULL_END

@end
