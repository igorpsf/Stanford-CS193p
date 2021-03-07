//
//  Array+Only.swift
//  Memorize
//
//  Created by Igor Postnikov on 3/7/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
