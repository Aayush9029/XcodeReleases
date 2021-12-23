//
//  ChecksumsModel.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//

import Foundation

struct ChecksumsModel: Codable {
    let sha1: String
    static let exampleData =  ChecksumsModel(sha1: "b55777d005c7774e4756f29d875d241db1769d90")
}
