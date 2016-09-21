//
//  ZCWMainController.m
//  Code_ZCW_NavigationBar
//
//  Created by 张朝伟 on 16/8/1.
//  Copyright © 2016年 zcw. All rights reserved.
//

#import "ZCWMainController.h"

#import "ZCWCustomViewController.h"
#import "NavigationBarHideLineController.h"
#import "NavigationBarAddSegmentController.h"
@interface ZCWTestModel : NSObject

@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *className;

@end

@implementation ZCWTestModel

@end

@interface ZCWMainController ()

@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation ZCWMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置NavigationBar的标题
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoDetailVc:) name:@"Notice3DTouch" object:nil];
    self.navigationItem.title = @"UINavigationBar使用";
    [self loadData];
    [self.tableView reloadData];
}

- (void)loadData{
    //解析plist文件
    self.dataArray = [[NSMutableArray alloc] init];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DataSourse" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    for (NSDictionary *dict in array) {
        ZCWTestModel *model = [[ZCWTestModel alloc] init];
        model.title = [dict objectForKey:@"Title"];
        model.className = [dict objectForKey:@"ClassName"];
        [self.dataArray addObject:model];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark 从快捷菜单进入对应页面
- (void)gotoDetailVc:(NSNotification *)notification {
    NSString *type = notification.userInfo[@"type"];
    if ([type isEqualToString:@"1"]) {
        ZCWCustomViewController *vc = [[ZCWCustomViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if ([type isEqualToString:@"2"]) {
        NavigationBarHideLineController *vc = [[NavigationBarHideLineController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([type isEqualToString:@"3"]) {
        NavigationBarAddSegmentController *vc = [[NavigationBarAddSegmentController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    ZCWTestModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}
#pragma mark - Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ZCWTestModel *model = self.dataArray[indexPath.row];
    UIViewController *viewController = [[NSClassFromString(model.className) alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
