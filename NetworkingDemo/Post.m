//
//  Post.m
//  NetworkingDemo
//
//  Created by David Mills on 2019-05-16.
//  Copyright © 2019 David Mills. All rights reserved.
//

#import "Post.h"

@implementation Post

- (instancetype)initWithTitle:(NSString *)title andBody:(NSString *)body {
  if (self = [super init]) {
    _title = title;
    _body = body;
  }

  return self;
}

+ (instancetype)parseJSONDictionary:(NSDictionary *)json {
  return [[Post alloc] initWithTitle:json[@"title"] andBody:json[@"body"]];
}

@end
