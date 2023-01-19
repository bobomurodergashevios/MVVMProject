//
//  String+EXT.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 21/12/22.
//

import Foundation
import UIKit

public extension String {
    
    var isNotEmpty: Bool { !isEmpty }
    
//    var localized: String {
//        let path = Bundle.main.path(forResource: AppPreferences.shared.language.code, ofType: "lproj")
//        let bundle = Bundle(path: path!)
//        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
//    }
    
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
    
    var removedPlusPrefix: String {
        if self.hasPrefix("+") {
            return String(self [self.index(after: self.startIndex)..<self.endIndex] )
        } else {
            return self
        }
    }
    
    var addPlusPrefix: String {
        if self.hasPrefix("+") {
            return self
        } else {
            return ("+" + self)
        }
    }
    
    var addCountryCode: String {
        let hasPlusPrefix = self.hasPrefix("+")
        if hasPlusPrefix, self.hasPrefix("+998") {
            return self
        } else if self.hasPrefix("998"), self.count == 12 {
            return self.addPlusPrefix
        }
        else {
            return ("+998" + self)
        }
    }
    
    var withoutWhiteSpace: String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    var withoutNuqta : String {
        return self.replacingOccurrences(of: ".", with: "")
    }
    
    var securedPhone: String {
        guard !self.contains("*") else { return self }
        let phone = self.makeUZPhoneFormat.withoutWhiteSpace
        let startPattern = "+99800"
        let lower = phone.index(phone.startIndex, offsetBy: startPattern.count)
        let upper = phone.index(lower, offsetBy: 5)
        let range = Range<String.Index>(uncheckedBounds: (lower, upper))
        return phone.replacingCharacters(in: range, with: "*****")
    }
    
    var secureCardNumber: String {
        guard self.count == 16 else { return self.secureWalletNumber }
        let cardNumber = self.makeReadableCardNumber.withoutWhiteSpace
        let startPattern = "000000"
        let lower = cardNumber.index(cardNumber.startIndex, offsetBy: startPattern.count)
        let upper = cardNumber.index(lower, offsetBy: 6)
        let range = Range<String.Index>(uncheckedBounds: (lower, upper))
        return cardNumber.replacingCharacters(in: range, with: "******").makeReadableCardNumber
    }
    
    var secureWalletNumber: String {
        guard self.hasPrefix("NVC-") else { return self }
        let walletNumber = self.withoutWhiteSpace
        let startPattern = "NVC-"
        let lower = walletNumber.index(walletNumber.startIndex, offsetBy: startPattern.count)
        let upper = walletNumber.index(lower, offsetBy: 4)
        let range = Range<String.Index>(uncheckedBounds: (lower, upper))
        return walletNumber.replacingCharacters(in: range, with: "****").makeReadableCardNumber
    }
    
    var makeUZPhoneFormat: String {
        var formattedPhone = String()
        for (index, element) in self.addCountryCode.enumerated() {
            formattedPhone += String(element)
            formattedPhone += ([3, 5, 8, 10].contains(index)) ? " " : ""
        }
        return formattedPhone
    }
    
    var makeReadableAmount: String {
        let price: String
        let storedReminder: String
        var seperator = ""
        
        if self.contains(".") {
            let separated = self.split(separator: ".")
            price = String(separated[0])
            storedReminder = separated.count > 1 ? String(separated[1]) : ""
            seperator = "."
        } else {
            price = self
            storedReminder = String.init()
        }
        
        guard price.count > 3 else { return self }
        
        var count = 0
        var amount = String.init()
        let reversedPrice = String(price.reversed())
        (0..<reversedPrice.count).forEach {
            count += 1
            amount += String(reversedPrice[price.index(reversedPrice.startIndex, offsetBy: $0)])
            
            if count == 3 && $0 != reversedPrice.count-1 {
                count = 0
                amount += " "
            }
        }
        
        let readableAmount = String(amount.reversed())
        return (storedReminder.isEmpty) ? readableAmount + seperator : "\(readableAmount).\(storedReminder)"
    }
    
    var makeReadableCardNumber: String {
        var formattedCardNumber = String()
        for (index, character) in self.enumerated() {
            formattedCardNumber += String(character)
            formattedCardNumber += ([3, 7, 11].contains(index)) ? " " : ""
        }
        return formattedCardNumber
    }
    
    var maskedCardNumber: String {
        if self.count == 16 {
            let start = index(startIndex, offsetBy: 6)
            let end = index(startIndex, offsetBy: count - 4)
            let range = Range(uncheckedBounds: (start, end))
            return replacingCharacters(in: range, with: "**")
        }
        return self
    }
    
    var makeReadableAccountNumber: String {
        let accountNumber = self.withoutWhiteSpace
        let lower = accountNumber.index(accountNumber.startIndex, offsetBy: 5)
        let upper = accountNumber.index(lower, offsetBy: accountNumber.count - 8)
        let range = Range<String.Index>(uncheckedBounds: (lower, upper))
        return accountNumber.replacingCharacters(in: range, with: "••")
    }
    
