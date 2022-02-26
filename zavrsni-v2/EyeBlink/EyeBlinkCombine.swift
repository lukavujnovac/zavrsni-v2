//
//  EyeBlinkCombine.swift
//  zavrsni-v2
//
//  Created by Luka Vujnovac on 26.02.2022..
//

import SwiftUI
import Combine

class EyeBlinkDataService {
    @StateObject var data = MockData()
//    @Published var eyeBlink: Bool = false
//    let eyeBlinkPassThroughPublisher = PassthroughSubject<Bool, Never>()
    let eyeBlinkCurrentValuePublisher = CurrentValueSubject<String, Never>("false")
    
    init() {
        publishEyeBlink()
    }
    
    private func publishEyeBlink() {
        let blinks: [String] = data.blinks
        
        for x in blinks.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.eyeBlinkCurrentValuePublisher.send(blinks[x])
                
                if x == blinks.indices.last {
                    self.eyeBlinkCurrentValuePublisher.send(completion: .finished)
                }
            }
        }
    }
}

class EyeBlinkViewModel: ObservableObject {
    @Published var data: [String] = []
    @Published var error: String = "////ERROR: publishing eye blinks////"
    let dataService = EyeBlinkDataService()
    
    var cancellabels = Set<AnyCancellable>()
    
    init() {
        
    }
    
    private func addSubscribers() {
        dataService.eyeBlinkCurrentValuePublisher
            .last()
            .map({String($0)})
            .sink { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.error = error.localizedDescription
                }
            } receiveValue: { [weak self] returnedValue in
                self?.data.append(returnedValue)
            }
            .store(in: &cancellabels)

    }
}

class MockData: ObservableObject {
    let blinks: [String] = ["true", "false", "true", "true", "true", "false", "true", "true", "true", "false", "false"]
    
    func imperativeProgramming() {
        let array = [1, 2, 3, 4, 5, 6]
        
        var evenNumbers: [Int] = []
        
        for i in 0..<array.count {
            if array[i] % 2 == 0 {
                evenNumbers.append(array[i])
            }
        }
    }
    
    func declarativeProgramming() {
        let array = [1, 2, 3, 4, 5, 6]
        let evenNumbers = array.filter{ $0 % 2 == 0 }
    }
}
