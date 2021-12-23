//
//  VersionModel.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//

import Foundation

struct VersionModel: Codable {
    let number, build: String
    let release: VersionReleaseModel
    
    static let exampleData =  VersionModel(number: "8.2.1", build: "8C1002", release: VersionReleaseModel(release: true, rc: 1, beta: 2, gm: true, gmSeed: 1, dp: 1))
}
