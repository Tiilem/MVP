//
//  ViewController.m
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "ViewController.h"
#import "TemplateChannelFloorModel.h"
#import <UIActivityIndicatorView+AFNetworking.h>
#import "TemplateFocusCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) TemplateChannelModel *floorModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)  UIActivityIndicatorView *activityView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Index";
    
    [self registTableViewCell];
    
    [self fetchData];
    
    self.tableView.backgroundColor = [UIColor purpleColor];
    self.tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registTableViewCell
{
    NSArray *cellIdentifiers = @[
                                 @"TemplateFocusCell"
                                 ];
    
    [self.tableView registerClass:[TemplateFocusCell class] forCellReuseIdentifier:@"TemplateFocusCell"];

//    for (NSString *identifier in cellIdentifiers)
//    {
//        [self.tableView registerClass:NSClassFromString(identifier) forCellReuseIdentifier:identifier];
//    }
}

- (void)fetchData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    __weak typeof (self) weakself = self;
    [manager GET:@"http://ccguo.github.io/MVP/food.json"
      parameters:nil
         success:^(NSURLSessionDataTask *task, id responseObject){
             NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSUTF8StringEncoding error:nil];
             weakself.floorModel = [TemplateChannelModel mj_objectWithKeyValues:dic];
             NSLog(@"%@",str);
             
             //更新UI
             [weakself.tableView reloadData];
         }
         failure:^(NSURLSessionDataTask *task, NSError *error){
             NSLog(@"%@",error);
         }];
    
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id <TemplateContentProtocol> model = [self.floorModel rowModelAtIndexPath:indexPath];
    id <TemplateCellProtocol> cell = [tableView dequeueReusableCellWithIdentifier:[model floorIdentifier]];
    
    [cell processData:model];
    
    return cell;
}

@end
