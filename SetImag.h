//
//  SetImag.h
//  SQLITE
//
//  Created by JETS on 2/27/18.
//  Copyright (c) 2018 JETS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserBean.h"
@protocol SetImag <NSObject>
-(void)returnImage:(NSString*)src;
-(void)returnUserName:(UserBean*)names;
-(void)returnMapData:(double)log:(double)lat;
@end

