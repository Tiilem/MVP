//
//  ViewController.m
//  MVP
//
//  Created by ccguo on 15/12/6.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import "ViewController.h"
#import "TemplateChannelModel.h"
#import "TemplateContainerModel.h"
#import "TemplateFocusCell.h"
#import "TemplateSingleCell.h"
#import "TemplateHeaderCell.h"
#import "TemplateCategoryCell.h"
#import "TemplateCategoryHeaderCell.h"
#import "TemplateHeaderProtocol.h"
#import "WebViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) TemplateChannelModel *floorModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) BOOL cellHeightCacheEnabled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Index";
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    [self.tableView registerClass:[TemplateSingleCell class] forCellReuseIdentifier:@"TemplateSingleCell"];
    [self.tableView registerClass:[TemplateHeaderCell class] forCellReuseIdentifier:@"TemplateHeaderCell"];
    [self.tableView registerClass:[TemplateCategoryHeaderCell class] forHeaderFooterViewReuseIdentifier:@"TemplateCategoryHeaderCell"];

    
    [self.tableView registerClass:[TemplateCategoryCell class] forCellReuseIdentifier:@"TemplateCategoryCell"];

}

- (void)loadNewData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.mj_header endRefreshing];

    });
}
- (IBAction)cliicked:(id)sender {
    
    WebViewController *webViewController = [[WebViewController alloc] init];
    [NavigateManager pushViewController:webViewController];
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
    return [self.floorModel.floors count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TemplateContainerModel<TemplateContainerProtocol> *list = self.floorModel.floors[section];
    
    return [list numberOfChildModelsInContainer];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebViewController *webViewController = [[WebViewController alloc] initWithUrl:nil];
    [NavigateManager pushViewController:webViewController];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id <TemplateContentProtocol>  floor = [self.floorModel rowModelAtIndexPath:indexPath];
    if ([floor respondsToSelector:@selector(floorIdentifier)]) {
        NSString *cellIdentifier = [floor floorIdentifier];
        Class<TemplateCellProtocol> viewClass = NSClassFromString(cellIdentifier);
        CGSize size = [viewClass calculateSizeWithData:floor constrainedToSize:CGSizeMake(tableView.frame.size.width, 0.0)];
        return size.height;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    id <TemplateHeaderProtocol,TemplateContentProtocol> floor = self.floorModel.floors[section];
    if ([floor conformsToProtocol:@protocol(TemplateHeaderProtocol)]) {
        NSString *headerIdentifier = [floor headerFloorIdentifier];
        if (headerIdentifier) {
            Class<TemplateCellProtocol> viewClass = NSClassFromString(headerIdentifier);
            CGSize size = [viewClass calculateSizeWithData:floor constrainedToSize:CGSizeMake(tableView.frame.size.width, 0.0)];
            return size.height;
        }
    }

    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    id <TemplateHeaderProtocol,TemplateContentProtocol> floor = self.floorModel.floors[section];
    
    if ([floor conformsToProtocol:@protocol(TemplateHeaderProtocol)]) {
        id<TemplateHeaderProtocol> headerModel = [floor headerFloorModelAtIndex:section];
        if (headerModel) {
            NSString *identifier = [headerModel headerFloorIdentifier];
            UIView <TemplateCellProtocol> *headerView = (UIView <TemplateCellProtocol> *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
            [headerView processData:floor];
//            if ([headerView respondsToSelector:@selector(tapOnePlace:)]) {
//                [headerView tapOnePlace:[self tapBlockForModel:headerModel]];
//            }
            
            return headerView;
        }
    }
    return nil;
}
@end
