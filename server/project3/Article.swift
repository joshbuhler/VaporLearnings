//
//  Article.swift
//  App
//
//  Created by Joshua Buhler on 12/17/19.
//

import Foundation
import Vapor

struct Article:Parameter, Content {
    typealias ResolvedParameter = Article
    
    var id:Int
    var title:String
    
    init (id:Int) {
        self.id = id
        self.title = "Custom params are spiffy"
    }
    
    static func resolveParameter(_ parameter: String, on container: Container) throws -> Article {
        if let id = Int(parameter) {
            return Article(id: id)
        }
        throw Abort(.badRequest)
    }
    
//    static func resolveParameter(_ parameter:String, on container:Container) throws -> Future<Article?> {
//
//        print ("Future<Article?>")
//        return Future.map(on: container) { Article(id: parameter)}
//    }
}
