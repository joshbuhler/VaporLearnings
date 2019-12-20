import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
//    router.get("hello", String.parameter) { req -> String in
//        let name = try req.parameters.next(String.self)
//        return "Hello, \(name)"
//    }
    
    router.get("articles", Article.parameter) { req -> String in
        let article = try req.parameters.next(Article.self)
        return "Loading article: \(article.title)"
    }
    
    router.get("articles", Article.parameter, "json") { req -> Article in
        return try req.parameters.next(Article.self)
    }
    
    router.group("hello") { group in
        group.get("world") { req in
            return "Hello, world"
        }
        
        group.get("kitty") { req in
            return "Hello, kitty"
        }
    }
    
    router.group("article", Int.parameter) { group in
        group.get ("read") { req -> String in
            let num = try req.parameters.next(Int.self)
            return "Reading article: \(num)"
        }
        
        group.get ("edit") { req -> String in
            let num = try req.parameters.next(Int.self)
            return "Editing article: \(num)"
        }
    }
}
