//
//  
//  ReleasesModel.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//
//

import Foundation


struct ReleaseModel: Codable, Identifiable {
    var id: UUID?
    let compilers: CompilersModel?
    let requires: String
    let date: DateClassModel
    let links: LinksModel?
    let version: VersionModel
    let sdks: SdksModel?
    let name: NameModel
    let checksums: ChecksumsModel?
    
    func getDate() -> String {
        let calendar = Calendar(identifier: .gregorian)
        return (calendar.date(from: DateComponents(year: date.year, month: date.month, day: date.day))?.formatted(date: .abbreviated, time: .omitted))!
        
    }
    
    static let exampleData = ReleaseModel(
        compilers: CompilersModel(
            clang: [ClangModel.exampleData],
            swift: [ClangModel.exampleData],
            llvm: [ClangModel.exampleData],
            llvmGCC: [],
            gcc: [ClangModel.exampleData]
        ),
        requires: "10.11.15",
        date: DateClassModel.exampleData,
        links: LinksModel(
            notes: DownloadModel.exampleData,
            download: DownloadModel.exampleData
        ),
        version: VersionModel.exampleData,
        sdks: SdksModel(
            macOS:[ClangModel.exampleData],
            tvOS: [ClangModel.exampleData],
            iOS: [ClangModel.exampleData],
            watchOS:[ClangModel.exampleData]
        ),
        name: .xcode,
        checksums: ChecksumsModel.exampleData
    )
}

// MARK: Aliasing the main ReleaseModel
typealias Releases = [ReleaseModel]
