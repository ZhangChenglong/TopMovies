//
//  Feed.swift
//  TopMovies
//
//  Created by ZHANG Chenglong on 19/10/17.
//  Copyright © 2017 ZHANG Chenglong. All rights reserved.
//

import UIKit
import EVReflection

class Feed: EVObject {
    var movies: [Movie]?
    
    override func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [
            (keyInObject: "movies", keyInResource: "entry"),
        ]
    }
}
