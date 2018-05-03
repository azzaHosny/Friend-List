//
//  secondViewController.m
//  SQLITE
//
//  Created by JETS on 2/25/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "secondViewController.h"
#import "UserBean.h"
#import "dbManager.h"
#import "MyAnnotation.h"

@interface secondViewController ()
{
    UserBean *bean;
    dbManager *db;
    NSMutableArray *lats;
    NSMutableArray *logs;

}

@end

@implementation secondViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    bean=[UserBean new];
    db=[dbManager new];
    [_map setDelegate:self];
    bean=[db retrieveData];
    [_name setText:[_details name]];
    [_email setText:[_details email]];
    [_phone setText:[_details phone]];
    lats=[NSMutableArray new];
    logs=[NSMutableArray new];

    [lats addObject:[_details lat]];
    [logs addObject:[_details log]];
    NSString *src=[_details img];
    UIImage *img=[UIImage imageNamed:src];
    [_uimg setImage:img];
    CLLocationCoordinate2D touchedlocation;
    
    MyAnnotation *annotate=[MyAnnotation new];
  
    for(int i=0;i<[lats count];i++)
    {
        double lat=[[lats objectAtIndex:i]doubleValue];
        double log=[[logs objectAtIndex:i]doubleValue];
        touchedlocation.latitude=lat;
        touchedlocation.longitude=log;
        annotate.coordinate=touchedlocation;
        
    }
    [_map addAnnotation:annotate];
   // [_map.region.span.latitudeDelta];
    //[_map.region.span.longitudeDelta];
    [_map setRegion:MKCoordinateRegionMakeWithDistance(touchedlocation,1000, 1000) animated:YES];
 
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)renderMap:(id)sender {
    
//    CGPoint touchpoint=[sender locationInView:_map];
//    CLLocationCoordinate2D touchedlocation=[_map convertPoint:touchpoint toCoordinateFromView:_map];
    CLLocationCoordinate2D touchedlocation;

    MyAnnotation *annotate=[MyAnnotation new];
    [annotate setTitle:@"iti"];
    //[annotate setCoordinate:touchedlocation];
    //[_map addAnnotation:annotate];
    for(int i=0;i<[lats count];i++)
    {
        double lat=[[lats objectAtIndex:i]doubleValue];
        double log=[[logs objectAtIndex:i]doubleValue];
        touchedlocation.latitude=lat;
        touchedlocation.longitude=log;
        annotate.coordinate=touchedlocation;
    
    }
    [_map setRegion:MKCoordinateRegionMakeWithDistance(touchedlocation,200, 200) animated:YES];
    //[_map addAnnotation:annotate];

}



@end
