# Music Control

## Overview

This framework is designed to help you control iTunes, Spotify, and Rdio.  It allows you to control playback and get information about the current track playing.  It is a framework designed for use on OSX.

## Installation Instructions
Set up your project that you intend to use this framework in like you normally would.  Add a Frameworks folder directly under the root of your project directory.  Copy the MusicControl.framework file into this Frameworks directory.  

Once you've copied it over, open Xcode and go to the Build Phases of your application.  Add the framework to your project in the Link Binary With Libraries section.  Add a build phase (copy files).  Drag this phase above Link Binary With Libraries.  Then set the destination to Frameworks. Finally, drag the framework over into the Copy Files phase.

The last step is modifying the Runtime search paths to let your project know where this framework is.  Change it's value to @loader_path/../Frameworks.  Now you can #import <MusicControl/MusicControl.h> and code away!

## License
Created by Endoze on 7/24/12.

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
 