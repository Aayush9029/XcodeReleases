//
//  
//  ReleasesViewModel.swift
//  XcodeReleases
//
//  Created by Aayush Pokharel on 2021-12-22.
//
//

import SwiftUI

class ReleasesViewModel : ObservableObject {
    
    @Published var releases: Releases
    @Published var currentError: CustomError
    
    init(){
        releases = Releases()
        currentError = .none
        fetchData()
    }
    
    // Helper fetch function uses Task to execute async function
    // Catches and logs error messages if any
    func fetchData() {
        Task {
            do {
                try await fetchUsingAsync()
            } catch CustomError.invalidURL {
                print("The URL being fetched is invalid")
                changeStatus(.invalidURL)
                
            } catch CustomError.invalidResponse {
                print("We got invalid respose ie : not 200 OK")
                changeStatus(.invalidResponse)
                
            } catch CustomError.invalidJson {
                print("Error decoding JSON from the response")
                changeStatus(.invalidJson)
                
            } catch {
                changeStatus(.unknown)
                print("Unknown Error occured!")
                //                fatalError("Unknown Error: Not supposed to happen! Report to remote loggers")
            }
        }
    }
    
    //  Main async function, fetches data from json, decodes it and loads it into
    //  releases array
    func fetchUsingAsync() async throws{
        guard let url = URL(string: Constants.jsonUrl) else { throw CustomError.invalidURL }
        
        let urlRequest = URLRequest(url: url)
        let (result, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw CustomError.invalidResponse
        }
        
        do {
            let fetchedReleases = try JSONDecoder().decode(Releases.self, from: result)
            addToReleases(fetchedReleases)
            
        } catch{
            throw CustomError.invalidJson
        }
    }
    
    func addToReleases(_ releases: Releases){
        for release in releases {
            var releaseWithID = release
            releaseWithID.id = UUID()
            DispatchQueue.main.async {
                self.releases.append(releaseWithID)
            }
        }
        
    }
    
    func changeStatus(_ error: CustomError) {
        DispatchQueue.main.async {
            self.currentError = error
        }
    }
}



extension ReleasesViewModel {
    // Custom error type with custom errors
    // none =  nothing has happened yet
    enum CustomError: Error {
        case none
        
        case invalidURL
        case invalidResponse
        
        case invalidJson
        
        case unknown
    }
    
}
