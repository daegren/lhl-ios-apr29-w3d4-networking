//
//  PostTableViewCell.h
//  NetworkingDemo
//
//  Created by David Mills on 2019-05-16.
//  Copyright © 2019 David Mills. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

@property (weak, nonatomic) Post *post;

@end

NS_ASSUME_NONNULL_END
