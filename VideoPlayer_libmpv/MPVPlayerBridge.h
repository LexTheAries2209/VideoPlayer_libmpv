//
//  MPVPlayerBridge.h
//  VideoPlayer_libmpv
//
//  Created by 吴坤城 on 1/28/24.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>


@interface MPVPlayerBridge : NSObject

- (void)loadFile:(NSString *)filename;
- (void)play;
- (void)stop;
- (void)setVideoOutput:(NSView *)videoOutput;


@end
