//
//  RequestHelpRepository.swift
//  Hlpr
//
//  Created by López Torres, Oriol on 2020-04-05.
//  Copyright © 2020 Hlpr. All rights reserved.
//

import Foundation

enum GenericError: Error {
    case `default`
}

class RequestHelpRepository {
    
    var requestHelp: RequestHelp?
    
    init() {}
    
    func getHelp(completion: @escaping (Result<RequestHelp, Error>) -> Void) {
        if let requestHelp = requestHelp {
            completion(.success(requestHelp))
        } else {
            completion(.failure(GenericError.default))
        }
    }
    
    func requestHelp(_ requestHelp: RequestHelp, completion: @escaping (Result<Void, Error>) -> Void) {
        self.requestHelp = requestHelp
        completion(.success( () ))
        return
    }
}
