//
//  AttitudeIndicatorAppDelegate.m
//  AttitudeIndicator
//
//  Created by Jason de la Cruz on 1/4/11.
//  Copyright 2011 Jason de la Cruz, All rights reserved.
//

#import "AttitudeIndicatorAppDelegate.h"

@implementation AttitudeIndicatorAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application 
	
}

- (void)awakeFromNib
{
	[attitudeIndicatorView setUpLayers];
	NSLog(@"Awoke from NIB");
	[[window contentView]setWantsLayer:YES];
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"bezel" ofType:@"png"];
    NSImage *image = [[NSImage alloc] initWithContentsOfFile:path];
	NSSize size = [image size];
	NSLog(@"main size %f", size.width);
	
	
}



@end
