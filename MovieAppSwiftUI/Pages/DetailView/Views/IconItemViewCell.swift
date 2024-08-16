//
//  IconItemViewCell.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import SwiftUI

struct IconItemViewCell: View {
    let iconName: String
    let text: String

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 15)

            Text(text)
                .font(.footnote)
        }
        .foregroundColor(Color.black)
    }
}

#Preview {
    IconItemViewCell(iconName: "calendar", text: "12 August 1990")
}
