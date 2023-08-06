//
//  Service.Model.Common.ServerError.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import Foundation
extension Service.Model.Common {
    struct ServerError : Codable {
        var status: String
        var code : String
        var message : String
        init(status: String, code: String, message: String) {
            self.status = status
            self.code = code
            self.message = message
        }
    }
}
