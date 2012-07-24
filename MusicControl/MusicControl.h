//
//  MusicControl.h
//  MusicControl
//
//  Created by Endoze on 7/24/12.
//  Copyright (c) 2012 EndozeMedia, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kiTunes 0
#define kSpotify 1
#define kRdio 2

@interface MusicControl : NSObject

@property (nonatomic) NSUInteger currentPlayer;

- (id)initWithPlayer:(NSUInteger)player;
- (void)playpause;
- (void)nextTrack;
- (void)previousTrack;
- (void)setVolume:(float)volume;
- (float)getVolume;
- (NSString *)getCurrentTrack;
- (NSString *)getCurrentArtist;



@end
