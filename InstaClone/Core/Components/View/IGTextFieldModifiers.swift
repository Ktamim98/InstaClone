//
//  IGTextFieldModifiers.swift
//  InstagramClone
//
//  Created by Tamim Khan on 4/6/23.
//

import SwiftUI

struct IGTextFieldModifiers: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
