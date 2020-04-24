//
//  Article.swift
//  App
//
//  Created by Joshua Buhler on 4/24/20.
//

import Foundation
import Vapor

struct Article:Parameter, Content {
    typealias ResolvedParameter = Article
    
    var id:Int
    var title:String
    
    init(id:String) {
        if let intID = Int(id) {
            self.id = intID
            self.title = "Hey howdy hey"
        } else {
            self.id = 0
            self.title = "Unknown article"
        }
    }
    
    static func resolveParameter(_ parameter: String, on container: Container) throws -> ResolvedParameter {
        return Article(id: parameter)
    }
}
