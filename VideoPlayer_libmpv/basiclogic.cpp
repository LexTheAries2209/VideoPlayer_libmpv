//
//  basiclogic.cpp
//  VideoPlayer_libmpv
//
//  Created by 吴坤城 on 1/25/24.
//

#include "basiclogic.hpp"

int main() {
    // Replace with the actual path to the video on your desktop
    // On Windows, it might be something like "C:\\Users\\YourUsername\\Desktop\\1.mp4"
    // On macOS, it might be "/Users/YourUsername/Desktop/1.mp4"
    // On Linux, it might be "/home/YourUsername/Desktop/1.mp4"
    std::string desktop_path = "/Users/YourUsername/Desktop/1.mp4"; // Change YourUsername

    mpv_handle *mpv = mpv_create();
    if (!mpv) {
        std::cerr << "Failed to create mpv context" << std::endl;
        return 1;
    }

    if (mpv_initialize(mpv) < 0) {
        std::cerr << "Failed to initialize mpv context" << std::endl;
        mpv_destroy(mpv);
        return 1;
    }

    // Load the video file from the desktop
    const char *cmd[] = {"loadfile", desktop_path.c_str(), NULL};
    mpv_command(mpv, cmd);

    std::cout << "Playing video from desktop: " << desktop_path << std::endl;

    // Wait for the file to start playing
    while (1) {
        mpv_event *event = mpv_wait_event(mpv, 10);
        if (event->event_id == MPV_EVENT_END_FILE || event->event_id == MPV_EVENT_SHUTDOWN) {
            break;
        }
    }

    mpv_terminate_destroy(mpv);
    return 0;
}



