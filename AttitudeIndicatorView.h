//
//  AttitudeIndicatorView.h
//  AttitudeIndicator
//
//  Created by Jason de la Cruz on 1/5/11.
//  Copyright 2011 Jason de la Cruz, All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

@interface AttitudeIndicatorView : NSView {
	
	CALayer *rollIndicatorLayer;
	CALayer *pitchIndicatorLayer;
	float roll;
	float pitch;
	CALayer *rootLayer;
	CALayer *bezelLayer;
	CALayer *rollLayer;
	CALayer *pitchLayer;
	CALayer *backplateLayer;
}

-(void)setUpLayers;
-(void)setRoll:(float)rollDegrees;
-(void)setPitch:(float)pitchDegrees;
-(CGImageRef)nsImageToCGImageRef:(NSImage*)image;
-(void)mouseDragged:(NSEvent *)theEvent;
@end
