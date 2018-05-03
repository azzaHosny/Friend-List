//
//  tableViewController.m
//  SQLITE
//
//  Created by JETS on 2/25/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "tableViewController.h"
#import "JETSViewController.h"
@interface tableViewController (){
    NSMutableArray *imgs;
    NSMutableArray *title;
    NSMutableArray *sub;

}

@end

@implementation tableViewController

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

    imgs=[NSMutableArray new];
    title=[NSMutableArray new];
    sub=[NSMutableArray new];
    
    [title addObject:@"1.jpg"];
    [title addObject:@"3.jpg"];
    [title addObject:@"4.jpg"];
    [title addObject:@"6.jpg"];
    
    [sub addObject:@"3.png"];
    [sub addObject:@"3.png"];
    [sub addObject:@"3.png"];
    [sub addObject:@"3.png"];

    

    [imgs addObject:@"1.jpg"];
    [imgs addObject:@"3.jpg"];
    [imgs addObject:@"4.jpg"];
    [imgs addObject:@"6.jpg"];


    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows=[title count];
    return rows;

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  
     cell.imageView.image=[UIImage imageNamed:[imgs objectAtIndex:indexPath.row]];
     cell.textLabel.text=[title objectAtIndex:indexPath.row];
     cell.detailTextLabel.text=[sub objectAtIndex:indexPath.row];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   JETSViewController  *secondv=[self.storyboard instantiateViewControllerWithIdentifier:@"first"];
    [_imgdata returnImage:[title objectAtIndex:indexPath.row]];
    [self dismissViewControllerAnimated:YES completion:nil];

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
