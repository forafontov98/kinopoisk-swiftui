//
//  SearchRow.swift
//  Learning
//
//  Created by MacBook on 18.04.2023.
//

import SwiftUI
import UIKit

struct SearchRow: View {

    var movie: ShortMovieViewModel

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: movie.poster ?? ""), transaction: .init(animation: .linear)) { image in
                image.image?.resizable()
            }
            .frame(width: 40, height: 40)
            .aspectRatio(contentMode: .fill)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            VStack(alignment: .leading, spacing: 2) {
                if let title = movie.title {
                    Text(title)
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                }
                if let year = movie.year {
                    Text(year)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                }
            }
        }
        .listRowInsets(.init(top: 12, leading: 16, bottom: 12, trailing: 16))
    }
}
