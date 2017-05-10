//
//  Auth.swift
//  HarmonyUS
//
//  Created by Jacob Dobson on 3/23/17.
//  Copyright © 2017 Jacob Dobson. All rights reserved.
//

import Foundation
import StoreKit
import MediaPlayer

class AppleMusicPlayer: NSObject {
    
    let appPlayer = MPMusicPlayerController.systemMusicPlayer()
    
    func playID(_ productID: String) {
        SKCloudServiceController.requestAuthorization { status in
            let controller = SKCloudServiceController()
            controller.requestCapabilities { capabilities, error in
                if capabilities.contains(.addToCloudMusicLibrary) || capabilities.contains(.musicCatalogPlayback) {
                    MPMediaLibrary.default().addItem(withProductID: productID) { entities, error in
                        self.appPlayer.setQueueWithStoreIDs([productID])
                        self.appPlayer.shuffleMode = .songs
                        self.appPlayer.play()
                    }
                }
            }
        }
    }
}
