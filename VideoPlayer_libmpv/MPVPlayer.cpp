//
//  MPVPlayer.cpp
//  VideoPlayer_libmpv
//
//  Created by 吴坤城 on 1/25/24.
//

#include "MPVPlayer.hpp"

MPVPlayer::MPVPlayer() {
    mpv = mpv_create();
    if (mpv) {
        mpv_initialize(mpv);
    }
}

MPVPlayer::~MPVPlayer() {
    if (mpv) {
        mpv_terminate_destroy(mpv);
    }
}

void MPVPlayer::load(const char *filename) {
    if (mpv) {
        const char *cmd[] = {"loadfile", filename, NULL};
        mpv_command(mpv, cmd);
    }
}

void MPVPlayer::play() {
    if (mpv) {
        mpv_set_property_string(mpv, "pause", "no");
    }
}

void MPVPlayer::stop() {
    if (mpv) {
        mpv_set_property_string(mpv, "pause", "yes");
    }
}

mpv_handle *MPVPlayer::get_handle() {
    return mpv;
}


