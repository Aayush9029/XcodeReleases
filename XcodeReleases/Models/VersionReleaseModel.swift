//
//  VersionReleaseModel.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//

import Foundation

struct VersionReleaseModel: Codable {
    let release: Bool?
    let rc, beta: Int?
    let gm: Bool?
    let gmSeed, dp: Int?
}
