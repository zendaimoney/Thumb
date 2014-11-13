//
//  ZDAboutUsTableViewController.m
//  Thumb
//
//  Created by lucy on 14-11-12.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDAboutUsTableViewController.h"
#import "MBProgressHUD.h"

#define VERSION_URL @""
#define INSTALL_URL @""

@interface ZDAboutUsTableViewController ()

@end

@implementation ZDAboutUsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _versionLab.text = [NSString stringWithFormat:@"V %@", [self currentAppVersion]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)currentAppVersion
{
    NSDictionary* info = [[NSBundle mainBundle] infoDictionary];
    return info[@""];
}

- (void)haveNewVersion
{
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:INSTALL_URL]];
}

- (void)noHaveNewVersion
{
    [[[UIAlertView alloc] initWithTitle:@""
                                message:@"已是最新版本"
                               delegate:nil
                      cancelButtonTitle:@"确定"
                      otherButtonTitles:nil] show];
}

- (void)compareCurrentAppVersion:(NSString *)currentAppVersion appStoreAppVersion:(NSString *)appStoreAppVersion
{
    int currentAppVersion1 = 0;
    int currentAppVersion2 = 0;
    int currentAppVersion3 = 0;
    int appStoreAppVersion1 = 0;
    int appStoreAppVersion2 = 0;
    int appStoreAppVersion3 = 0;
    
    NSArray *components = [currentAppVersion componentsSeparatedByString:@"."];
    if ([components count] > 0) currentAppVersion1 = [components[0] intValue];
    if ([components count] > 1) currentAppVersion2 = [components[1] intValue];
    if ([components count] > 2) currentAppVersion3 = [components[2] intValue];
    
    components = [appStoreAppVersion componentsSeparatedByString:@"."];
    if ([components count] > 0) appStoreAppVersion1 = [components[0] intValue];
    if ([components count] > 1) appStoreAppVersion2 = [components[1] intValue];
    if ([components count] > 2) appStoreAppVersion3 = [components[2] intValue];
    
    if (appStoreAppVersion1 > currentAppVersion1) {
        [self haveNewVersion];
    } else if (appStoreAppVersion1 == currentAppVersion1) {
        if (appStoreAppVersion2 > currentAppVersion2) {
            [self haveNewVersion];
        } else if (appStoreAppVersion2 == currentAppVersion2) {
            if (appStoreAppVersion3 > currentAppVersion3) {
                [self haveNewVersion];
            } else {
                [self noHaveNewVersion];
            }
        } else {
            [self noHaveNewVersion];
        }
    } else {
        [self noHaveNewVersion];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 1) {
//        [self checkUpdatePressed];
        NSLog(@"haha");
    }
    return nil;
}

- (void)checkUpdatePressed
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:VERSION_URL]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            NSString *appStoreAppVersion = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSString *currentAppVersion = [self currentAppVersion];
            
            [self compareCurrentAppVersion:currentAppVersion appStoreAppVersion:appStoreAppVersion];
        });
    });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
