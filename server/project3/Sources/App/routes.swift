import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    router.get("hello", String.parameter) { req -> String in
        let name = try req.parameters.next(String.self)
        return "Hello, \(name)"
    }
    
    router.get("articles", Article.parameter) { req -> String in
        let article = try req.parameters.next(Article.self)
        return "Loading article: \(article.title)"
    }
}
