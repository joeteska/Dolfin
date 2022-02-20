//
//  emojiView.swift
//  Dolfin
//
//  Created by Josef Teska on 09.02.2022.
//

import SwiftUI

struct emojiView: View {
    
    var emoji : String
    var isSelected : Bool
    
    var body: some View {
        Text(emoji)
            .font(isSelected ? .system(size: 120) : .system(size: 45))
    }
}

