//
//  MPVVideoView.swift
//  VideoPlayer_libmpv
//
//  Created by 吴坤城 on 1/29/24.
//

import Foundation
import SwiftUI

struct MPVVideoView: NSViewRepresentable {
    let playerBridge: MPVPlayerBridge

    func makeNSView(context: Context) -> some NSView {
        // 创建一个用于视频输出的NSView
        let view = NSView()
        // 配置playerBridge使用这个view作为视频输出
        playerBridge.setVideoOutput(view)
        return view
    }

    func updateNSView(_ nsView: NSViewType, context: Context) {
        // 当视图更新时，您可以在这里进行配置
    }
}
