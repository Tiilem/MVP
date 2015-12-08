//
//  ViewController.m
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "ViewController.h"
#import "TemplateChannelModel.h"
#import "TemplateFloorContainerModel.h"
#import "TemplateFocusCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) TemplateChannelModel *floorModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)  UIActivityIndicatorView *activityView;

@property (nonatomic, assign) BOOL cellHeightCacheEnabled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Index";
    
    self.cellHeightCacheEnabled = YES;
    [self registTableViewCell];
    
    [self fetchData];
    self.tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
    }];
    //或
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)registTableViewCell
{
    [self.tableView registerClass:[TemplateFocusCell class] forCellReuseIdentifier:@"TemplateFocusCell"];
}

- (void)loadNewData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];

    });
}

- (void)fetchData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    __weak typeof (self) weakself = self;
    [SVProgressHUD show];
    [manager GET:@"http://ccguo.github.io/MVP/food.json"
      parameters:nil
         success:^(NSURLSessionDataTask *task, id responseObject){
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSUTF8StringEncoding error:nil];
             weakself.floorModel = [TemplateChannelModel mj_objectWithKeyValues:dic];
             
             [SVProgressHUD dismiss];
             //更新UI
             [weakself.tableView reloadData];
         }
         failure:^(NSURLSessionDataTask *task, NSError *error){
             [SVProgressHUD dismiss];
         }];
    
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.floorModel.floors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id <TemplateContentProtocol> model = [self.floorModel rowModelAtIndexPath:indexPath];
    
    UITableViewCell <TemplateCellProtocol> * cell = [tableView dequeueReusableCellWithIdentifier:[model floorIdentifier]];
    
    [cell processData:model];
    
    if(!cell){
        return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }else{
        return (UITableViewCell *)cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
<<<<<<< HEAD
    TemplateChannelFloorModel  *floor = self.floorModel.floors[indexPath.section];
    
    NSString *identifier = [floor floorIdentifier];
    Class<TemplateCellProtocol> headerViewClass = NSClassFromString(identifier);
    CGSize size = [headerViewClass calculateSizeWithData:floor constrainedToSize:CGSizeMake(tableView.frame.size.width, 0.0)];
    return size.height;

//    if (indexPath.row == 0) {
//        return 164;
//    }
//    return 50;
=======
//    TemplateChannelFloorModel  *floor = self.floorModel.floors[indexPath.section];
//    
//    NSString *identifier = [floor floorIdentifier];
//    Class<TemplateCellProtocol> headerViewClass = NSClassFromString(identifier);
//    CGSize size = [headerViewClass calculateSizeWithData:floor constrainedToSize:CGSizeMake(tableView.frame.size.width, 0.0)];
//    return size.height;

    if (indexPath.row == 0) {
        return ScreenWidth/2;
    }
    return 50;
>>>>>>> origin/dev
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    id <TemplateContentProtocol> floor = [self.floorModel rowModelAtIndexPath:indexPath];
//    
//    NSString *identifier = [floor floorIdentifier];
//    
//    if (self.cellHeightCacheEnabled) {
//        return [_tableView fd_heightForCellWithIdentifier:identifier cacheByIndexPath:indexPath configuration:^(UITableViewCell<TemplateCellProtocol> *cell) {
//            cell.fd_enforceFrameLayout = NO; // Enable to use "-sizeThatFits:"
//            [cell processData:floor];
//        }];
//    } else {
//        return [_tableView fd_heightForCellWithIdentifier:identifier configuration:^(UITableViewCell<TemplateCellProtocol> *cell) {
//            cell.fd_enforceFrameLayout = NO; // Enable to use "-sizeThatFits:"
//            [cell processData:floor];
//        }];
//    }
//}


@end
