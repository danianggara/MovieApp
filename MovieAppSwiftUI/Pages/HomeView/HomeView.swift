//
//  HomeView.swift
//  MovieAppSwiftUI
//
//  Created by Dani Anggara on 16/08/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    if !viewModel.showLoading {
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 16) {
                                ForEach(viewModel.listMovies, id: \.imdbID) { movie in
                                    NavigationLink(destination: DetailView(movieId: movie.imdbID ?? "")) {
                                        MoviewItemViewCell(movieItem: movie)
                                    }
                                }
                            }
                            .padding(.bottom)
                        }
                    } else {
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
            .padding()
            .refreshable {
                viewModel.getMovies()
            }
            .onAppear {
                viewModel.getMovies()
            }
            .onChange(of: viewModel.search) { _ in
                if !viewModel.search.isEmpty {
                    viewModel.searchMovies()
                } else {
                    viewModel.getMovies()
                }
            }
            .navigationTitle("Movies")
            .searchable(text: $viewModel.search, prompt: "Search movies")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: FavoriteView()) {
                        Image(systemName: "heart.fill")
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    HomeView()
}
