import Vapor

let drop = Droplet()

drop.get { req in
    let lang = req.headers["Accept-Language"]?.string ?? "en"
    return try drop.view.make("welcome", [
    	"title": Node.string(drop.localization[lang, "welcome", "title"]),
    	"message": Node.string(drop.localization[lang, "welcome", "message"])
    ])
}

drop.resource("posts", PostController())

drop.run()
