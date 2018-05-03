//
//  JETSViewController.m
//  SQLITE
//
//  Created by JETS on 2/25/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "JETSViewController.h"
#import "secondViewController.h"
#import "tableViewController.h"
#import "dbManager.h"
#import "UserTable.h"
#import "MapController.h"


@interface JETSViewController (){
 dbManager *db;
}
@end

@implementation JETSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view,
     db=[dbManager new];
    [db createDatabase];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextView:(id)sender {
    
    UserBean *userdata=[UserBean new];
    [userdata setName:_name.text];
    [userdata setEmail:_email.text];
    [userdata setPhone:_phone.text];
    [userdata setImg:_img.text];
    [userdata setLog:_longtuid.text];
    [userdata setLat:_latuid.text];
    [_names returnUserName:userdata];
    NSString *latt=[userdata lat];
    NSString *logt=[userdata log];

    double lat=[latt doubleValue];
    double log=[logt doubleValue];
    [db saveData:_name.text :_email.text :_phone.text :_img.text  :log :lat];
    [self.navigationController popViewControllerAnimated:YES];
   
}

- (IBAction)openGalary:(id)sender {
    
    tableViewController *tablev=[self.storyboard instantiateViewControllerWithIdentifier:@"table"];
    [tablev setImgdata:self];
    [self presentViewController:tablev animated:YES completion:nil];
    
}
-(void)returnImage:(NSString *)src{
    _img.text=src;
}

- (IBAction)openMap:(id)sender {
    MapController *tablev=[self.storyboard instantiateViewControllerWithIdentifier:@"mapv"];
    [tablev setMapview:self];
    [self presentViewController:tablev animated:YES completion:nil];
}
-(void)returnMapData:(double)lat :(double)log{
    NSString *latu=[NSString stringWithFormat:@"%lf",lat];
    NSString *logtu=[NSString stringWithFormat:@"%lf",log];
    _latuid.text=latu;
    _longtuid.text=logtu;
    printf("%s",latu);
    
    

}
@end
