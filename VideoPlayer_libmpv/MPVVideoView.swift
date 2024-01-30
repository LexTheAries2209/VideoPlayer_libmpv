//
//  MPVVideoView.swift
//  VideoPlayer_libmpv
//
//  Created by 吴坤城 on 1/29/24.
//

import Foundation
import SwiftUI

class CustomVideoView: NSView {
    var playerBridge: MPVPlayerBridge?

    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        if let window = self.window, window.windowNumber > 0 {
            playerBridge?.setVideoOutput(self)
        }
    }
}

struct MPVVideoView: NSViewRepresentable {
    let playerBridge: MPVPlayerBridge

    func makeNSView(context: Context) -> some NSView {
        let view = CustomVideoView()
        view.playerBridge = playerBridge
        return view
    }

    func updateNSView(_ nsView: NSViewType, context: Context) {
        // Perform additional updates if needed
    }
}

