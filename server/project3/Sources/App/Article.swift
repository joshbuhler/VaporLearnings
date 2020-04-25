//
//  Article.swift
//  App
//
//  Created by Joshua Buhler on 4/24/20.
//

import Foundation
import Vapor

struct Article:Parameter, Content {
    
    
    typealias ResolvedParameter = Future<Article?>
    
    var id:Int
    var title:String
    
    init(id:Int) {
        self.id = id
        self.title = "Hey howdy hey"
    }
    
    static func resolveParameter(_ parameter: String, on container: Container) throws -> Future<Article?> {
        
        guard let id = Int(parameter) else {
            throw Abort(.badRequest)
        }
        
        return Future.map(on: container) { Article(id: id) }
    }
}
