//
//  DetailView.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel = DetailViewModel()

    var movieId: String

    var body: some View {
        VStack {
            ZStack {
                if !viewModel.showLoading {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 20) {
                            HStack(alignment: .top, spacing: 12) {
                                AsyncImage(url: URL(string: viewModel.detailMovie.poster ?? "")) { image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .scaledToFit()
                                .frame(maxWidth: 150)
                                .cornerRadius(10)
                                
                                VStack(alignment: .leading, spacing: 16) {
                                    VStack(alignment: .leading, spacing: 9) {
                                        Text(viewModel.detailMovie.title ?? "")
                                            .font(.headline.weight(.semibold))
                                            .multilineTextAlignment(.leading)
                                        
                                        Text(viewModel.detailMovie.genre ?? "")
                                            .font(.footnote)
                                            .multilineTextAlignment(.leading)
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        IconItemViewCell(iconName: "calendar", text: viewModel.detailMovie.released ?? "")
                                        IconItemViewCell(iconName: "clock.badge", text: viewModel.detailMovie.runtime ?? "")
                                        IconItemViewCell(iconName: "star.fill", text: viewModel.detailMovie.imdbRating ?? "")
                                    }
                                    
                                    Button {
                                        viewModel.saveToFavorite()
                                    } label: {
                                        HStack {
                                            Image(systemName: "heart.fill")
                                                .foregroundColor(.white)
                                            
                                            Text("Set as Favorite")
                                                .font(.footnote.weight(.semibold))
                                                .foregroundColor(.white)
                                        }
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 8)
                                        .background(Color.blue)
                                        .cornerRadius(7)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            VStack(alignment: .leading, spacing: 14) {
                                Text(viewModel.detailMovie.plot ?? "")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.leading)
                                
                                HStack(alignment: .top) {
                                    Text("Director")
                                        .frame(width: 70, alignment: .leading)
                                    
                                    Spacer()
                                    
                                    Text(viewModel.detailMovie.director ?? "")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .font(.subheadline.weight(.semibold))
                                
                                HStack(alignment: .top) {
                                    Text("Actors")
                                        .frame(width: 70, alignment: .leading)
                                    
                                    Spacer()
                                    
                                    Text(viewModel.detailMovie.actors ?? "")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .font(.subheadline.weight(.semibold))
                            }
                        }
                    }
                } else {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .padding()
        .toast(message: viewModel.toastMessage, isShowing: viewModel.showToast)
        .navigationTitle(viewModel.detailMovie.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getDetailMovie(movieId: movieId)
        }
    }
}

#Preview {
    DetailView(movieId: "tt0458339")
}
