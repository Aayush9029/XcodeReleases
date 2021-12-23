//
//  ClangModel.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//

import Foundation

struct ClangModel: Codable {
    let number, build: String?
    let release: ClangReleaseModel
    
    static let exampleData = ClangModel(number: "5.5.2", build: "1300.0.47.5", release: ClangReleaseModel(release: true))
}
