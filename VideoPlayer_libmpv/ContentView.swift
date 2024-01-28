//
//  ContentView.swift
//  VideoPlayer_libmpv
//
//  Created by 吴坤城 on 1/25/24.
//

import SwiftUI
struct ContentView: View {
    let playerBridge = MPVPlayerBridge()
    
    var body: some View {
        VStack {
            MPVVideoView(playerBridge: playerBridge)
                .frame(width: 400, height: 300)
            Button("Play") {
                playerBridge.loadFile(NSString(string: "/Users/lex./Desktop/1.mp4").expandingTildeInPath)
                playerBridge.play()
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
