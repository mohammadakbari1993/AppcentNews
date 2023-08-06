//
//  Views.Feeds.FeedRow.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import SwiftUI
extension Views.Feeds {
    struct FeedRow: View {
        @State var feed : Service.Model.Feeds.Feed
        var body: some View {
            HStack{
                Views.Common.ImageHolder(image: feed.urlToImage)
                    .frame(width: 80, height: 80)
                    .padding(.trailing)
                VStack {
                    HStack {
                        
                        Text(feed.title)
                            .font(.headline)
                            .lineLimit(2)
                            .padding(.bottom, 4)
                        
                        Spacer()
                        
                        Text(feed.displayedPublishAt)
                            .font(.subheadline)
                            .lineLimit(2)
                            .padding(.bottom, 4)
                        
                    }
                    Text(feed.description)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.gray)
                }
                
            }.padding([.bottom], 8)

        }
    }
}
struct Views_Feeds_FeedRow_Previews: PreviewProvider {
    static var previews: some View {
        Views.Feeds.FeedRow(feed: .sample)
    }
}
