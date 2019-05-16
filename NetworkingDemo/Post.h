//
//  Post.h
//  NetworkingDemo
//
//  Created by David Mills on 2019-05-16.
//  Copyright © 2019 David Mills. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *body;

- (instancetype)initWithTitle:(NSString *)title andBody:(NSString *)body;

+ (instancetype)parseJSONDictionary:(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
