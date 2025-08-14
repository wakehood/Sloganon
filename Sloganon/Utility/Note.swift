//
//  Note.swift
//  Sloganon Swift Data
//
//  Created by Sylvia Wake-Hood on 6/27/25.
//

import Foundation


struct Note: Identifiable, Codable {
    var id: UUID = UUID()
    var text: String
}
