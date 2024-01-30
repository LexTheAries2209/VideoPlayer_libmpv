//
//  ContentView.swift
//  VideoPlayer_libmpv
//
//  Created by 吴坤城 on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    let playerBridge = MPVPlayerBridge()
    @State private var videoPath: String = ""

    var body: some View {
        VStack {
            MPVVideoView(playerBridge: playerBridge)
                .frame(width: 400, height: 300)
            Text(videoPath) // 显示当前选择的视频路径
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(maxWidth: 400)

            Button("Open") {
                let openPanel = NSOpenPanel()
                openPanel.canChooseFiles = true
                openPanel.canChooseDirectories = false
                openPanel.allowsMultipleSelection = false
                openPanel.begin { response in
                    if response == .OK {
                        if let selectedPath = openPanel.url?.path {
                            videoPath = selectedPath // 更新视频路径状态
                            playerBridge.loadFile(selectedPath)
                        }
                    }
                }
            }

            Button("Play") {
                if !videoPath.isEmpty {
                    playerBridge.loadFile(videoPath) 
                    // 使用当前选择的视频路径
                    playerBridge.play()
                }
            }
            Button("Stop") {
                playerBridge.stop()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