    var makeReadableExpireDateForCard: String {
        var formattedExpireDate = String()
        for (index, character) in self.enumerated() {
            formattedExpireDate += String(character)
            formattedExpireDate += ([1].contains(index)) ? " / " : ""
        }
        return formattedExpireDate
    }
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: [.usesLineFragmentOrigin, .usesFontLeading],
                                            attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    func widthWithConstrainedHeight(_ height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    
    func removeSpecialCharsFromString(text: String) -> String {
        let okayChars : Set<Character> =
        Set("0123456789*")
        return String(text.filter {okayChars.contains($0) })
    }
    
    func modifySummery() -> String {
        let creditCardString: String = self
        var trimmedString = removeSpecialCharsFromString(text: creditCardString.components(separatedBy: .whitespaces).joined())
        
        if trimmedString.count > 0{
            if nil == Double(trimmedString){
                trimmedString = ""
            }
        }
        let arrOfCharacters = Array(trimmedString)
        var modifiedCreditCardString = ""
        
        if(arrOfCharacters.count > 0)
        {
            
            for i in (0 ... (arrOfCharacters.count - 1)).reversed()
            {
                modifiedCreditCardString.append(arrOfCharacters[i])
            }
            
            let arrOfCharacterss = Array(modifiedCreditCardString)
            modifiedCreditCardString = ""
            for i in (0 ... (arrOfCharacterss.count - 1)){
                modifiedCreditCardString.append(arrOfCharacterss[i])
                
                if(findTwoPointSum(i: (i+1)) && i+1 != arrOfCharacterss.count)
                {
                    modifiedCreditCardString.append(" ")
                }
            }
            
            let arrOfCharactersss = Array(modifiedCreditCardString)
            modifiedCreditCardString = ""
            for i in (0 ... (arrOfCharactersss.count - 1)).reversed()
            {
                modifiedCreditCardString.append(arrOfCharactersss[i])
            }
        }
        return modifiedCreditCardString
    }
    
    func findTwoPointSum(i: Int) -> Bool{
        
        let trimarray = [3,6,9,12,15]
        
        for item in trimarray {
            if item == i {
                return true
            }
        }
        
        return false
    }
    
    mutating func insertedSeparator(_ separatorString: String, atEvery n: Int) {
        self = insertSeparator(separatorString, atEvery: n)
    }
    
    func insertSeparator(_ separatorString: String, atEvery n: Int) -> String {
        guard 0 < n else { return self }
        return self.enumerated().map({String($0.element) + (($0.offset != self.count - 1 && $0.offset % n ==  n - 1) ? "\(separatorString)" : "")}).joined()
    }
    
    func transliterate(mode: TransliterateMode) -> String {
        var newOsetx = self
        
        let upperReplacement = [ ("А", "A"), ("Б", "B"), ("В", "V"), ("Г", "G"), ("Д", "D"), ("Е", "E"), ("Ё", "YO"), ("Ж", "ZH"), ("З", "Z"), ("И", "I"), ("Й", "Y"), ("К", "K"), ("Л", "L"), ("М", "M"), ("Н", "N"), ("О", "O"), ("П", "P"), ("Р", "R"), ("С", "S"), ("Т", "T"), ("У", "U"), ("Ф", "F"), ("Х", "KH"), ("Ц", "TS"), ("Ч", "CH"), ("Ш", "SH"), ("Щ", "SHCH"), ("Ъ", "\""), ("Ы", "Y"), ("Ь", "'"), ("Э", "E"), ("Ю", "YU"), ("Я", "YA")]
        
        let lowerReplacement = [ ("а", "а"), ("б", "b"), ("в", "v"), ("г", "g"), ("д", "d"), ("е", "e"), ("ё", "yo"), ("ж", "zh"), ("з", "z"), ("и", "i"), ("й", "y"), ("к", "k"), ("л", "l"), ("м", "m"), ("н", "n"), ("о", "o"), ("п", "p"), ("р", "r"), ("с", "s"), ("т", "t"), ("у", "u"), ("ф", "f"), ("х", "kh"), ("ц", "ts"), ("ч", "ch"), ("ш", "sh"), ("щ", "shch"), ("ъ", "\""), ("ы", "y"), ("ь", "'"), ("э", "e"), ("ю", "yu"), ("я", "ya")]
        
        if mode == .upperCased {
            for (searchString, replacement) in upperReplacement {
                newOsetx = newOsetx.replacingOccurrences(of: searchString, with: replacement)
            }
            return newOsetx
        } else {
            for (searchString, replacement) in lowerReplacement {
                newOsetx = newOsetx.replacingOccurrences(of: searchString, with: replacement)
            }
            return newOsetx
        }
    }
    
    func getDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return Date()
        }
    }
    
    func isValidEmail() -> Bool {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
        return testEmail.evaluate(with: self)
    }
    
    func isValidPhone() -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{12}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    
    var withoutPunctuations: String {
        return self.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

extension Optional where Wrapped: Collection {
    var isEmptyOrNil: Bool {
        self?.isEmpty ?? true
    }
}

public extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        switch self {
        case .some(let value):
            return value.isEmpty
        case .none:
            return true
        }
    }
}

//public func makeDateAttrString(firstString: String, secondString: String) -> NSMutableAttributedString {
//    let modelDate = "\(firstString) \(secondString)"
//    let dateString = firstString
//    let wordRange = (modelDate as NSString).range(of: dateString)
//    let attributedString = NSMutableAttributedString(string: modelDate, attributes: [NSAttributedString.Key.font : UIFont.manropeBold(ofSize: 12)])
//    attributedString.setAttributes([NSAttributedString.Key.font : UIFont.manropeMedium(ofSize: 12), NSAttributedString.Key.foregroundColor : UIColor(hex: "#99A3B3")], range: wordRange)
//    return attributedString
//}

public enum TransliterateMode{
    case upperCased
    case lowerCased
}
