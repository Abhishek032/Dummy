package digital_marketing

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/fbSignIn/callback?"(controller:"camp", action:"campaign" )
        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
