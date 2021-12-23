//
//  DateClassModel.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//

import Foundation

struct DateClassModel: Codable {
    let year, month, day: Int
    
    static let exampleData = DateClassModel(year: 2016, month: 12, day: 19)
}
