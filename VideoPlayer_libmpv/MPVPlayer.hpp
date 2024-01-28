//
//  MPVPlayer.hpp
//  VideoPlayer_libmpv
//
//  Created by 吴坤城 on 1/25/24.
//

#ifndef MPVPlayer_hpp
#define MPVPlayer_hpp

#include <mpv/client.h>

class MPVPlayer {
public:
    MPVPlayer();
    ~MPVPlayer();
    mpv_handle *get_handle();

    void load(const char *filename);
    void play();
    void stop();
    
private:
    mpv_handle *mpv;
};

#endif /* MPVPlayer_hpp */
