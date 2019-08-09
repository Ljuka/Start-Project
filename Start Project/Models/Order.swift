//
//  Order.swift
//  onepower-ios
//
//  Created by Ljubo Maricevic on 29/07/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation

// MARK: - Order
struct Order: Codable {
    let firstName, lastName, email: String?
    let canBeContacted: Bool?
    let serviceConsent, marketingConsent: Consent?
    let taxCode, gender, dateOfBirth, placeOfBirth: String?
    let offerChainCode, typeOfSupply, pdr, pod: String?
    let idCardFrontURL, idCardBackURL, billingURL, paymentMethod: String?
    let iban: String?
    let billingDelivery: Bool?
    let residenceAddress, supplyAddress, billingAddress: Address?
    let additionalQuestions: [AdditionalQuestion]?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case canBeContacted = "can_be_contacted"
        case serviceConsent = "service_consent"
        case marketingConsent = "marketing_consent"
        case taxCode = "tax_code"
        case gender
        case dateOfBirth = "date_of_birth"
        case placeOfBirth = "place_of_birth"
        case offerChainCode = "offer_chain_code"
        case typeOfSupply = "type_of_supply"
        case pdr, pod
        case idCardFrontURL = "id_card_front_url"
        case idCardBackURL = "id_card_back_url"
        case billingURL = "billing_url"
        case paymentMethod = "payment_method"
        case iban
        case billingDelivery = "billing_delivery"
        case residenceAddress = "residence_address"
        case supplyAddress = "supply_address"
        case billingAddress = "billing_address"
        case additionalQuestions = "additional_questions"
    }
}

// MARK: - AdditionalQuestion
struct AdditionalQuestion: Codable {
    let q: String?
    let a: [String]?
}

// MARK: - Address
struct Address: Codable {
    let streetAddress, streetNumber, cityName, stateName: String?
    let zipCode: String?
    
    enum CodingKeys: String, CodingKey {
        case streetAddress = "street_address"
        case streetNumber = "street_number"
        case cityName = "city_name"
        case stateName = "state_name"
        case zipCode = "zip_code"
    }
}

// MARK: - Consent
struct Consent: Codable {
    let lastUpdate: String?
    let value: Bool?
    
    enum CodingKeys: String, CodingKey {
        case lastUpdate = "last_update"
        case value
    }
}
