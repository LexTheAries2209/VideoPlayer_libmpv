//
//  MPVPlayerBridge.mm
//  VideoPlayer_libmpv
//
//  Created by 吴坤城 on 1/28/24.
//

// MPVPlayerBridge.mm
#import "MPVPlayerBridge.h"

// 确保 C++ 头文件被正确包含
#ifdef __cplusplus
#include "MPVPlayer.hpp"
#endif

#include <memory>
@implementation MPVPlayerBridge {
    std::unique_ptr<MPVPlayer> player;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // 使用 new 来分配 C++ 对象
        player.reset(new MPVPlayer());
    }
    return self;
}

- (void)dealloc {
    // unique_ptr 会自动释放分配的内存
    player = nullptr;
}

- (void)loadFile:(NSString *)filename {
    // 调用 C++ 方法时，使用 -> 操作符
    player->load([filename UTF8String]);
}

- (void)play {
    player->play();
}

- (void)stop {
    player->stop();
}

- (void)setVideoOutput:(NSView *)videoOutput {
    // 将NSView的window handle传递给libmpv
    mpv_set_option_string(player->get_handle(), "wid", [[NSString stringWithFormat:@"%ld", (long)videoOutput.window.windowNumber] UTF8String]);
}

@end

