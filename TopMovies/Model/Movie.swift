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
    var movieLink: String?
    var previewLink: String?
    var category: String?
    var artist: String?
    var price: String?
    var rentalPrice: String?
    var image: String?
    var releaseDate: String?
    
    override func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [
            (keyInObject: "name", keyInResource: "im:name"),
            (keyInObject: "movieLink", keyInResource: nil),
            (keyInObject: "previewLink", keyInResource: nil),
            (keyInObject: "category", keyInResource: nil),
            (keyInObject: "artist", keyInResource: "im:artist"),
            (keyInObject: "price", keyInResource: nil),
            (keyInObject: "rentalPrice", keyInResource: nil),
            (keyInObject: "image", keyInResource: nil),
            (keyInObject: "releaseDate", keyInResource: nil),
        ]
    }
    
    override func decodePropertyValue(value: Any, key: String) -> Any {
        let dict = value as? Dictionary<String, String>
        if key == "link" {
            if let title = dict?["_title"] {
                if title == "Preview" {
                    self.previewLink = dict?["_href"]
                } else {
                    self.movieLink = dict?["_href"]
                }
            }
        } else if key == "category" {
            self.category = dict?["_label"]
        } else if key == "im:price" {
            self.price = dict?["__text"]
        } else if key == "im:rentalPrice" {
            self.rentalPrice = dict?["__text"]
        } else if key == "im:image" {
            if let height = dict?["_height"] {
                // Get minimum 170 image
                if Int(height)! >= 170 {
                    self.image = dict?["__text"]
                }
            }
        } else if key == "im:releaseDate" {
            self.releaseDate = dict?["_label"]
        }
        return value
    }
}
