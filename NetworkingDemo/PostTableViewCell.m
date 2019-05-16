//
//  PostTableViewCell.m
//  NetworkingDemo
//
//  Created by David Mills on 2019-05-16.
//  Copyright © 2019 David Mills. All rights reserved.
//

#import "PostTableViewCell.h"

@implementation PostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPost:(Post *)post {
  _post = post;

  self.titleLabel.text = post.title;
  self.bodyLabel.text = post.body;
}

@end
