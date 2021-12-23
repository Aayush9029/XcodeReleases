//
//  DownloadModel.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//

import Foundation

struct DownloadModel: Codable {
    let url: String
    static let exampleData =  DownloadModel(url: "https://download.developer.apple.com/Developer_Tools/Xcode_8.2.1/Xcode_8.2.1.xip")
}
