//
//  
//  ReleasesView.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//
//

import SwiftUI

struct ReleasesView : View {
    @EnvironmentObject var releasesVM: ReleasesViewModel
    
    let columns = [
         GridItem(.adaptive(minimum: 200))
     ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            LazyVGrid(columns: columns){
                    ForEach(releasesVM.releases) { release in
                        SingleReleaseView(releaseModel: release)
                    }
            }
            .padding()
        }
    }
}

struct ReleasesPreviews : PreviewProvider {
    static var previews: some View {
        ReleasesView()
            .environmentObject(ReleasesViewModel())
    }
}
