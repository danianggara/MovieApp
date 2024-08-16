//
//  ToastView.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import SwiftUI

struct ToastView: ViewModifier {
    let message: String
    let isShowing: Bool
    let duration: TimeInterval

    @State private var showToast: Bool = false

    func body(content: Content) -> some View {
        ZStack {
            content
            
            if showToast {
                VStack {
                    Spacer()
                    Text(message)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.bottom, 50)
                }
                .transition(.move(edge: .bottom))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation {
                            showToast = false
                        }
                    }
                }
            }
        }
        .onChange(of: isShowing) { newValue in
            if newValue {
                withAnimation {
                    showToast = true
                }
            }
        }
    }
}
