//
//  CompilersModel.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//

import Foundation

struct CompilersModel: Codable {
    let clang, swift, llvm, llvmGCC: [ClangModel]?
    let gcc: [ClangModel]?
    
    enum CodingKeys: String, CodingKey {
        case clang, swift, llvm
        case llvmGCC = "llvm_gcc"
        case gcc
    }
}
