//
//  CharacterListNetworkService.swift
//  ModularSwiftUI
//
//  Created by Mostafa Nafie on 26/09/2022.
//

import Combine
import Foundation

public protocol CharacterListNetworkServicing {
    typealias CharactersResponse = [CharactersNetwork.Character]

    func fetchCharacters() -> AnyPublisher<CharactersResponse, Error>
}

public struct CharacterListNetworkService: CharacterListNetworkServicing {
    private let client: HTTPClient
    
    public init(client: HTTPClient) {
        self.client = client
    }
    
    public func fetchCharacters() -> AnyPublisher<CharactersResponse, Error> {
        let request = CharactersRequest().buildURLRequest()
        return client.perform(request)
            .print(#function)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}

class PreviewCharacterListNetworkService: CharacterListNetworkServicing {
    func fetchCharacters() -> AnyPublisher<CharactersResponse, Error> {
        let fakeCharacters: CharactersResponse = [
            .init(id: 1, name: "Walter White", birthday: "", occupation: nil, img: "https://vignette.wikia.nocookie.net/breakingbad/images/c/c1/4x11_-_Huell.png/revision/latest?cb=20130913100459&path-prefix=es", status: nil, nickname: "", appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil),
            .init(id: 2, name: "Jesse Pinkman", birthday: "", occupation: nil, img: "https://vignette.wikia.nocookie.net/breakingbad/images/c/c1/4x11_-_Huell.png/revision/latest?cb=20130913100459&path-prefix=es", status: nil, nickname: "", appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil),
            .init(id: 3, name: "Henry Schrader", birthday: "", occupation: nil, img: "https://vignette.wikia.nocookie.net/breakingbad/images/c/c1/4x11_-_Huell.png/revision/latest?cb=20130913100459&path-prefix=es", status: nil, nickname: "", appearance: nil, portrayed: nil, category: nil, betterCallSaulAppearance: nil)
        ]
        return Just(fakeCharacters)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
