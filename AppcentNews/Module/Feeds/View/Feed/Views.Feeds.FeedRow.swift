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
       
                VStack {
                    Text(feed.author)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(5)
                        .padding(.bottom, 4)
                    Text(feed.title)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.gray)
                }.padding(.bottom, 8)

        }
    }
}
struct Views_Feeds_FeedRow_Previews: PreviewProvider {
    static var previews: some View {
        Views.Feeds.FeedRow(feed: .sample)
    }
}
