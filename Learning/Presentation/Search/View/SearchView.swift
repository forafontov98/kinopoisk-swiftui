//
//  SearchView.swift
//  Learning
//
//  Created by MacBook on 18.04.2023.
//

import SwiftUI

struct SearchView: View {

    @ObservedObject var output: SearchModel
    @State private var selectedItem: ShortMovieViewModel?

    var body: some View {
        NavigationStack {
            Group {
                switch output.state {
                case let .success(data):
                    List(data) { item in
                        Button(action: {
                            selectedItem = item
                        }, label: {
                            SearchRow(movie: item)
                        })
                    }
                    .sheet(item: $selectedItem) { item in
                        MovieAssembly().build(id: item.movieId)
                    }
                case .loading:
                    ProgressView()
                case let .failure(error):
                    Text(error.title)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Список фильмов")
            .navigationBarTitleDisplayMode(.inline)
        }
        .searchable(text: $output.searchText)
        .onAppear(perform: {
            output.onAppear()
        })
    }
}
