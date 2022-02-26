//
//  NetworkingRepository.swift
//  zavrsni-v2
//
//  Created by Luka Vujnovac on 26.02.2022..
//

import Foundation
import Combine

struct BlinkModel: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class NetworkingRepository: ObservableObject {
    @Published var blinks: [BlinkModel] = []
    var cancellabels = Set<AnyCancellable>()
    
    init() {
        
    }
    
    func getBlinks() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [BlinkModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink { [weak self] returnedBlinks in
                self?.blinks = returnedBlinks
            }
            .store(in: &cancellabels)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
            guard 
                let response = output.response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
            return output.data
        }
}
