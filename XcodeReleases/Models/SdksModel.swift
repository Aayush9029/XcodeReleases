//
//  SdksModel.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//

import Foundation

struct SdksModel: Codable {
    let macOS, tvOS, iOS, watchOS: [ClangModel]?
}
