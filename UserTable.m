//
//  UserTable.m
//  SQLITE
//
//  Created by JETS on 2/27/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "UserTable.h"
#import "dbManager.h"
#import "UserBean.h"
#import "secondViewController.h"
@interface UserTable ()
{
    NSMutableArray *users;

}
@end

@implementation UserTable

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    dbManager *db;
    UserBean *userobj;
    userobj=[UserBean new];

    db=[dbManager new];
    users=[NSMutableArray new];
    [db createDatabase];
    users= [db retrieveData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celluser" forIndexPath:indexPath];
    //[self.tableView reloadData];

    cell.textLabel.text=[[users objectAtIndex:indexPath.row]name];
     //cell.textLabel.text= [_names returnUserName:[[users objectAtIndex:indexPath.row]name]];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    secondViewController *secondv=[self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    
    UserBean *f = [users objectAtIndex:indexPath.row];
    [secondv setDetails: f ];
    [self.navigationController pushViewController:secondv animated:YES];
}

-(void)returnUserName:(UserBean *)names{
    [users addObject:names];
    [self.tableView reloadData];
    
}
- (IBAction)AddFriend:(id)sender {
    
    JETSViewController *control=[self.storyboard instantiateViewControllerWithIdentifier:@"first"];
    [control setNames:self];
    [self.navigationController pushViewController:control animated:YES];
}
@end
