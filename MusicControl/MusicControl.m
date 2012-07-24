//
//  MusicControl.m
//  MusicControl
//
//  Created by Endoze on 7/24/12.
//  Copyright (c) 2012 EndozeMedia, LLC. All rights reserved.
//

#import "MusicControl.h"
#import "iTunes.h"
#import "Spotify.h"
#import "Rdio.h"



#define kiTunesBundle @"com.apple.iTunes"
#define kSpotifyBundle @"com.spotify.client"
#define kRdioBundle @"com.rdio.desktop"

@interface MusicControl ()

@property (nonatomic, retain) iTunesApplication *iTunes;
@property (nonatomic, retain) SpotifyApplication *spotify;
@property (nonatomic, retain) RdioApplication *rdio;

- (void)setUpPlayers;

@end

@implementation MusicControl

@synthesize iTunes = _iTunes;
@synthesize spotify = _spotify;
@synthesize rdio = _rdio;
@synthesize currentPlayer = _currentPlayer;

- (id)init
{
    if (self = [super init])
    {
        // Custom setup from here
        self.currentPlayer = kiTunes;
        [self setUpPlayers];
        
    }
    
    return self;
}

- (id)initWithPlayer:(NSUInteger)player
{
    if (self = [super init])
    {
        self.currentPlayer = player;
        [self setUpPlayers];
    }
    
    return self;
}

- (void)setUpPlayers
{
    iTunesApplication *iTunes = [SBApplication applicationWithBundleIdentifier:kiTunesBundle];
    self.iTunes = iTunes;
    SpotifyApplication *spotify = [SBApplication applicationWithBundleIdentifier:kSpotifyBundle];
    self.spotify = spotify;
    RdioApplication *rdio = [SBApplication applicationWithBundleIdentifier:kRdioBundle];
    self.rdio = rdio;
}

- (void)playpause
{
    switch (self.currentPlayer)
    {
        case kiTunes:
            [self.iTunes playpause];
            break;
        case kSpotify:
            [self.spotify playpause];
            break;
        case kRdio:
            [self.rdio playpause];
            break;
        default:
            break;
    }
}

- (void)nextTrack
{
    switch (self.currentPlayer)
    {
        case kiTunes:
            [self.iTunes nextTrack];
            break;
        case kSpotify:
            [self.spotify nextTrack];
            break;
        case kRdio:
            [self.rdio nextTrack];
            break;
        default:
            break;
    }
}

- (void)previousTrack
{
    switch (self.currentPlayer)
    {
        case kiTunes:
            [self.iTunes previousTrack];
            break;
        case kSpotify:
            [self.spotify previousTrack];
            break;
        case kRdio:
            [self.rdio previousTrack];
            break;
        default:
            break;
    }
}

- (void)setVolume:(float)volume
{
    switch (self.currentPlayer)
    {
        case kiTunes:
            self.iTunes.soundVolume = volume;
            break;
        case kSpotify:
            self.spotify.soundVolume = volume;
            break;
        case kRdio:
            self.rdio.soundVolume = volume;
            break;
        default:
            break;
    }
}

- (float)getVolume
{
    switch (self.currentPlayer)
    {
        case kiTunes:
            return [self.iTunes soundVolume];
            break;
        case kSpotify:
            return [self.spotify soundVolume];
        case kRdio:
            return [self.rdio soundVolume];
            
        default:
            return -1;
    }
}

- (NSString *)getCurrentTrack
{
    switch (self.currentPlayer)
    {
        case kiTunes:
            return [[self.iTunes currentTrack] name];
            break;
        case kSpotify:
            return [[self.spotify currentTrack] name];
        case kRdio:
            return [[self.rdio currentTrack] name];
            
        default:
            return @"";
    }
}

- (NSString *)getCurrentArtist
{
    switch (self.currentPlayer)
    {
        case kiTunes:
            return [[self.iTunes currentTrack] artist];
            break;
        case kSpotify:
            return [[self.spotify currentTrack] artist];
        case kRdio:
            return [[self.rdio currentTrack] artist];
            
        default:
            return @"";
    }
}



@end
