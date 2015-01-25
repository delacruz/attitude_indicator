//
//  AttitudeIndicatorView.m
//  AttitudeIndicator
//
//  Created by Jason de la Cruz on 1/5/11.
//  Copyright 2011 Jason de la Cruz, All rights reserved.
//

#import "AttitudeIndicatorView.h"


@implementation AttitudeIndicatorView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    // Drawing code here.
}

-(void)awakeFromNib
{
	
}

-(void)setUpLayers
{
	[self setWantsLayer:YES];
	
	NSString *bezelPath = [[NSBundle mainBundle] pathForResource:@"bezel" ofType:@"png"];
	NSString *rollPath = [[NSBundle mainBundle] pathForResource:@"roll" ofType:@"png"];
	NSString *pitchPath = [[NSBundle mainBundle] pathForResource:@"pitch" ofType:@"png"];
	NSString *backplatePath = [[NSBundle mainBundle] pathForResource:@"backplate" ofType:@"png"];
	
    NSImage *bezelImage = [[NSImage alloc] initWithContentsOfFile:bezelPath];
	NSImage *rollImage = [[NSImage alloc] initWithContentsOfFile:rollPath];
	NSImage *pitchImage = [[NSImage alloc] initWithContentsOfFile:pitchPath];
	NSImage *backplateImage = [[NSImage alloc] initWithContentsOfFile:backplatePath];
	
	CGImageRef bezelImageRef = [self nsImageToCGImageRef:bezelImage];
	CGImageRef rollImageRef = [self nsImageToCGImageRef:rollImage];
	CGImageRef pitchImageRef = [self nsImageToCGImageRef:pitchImage];
	CGImageRef backplateImageRef = [self nsImageToCGImageRef:backplateImage];
	
	rootLayer = [CALayer layer];
	bezelLayer = [CALayer layer];
	rollLayer = [CALayer layer];
	pitchLayer = [CALayer layer];
	backplateLayer = [CALayer layer];
	
	[bezelLayer setFrame:CGRectMake(0.0, 
								   0.0, 
								   [self frame].size.width, 
								   [self frame].size.height)];
	
	[rollLayer setFrame:CGRectMake(0.0, 
	                                 0.0, 
	                                 [self frame].size.width, 
	                                 [self frame].size.height)];
	[pitchLayer setFrame:CGRectMake(0.0, 
								   0.0, 
								   [self frame].size.width, 
								   [self frame].size.height)];
	[backplateLayer setFrame:CGRectMake(0.0, 
								   0.0, 
								   [self frame].size.width, 
								   [self frame].size.height)];
		
	[bezelLayer setContents:(id)bezelImageRef];
	[bezelLayer setContentsGravity:kCAGravityCenter];
	
	[rollLayer setContents:(id)rollImageRef];
	[rollLayer setContentsGravity:kCAGravityCenter];
	
	[pitchLayer setContents:(id)pitchImageRef];
	[pitchLayer setContentsGravity:kCAGravityCenter];
	
	[backplateLayer setContents:(id)backplateImageRef];
	[backplateLayer setContentsGravity:kCAGravityCenter];
	
	[backplateLayer addSublayer:pitchLayer];
	[backplateLayer addSublayer:rollLayer];

	[rootLayer setContentsGravity:kCAGravityCenter];
	[rootLayer addSublayer:backplateLayer];
	[rootLayer addSublayer:bezelLayer];
	
	[self setLayer:rootLayer];
	
	
	NSValue *value = nil;
	CABasicAnimation *animation = nil;
	CATransform3D transform;
	
	// [backplateLayer removeAllAnimations];
	animation = [CABasicAnimation animationWithKeyPath:@"transform"];
	transform = CATransform3DMakeRotation(M_PI_2, 0.0f, 0.0f, 1.0f);
	value = [NSValue valueWithCATransform3D:transform];
	[animation setToValue:value];
	transform = CATransform3DMakeRotation(-M_PI_2, 0.0f, 0.0f, 1.0f);
	value = [NSValue valueWithCATransform3D:transform];
	[animation setFromValue:value];
	[animation setAutoreverses:YES];
	[animation setDuration:7.0f];
	[animation setRepeatCount:100];
	[backplateLayer addAnimation:animation forKey:@"RollKey"];
	
	transform = CATransform3DMakeTranslation(0, -70.0, 0.0);
	value = [NSValue valueWithCATransform3D:transform];
	[animation setToValue:value];
	transform = CATransform3DMakeTranslation(0, 70.0, 0.0);
	value = [NSValue valueWithCATransform3D:transform];
	[animation setFromValue:value];
	[animation setAutoreverses:YES];
	[animation setDuration:4.0];
	[animation setRepeatCount:100];
	[pitchLayer addAnimation:animation forKey:@"PitchKey"];
}

-(void)setRoll:(float)rollDegrees
{
	NSLog(@"Setting roll to %f", rollDegrees);
	roll = rollDegrees;
}
-(void)setPitch:(float)pitchDegrees
{
	NSLog(@"Setting pitch to %f", pitchDegrees);
	pitch = pitchDegrees;
}

-(CGImageRef)nsImageToCGImageRef:(NSImage*)image
{
	NSLog(@"Setting image.");
	
	NSData *imageData = [image TIFFRepresentation];
	CGImageRef imageRef;
	if (imageData) {
		CGImageSourceRef imageSource = CGImageSourceCreateWithData((CFDataRef)imageData, NULL);
		imageRef = CGImageSourceCreateImageAtIndex(imageSource, 0, NULL);
	}
	return imageRef;
}
-(void)mouseDragged:(NSEvent *)theEvent
{
    NSPoint p = [theEvent locationInWindow];
    NSLog(@"mouseDragged:%@", NSStringFromPoint(p));
}
@end
