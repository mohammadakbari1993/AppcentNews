//
//  Views.FavoriteList.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/14/1402 AP.
//

import SwiftUI
extension Views {
    
    struct FavoriteList : View {
        
        @StateObject var viewModel : ViewModels.FavoriteList = ViewModels.FavoriteList()
        
        
        var body: some View {
            
            VStack {
                
                List {
                    if (viewModel.items?.isEmpty ?? true) {
                        Views.Common.EmptyListView(descriptionText: Localization.FavoriteList.empty_view_message.text)
                    } else {
                        ForEach(viewModel.filterModeIsActive ? viewModel.filteredItems ?? [] : viewModel.items ?? []) { item in
                            NavigationLink(destination: Views.FeedDetail(news : item)) {
                                Views.Feeds.FeedRow(feed: item)
                                    .frame(maxHeight: 100)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
                
                Spacer()
                
            }
            .onAppear{
                viewModel.refresh()
            }
            .navigationTitle(Localization.FavoriteList.page_title.text)
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: self.$viewModel.showAlert, content: self.viewModel.getAlert)
            
            
        }
    }
    
}
struct Views_FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Views.FavoriteList()
        }
    }
}
