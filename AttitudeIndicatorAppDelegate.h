//
//  AttitudeIndicatorAppDelegate.h
//  AttitudeIndicator
//
//  Created by Jason de la Cruz on 1/4/11.
//  Copyright 2011 Jason de la Cruz, All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AttitudeIndicatorView.h"

@interface AttitudeIndicatorAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	IBOutlet AttitudeIndicatorView *attitudeIndicatorView;
}

@property (assign) IBOutlet NSWindow *window;

@end
