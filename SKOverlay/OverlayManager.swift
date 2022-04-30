//
// Created for SKOverlay
// by Stewart Lynch on 2022-04-30
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import StoreKit
import SwiftUI

class OverlayManager: ObservableObject {
    @Published var showOverlay = false
    let threshold = 3
    var configuration = SKOverlay.AppConfiguration(appIdentifier: "1407910298", position: .bottomRaised)
    @AppStorage("launches") var launches = 0
    let appIDs: [String] = ["1407910298", "1538180265", "1170176042", "1351561179", "938327160", "1077430911", "1456194495", "1131037949", "1440437677", "1317161001", "1608809365"]
    
    init() {
        randomConfiguration()
    }
    
    func randomConfiguration() {
        configuration = SKOverlay.AppConfiguration(appIdentifier: appIDs.randomElement()!, position: .bottomRaised)
    }
    
    func checkShowOverlay() {
        launches += 1
        print(launches)
        if launches >= threshold {
            launches = 0
            showOverlay = true
        }
    }
}
