import Vapor
import Fluent

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    //retrieve all acronyms
    router.get("api", "acronyms") {
        req -> Future<[Acronym]>  in
        return Acronym.query(on: req).all()
    }

    let acronymsController = AcronymsController()
    try router.register(collection: acronymsController)
    
    let usersController = UsersController ()
    try router.register(collection: usersController)
    
    let categoriesController = CategoriesController()
    try router.register(collection: categoriesController)
}
