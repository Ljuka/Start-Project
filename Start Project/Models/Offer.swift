//
//  Offer.swift
//  onepower-ios
//
//  Created by Ljubo Maricevic on 12/07/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation

// MARK: - Offer
struct Offer: Codable {
    let chainCode: String?
    let coverImg: String?
    let offerDescription: String?
    let iconImg, iconImgSelected: String?
    let lang, offerID, shortTitle, title: String?
    
    enum CodingKeys: String, CodingKey {
        case chainCode = "chain_code"
        case coverImg = "cover_img"
        case offerDescription = "description"
        case iconImg = "icon_img"
        case iconImgSelected = "icon_img_selected"
        case lang
        case offerID = "offer_id"
        case shortTitle = "short_title"
        case title
    }
}
