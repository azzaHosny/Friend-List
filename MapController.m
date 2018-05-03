//
//  MapController.m
//  SQLITE
//
//  Created by JETS on 2/28/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import "MapController.h"
#import "JETSViewController.h"
#import "SetImag.h"
@interface MapController ()
{
    double longtuid;
    double latuid;
}

@end

@implementation MapController

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
    [_map setDelegate:self];
}


//-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view:(NSArray *)views{
//    
//    [_map deselectAnnotation:view.annotation animated:NO];
//
////    MyAnnotation * mapAnnotation=view.annotation;
////    double log=mapAnnotation.coordinate.longitude;
////    double lat=mapAnnotation.coordinate.latitude;
////    printf("lat %lf log %lf",log,lat);
//    printf("AZZA");
//    
//}
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState{
    
}
-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views{
    
}
-(void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered{
    
}
-(void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    printf("regionWillChangeAnimated");
    
}
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    MyAnnotation * mapAnnotation=view.annotation;
    longtuid=mapAnnotation.coordinate.longitude;
    latuid=mapAnnotation.coordinate.latitude;
    JETSViewController  *secondv=[self.storyboard instantiateViewControllerWithIdentifier:@"first"];
    [ _mapview returnMapData:latuid :longtuid ];
    [self dismissViewControllerAnimated:YES completion:nil];

}



- (IBAction)mapClicked:(id)sender {
    
      CGPoint touchpoint=[sender locationInView:_map];
    CLLocationCoordinate2D touchedlocation=[_map convertPoint:touchpoint toCoordinateFromView:_map];
//    double log=touchedlocation.longitude;
//    double lat=touchedlocation.latitude;
    MyAnnotation *annotate=[MyAnnotation new];
    [annotate setTitle:@"iti"];
    [annotate setCoordinate:touchedlocation];
    [_map addAnnotation:annotate];
  
}

-(void)returnMapData:(double)log :(double)lat{
    log=longtuid;
    lat=latuid;
}

@end
