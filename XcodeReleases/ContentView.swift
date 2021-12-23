//
//  ContentView.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var releasesVM: ReleasesViewModel

    var body: some View {
        ReleasesView()
            .environmentObject(releasesVM)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ReleasesViewModel())

    }
}
