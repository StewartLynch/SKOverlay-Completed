//
// Created for SKOverlay
// by Stewart Lynch on 2022-04-30
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI
import StoreKit

struct ContentView: View {
    @StateObject private var overlayManager = OverlayManager()
    var body: some View {
        NavigationView {
            VStack {
                Image("launchScreen")
                Button("Show Overlay") {
                    overlayManager.randomConfiguration()
                    overlayManager.showOverlay.toggle()
                }
                Spacer()
            }
            .navigationTitle("SKOverlay")
            .appStoreOverlay(isPresented: $overlayManager.showOverlay) {
                return overlayManager.configuration
            }
            .onAppear {
                overlayManager.checkShowOverlay()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
