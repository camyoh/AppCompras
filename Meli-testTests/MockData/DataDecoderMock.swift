//
//  DataDecoderMock.swift
//  Meli-testTests
//
//  Created by Andres Mendieta on 1/04/24.
//

import Foundation
@testable import Meli_test

class DataDecoderMock: DataDecoderProtocol{
    enum Methods {
        case decode
    }

    var calledMethods: [Methods] = []

    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
        calledMethods.append(.decode)
        let decoder = JSONDecoder()
        return try decoder.decode(type, from: data)
    }
}
