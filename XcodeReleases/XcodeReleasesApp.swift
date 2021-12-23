//
//  XcodeReleasesApp.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//

import SwiftUI

@main
struct XcodeReleasesApp: App {
    @StateObject var releasesVM = ReleasesViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(releasesVM)
                .background(VisualEffectView(material: .menu, blendingMode: .behindWindow))
                .frame(width: 1000)
            
        }

    }
}
