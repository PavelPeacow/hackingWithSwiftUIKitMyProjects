//
//  ImageItemModel.swift
//  PhotoChallenge
//
//  Created by Павел Кай on 14.08.2022.
//

import Foundation

final class imageItem: Codable {
    let imageName: String
    let captionString: String
    
    init(imageName: String, captionString: String) {
        self.imageName = imageName
        self.captionString = captionString
    }
}
