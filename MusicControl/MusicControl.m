//
//  MusicControl.m
//  MusicControl
//
//  Created by Endoze on 7/24/12.
/*
 Copyright (c) 2012 , EndozeMedia, LLC
 All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 Neither the name of the <ORGANIZATION> nor the names of its contributors may be used to endorse or promote products derived from this software
 without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
 IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
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

- (NSString *)getCurrentAlbum
{
    switch (self.currentPlayer)
    {
        case kiTunes:
            return [[self.iTunes currentTrack] album];
            break;
        case kSpotify:
            return [[self.spotify currentTrack] album];
        case kRdio:
            return [[self.rdio currentTrack] album];
        default:
            return @"";
    }
}

- (NSImage *)getCurrentArtwork
{
    NSData *artworkData;
    NSImage *image;
    
    switch (self.currentPlayer)
    {
        case kiTunes:
        {
            // Array is populated with small, medium, large artwork
            //TODO: Look at all images returned and grab biggest available artwork
            artworkData = [[[[self.iTunes currentTrack] artworks] lastObject] rawData];
            image = [[NSImage alloc] initWithData:artworkData];
        }
            break;
        case kSpotify:
        {
            return [[self.spotify currentTrack] artwork];
        }
            break;
        case kRdio:
        {
            artworkData = [[self.rdio currentTrack] artwork];
            image = [[NSImage alloc] initWithData:artworkData];
        }
            break;
        default:
            break;
            
    }
    return image;
}

- (NSString *)getPlayStatus
{
    switch (self.currentPlayer)
    {
        case kiTunes:
        {
            switch ([self.iTunes playerState])
            {
                case iTunesEPlSPaused:
                    return @"Paused";
                    break;
                case iTunesEPlSPlaying:
                    return @"Playing";
                    break;
                case iTunesEPlSStopped:
                    return @"Stopped";
                    break;
                default:
                    break;
            }
        }
            break;
        case kSpotify:
        {
            switch ([self.spotify playerState])
            {
                case SpotifyEPlSPaused:
                    return @"Paused";
                    break;
                case SpotifyEPlSPlaying:
                    return @"Playing";
                    break;
                case SpotifyEPlSStopped:
                    return @"Stopped";
                    break;
                default:
                    break;
            }
        }
            break;
        case kRdio:
            switch ([self.rdio playerState])
        {
            case RdioEPSSPaused:
                return @"Paused";
                break;
            case RdioEPSSPlaying:
                return @"Playing";
                break;
            case RdioEPSSStopped:
                return @"Stopped";
                break;
            default:
                break;
        }   
        default:
            return @"";
    }
    return @"";
}

- (double)getPlayerPosition
{
    switch (self.currentPlayer)
    {
        case kiTunes:
            return [self.iTunes playerPosition];
        case kSpotify:
            return [self.spotify playerPosition];
        case kRdio:
            return [self.rdio playerPosition];
        default:
            return -1;
    }
}

- (double)getCurrentTrackDuration
{
    switch (self.currentPlayer)
    {
        case kiTunes:
            return [self.iTunes.currentTrack duration];
        case kSpotify:
            return [self.spotify.currentTrack duration];
        case kRdio:
            return [self.rdio.currentTrack duration];
        default:
            return -1;
    }
}

- (double)getPlayerPercentageComplete
{
    double position = [self getPlayerPosition];
    double duration = [self getCurrentTrackDuration];
    
    return position / duration;
}


@end
