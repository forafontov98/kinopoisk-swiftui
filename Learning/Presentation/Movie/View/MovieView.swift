//
//  MovieView.swift
//  Learning
//
//  Created by MacBook on 26.09.2023.
//

import SwiftUI

struct MovieView: View {

    @ObservedObject var output: MovieModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Group {
            switch output.state {
            case let .success(data):
                ScrollView {
                    VStack(alignment: .leading) {
                        ZStack(alignment: .topTrailing) {
                            ZStack {
                                AsyncImage(url: URL(string: data.preview ?? "")) { image in
                                    image.image?.resizable().aspectRatio(contentMode: .fill)
                                }
                                .blur(radius: 30)
                                .scaleEffect(1.2)

                                AsyncImage(url: URL(string: data.preview ?? "")) { image in
                                    image.image?.resizable().aspectRatio(contentMode: .fit)
                                }
                                .frame(height: 400)
                            }
                            .frame(height: 400)
                            .clipped()

                            Button {
                                self.dismiss()
                            } label: {
                                Image(systemName: "xmark.circle.fill").resizable().foregroundColor(.white)
                            }
                            .frame(width: 26, height: 26)
                            .padding(16)
                        }
                        .frame(maxWidth: .infinity)

                        Text(data.title ?? "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 26))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.all, 16)

                        VStack(spacing: 8) {
                            ForEach(data.options) { option in
                                HStack {
                                    Text(option.name)
                                        .frame(alignment: .leading)
                                        .font(.system(size: 16))
                                        .fontWeight(.medium)
                                        .foregroundColor(.gray)
                                        .padding(.leading, 16)
                                        .multilineTextAlignment(.leading)
                                    Text(option.value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                        .font(.system(size: 16))
                                        .fontWeight(.regular)
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 16)
                                        .multilineTextAlignment(.trailing)
                                }
                            }
                        }

                        if let description = data.description {
                            Spacer(minLength: 24)

                            Text("Описание")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding([.leading, .trailing], 16)
                            Spacer(minLength: 12)
                            Text(description)
                                .frame(alignment: .leading)
                                .font(.system(size: 16))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                                .padding([.leading, .trailing], 16)
                                .multilineTextAlignment(.leading)
                        }

                        if let actors = data.actors, !actors.isEmpty {
                            Spacer(minLength: 24)

                            Text("Актеры")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding([.leading, .trailing], 16)
                            Spacer(minLength: 12)
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 8) {
                                    ForEach(0..<actors.count, id: \.self) { index in
                                        Text(actors[index])
                                            .font(.system(size: 16))
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                            .padding([.leading, .trailing], 16)
                                            .padding([.top, .bottom], 32)
                                            .background(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .fill(Color.gray.opacity(0.1))
                                            )
                                    }
                                }
                                .padding([.leading, .trailing], 16)
                            }
                        }
                    }
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
        }.onAppear {
            output.onAppear()
        }
    }
}
