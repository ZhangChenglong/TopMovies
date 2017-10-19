//
//  Movie.swift
//  TopMovies
//
//  Created by ZHANG Chenglong on 19/10/17.
//  Copyright © 2017 ZHANG Chenglong. All rights reserved.
//

import UIKit
import EVReflection

class Movie: EVObject {
    var title: String?
    var summary: String?
    var name: String?
    var link: [Link]?
    var category: Category?
    var artist: String?
    var price: String?
    var rentalPrice: String?
    var image: [Image]?
    var releaseDate: String?
    
    override func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [
            (keyInObject: "name", keyInResource: "im:name"),
            (keyInObject: "artist", keyInResource: "im:artist"),
            (keyInObject: "price", keyInResource: "im:price"),
            (keyInObject: "rentalPrice", keyInResource: "im:rentalPrice"),
            (keyInObject: "image", keyInResource: "im:image"),
            (keyInObject: "releaseDate", keyInResource: "im:releaseDate"),
        ]
    }
}

class Link: EVObject {
    var _href: String?
    var isPreview = false
    
    override func propertyConverters() -> [(key: String, decodeConverter: ((Any?) -> ()), encodeConverter: (() -> Any?))] {
        return [
            (
                key: "_title",
                decodeConverter: { self.isPreview = ($0 as? String == "Preview") },
                encodeConverter: { return self.isPreview ? "Preview" : "" }
            )
        ]
    }
}

class Category: EVObject {
    var _label: String?
}

class Image: EVObject {
    var _height: String?
}
