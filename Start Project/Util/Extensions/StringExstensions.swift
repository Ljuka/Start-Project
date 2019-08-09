//
//  StringExstensions.swift
//  remoney2-ios-shops
//
//  Created by Ljubo Maricevic on 06/05/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation


extension String {
    func convertDateFormater(format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = format
        return  dateFormatter.string(from: date!)
    }
    func convertEuropeDateFormater(format: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = format
        return  dateFormatter.string(from: date!)
    }
}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
