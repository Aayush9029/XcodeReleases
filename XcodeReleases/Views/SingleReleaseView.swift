//
//  SingleReleaseView.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//

import SwiftUI

struct SingleReleaseView: View {
    let releaseModel: ReleaseModel
    
    var body: some View {
        VStack(spacing: 25){
            VStack{
                Group{
                    HStack{
                        Text("Version & Build")
                            .bold()
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    Divider()
                    TitleKeyView(icon: "info.circle", title: "Version", key: "\(releaseModel.version.number), \(releaseModel.version.build)")
                    TitleKeyView(icon: "calendar", title: "Release date", key: releaseModel.getDate())
                }
                Group{
                    HStack{
                        Text("SDKs")
                            .bold()
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    Divider()
                    TitleKeyView(icon: "laptopcomputer", title: "macOS", key: releaseModel.sdks?.macOS?.first?.build ?? "0.0")
                    
                    TitleKeyView(icon: "iphone", title: "iOS", key: releaseModel.sdks?.iOS?.first?.build ?? "0.0")
                    TitleKeyView(icon: "applewatch", title: "watchOS", key: releaseModel.sdks?.watchOS?.first?.build ?? "0.0")
                    TitleKeyView(icon: "appletv.fill", title: "tvOS", key: releaseModel.sdks?.tvOS?.first?.build ?? "0.0")
                }
            }
        }
        .padding()
        .background(.blue.opacity(0.15))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.blue, lineWidth: 2)
                .shadow(color: .blue, radius: 6, x: 0, y: 0)
        )
        .padding(4)
    }
}

struct SingleReleaseView_Previews: PreviewProvider {
    static var previews: some View {
        SingleReleaseView(releaseModel: ReleaseModel.exampleData)
    }
}

struct TitleKeyView: View {
    let icon: String
    let title: String
    let key: String
    
    
    var body: some View {
        VStack{
            HStack{
                Label(title, systemImage: icon)
                    .foregroundStyle(.primary)
                    .labelStyle(.iconOnly)
                Spacer()
                Text(key)
                    .foregroundStyle(.primary)
            }.font(.title3)
            Divider()
        }
    }
}
