//
//  ViewController.m
//  NetworkingDemo
//
//  Created by David Mills on 2019-05-16.
//  Copyright © 2019 David Mills. All rights reserved.
//

#import "ViewController.h"
#import "PostTableViewCell.h"
#import "Post.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *posts;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.posts = @[];

  NSURL *url = [NSURL URLWithString:@"http://jsonplaceholder.typicode.com/posts"];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];

  NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error) {
      NSLog(@"Got an error! %@", error);
      return;
    }

    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (httpResponse.statusCode != 200) {
      NSLog(@"Server responded with a non 200 status");
      return;
    }

    NSError *jsonError;
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

    if (jsonError) {
      NSLog(@"Error parsing the JSON response: %@", jsonError);
      return;
    }

    NSMutableArray *posts = [NSMutableArray array];
    for (NSDictionary *postJSON in json) {
      Post *post = [Post parseJSONDictionary:postJSON];
      [posts addObject:post];
    }

    self.posts = posts;

    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
      [self.tableView reloadData];
    }];
  }];

  [task resume];

}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  PostTableViewCell *postCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

  // TODO: configure the cell
  Post *post = self.posts[indexPath.row];

  postCell.post = post;

  return postCell;
}


@end
