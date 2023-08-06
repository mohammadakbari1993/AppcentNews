//
//  Views.FeedDetail.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import Foundation
import SwiftUI
import FirebaseAnalytics

extension Views {
    
    struct FeedDetail: View {
        
        @StateObject var viewModel : ViewModels.FeedDetail
        
        @State private var searchFieldText: String = ""
        
        init(news : Service.Model.Feeds.Feed) {
            _viewModel = StateObject(wrappedValue: ViewModels.FeedDetail(feed: news))
        }
        
        var body: some View {
            
            VStack {
                if let url = URL(string: viewModel.item?.url ?? "") {
                    NavigationLink(destination: Views.Common.WebView(url: url)
                        .edgesIgnoringSafeArea(.all), isActive: $viewModel.showWebView) { EmptyView() }
                }
                ScrollView {
                    Views.Common.ImageHolder(image: viewModel.item?.urlToImage ?? "")
                        .padding()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    
                    HStack {
                        Text(viewModel.item?.title ?? "")
                            .font(.title2)
                            .padding([.bottom,.horizontal],8)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Text(viewModel.item?.description ?? "")
                            .font(.footnote)
                            .lineLimit(10)
                            .padding([.bottom,.horizontal],8)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Label(viewModel.item?.author ?? "", systemImage: "pencil.and.outline")
                            .foregroundColor(.gray)
                            .font(.footnote)
                        Spacer()
                        Label(viewModel.item?.displayedPublishAt ?? "", systemImage: "calendar")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }.padding(.horizontal,16)
                    Divider()
                    HStack {
                        Text(viewModel.item?.content ?? "")
                            .font(.subheadline)
                            .lineLimit(100)
                            .multilineTextAlignment(.leading)
                            .padding(16)
                        Spacer()
                    }
                }
                Views.Common.AppcentButton(title: Localization.FeedDetail.Button.news_source.text, action: {
                    AnaliticsEvents.went_to_source(news: self.viewModel.item ?? .sample).sendEvent()
                    self.viewModel.showWebView = true
                })
                .padding([.bottom, .horizontal])
            }
            .navigationTitle(Localization.FeedDetail.page_title.text)
            .navigationBarItems(trailing: Button(action: {
                //TODO: Handle Your action
            }, label: {
                HStack {
                    
                    Button {
                        viewModel.setFavorite()
                    } label: {
                        Image(systemName: (self.viewModel.isFavorite) ? "star.fill" : "star")
                    }
                    
                    if let link = URL(string: self.viewModel.item?.url ?? "") {
                        ShareLink(item: link, message: Text("Read A News Here!"))
                    }

                }
            }))
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: self.$viewModel.showAlert, content: self.viewModel.getAlert)
            
            
        }
    }
    
}

struct Views_FeedDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Views.FeedDetail(news: .sample)
        }
    }
}
