//
//  Views.Feeds.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import SwiftUI
extension Views {
    
    struct Feeds: View {
        
        @StateObject var viewModel : ViewModels.Feeds = ViewModels.Feeds()
        
        @State private var searchFieldText: String = ""
        
        var body: some View {
            
            VStack {
                
                Views.Common.SearchField(text: $searchFieldText, placeHolder: Localization.Feeds.Input.placeHolder.text, onSubmit: {
                    viewModel.refresh()
                })
                    .padding(.top)
                
                Spacer()
                
                if viewModel.isNetworking && (viewModel.items?.isEmpty ?? true) {
                
                    Views.Common.Loading()
                    
                } else {
                    
                    List {
                        
                        if (viewModel.items?.isEmpty ?? true) {
                            Views.Common.EmptyListView(descriptionText: searchFieldText.isEmpty ? (viewModel.alertDescription ?? Localization.Feeds.empty_view_message.text) : Localization.Feeds.empty_view_message.text)
                        } else {
                            ForEach(viewModel.filterModeIsActive ? viewModel.filteredItems ?? [] : viewModel.items ?? []) { item in
                                NavigationLink(destination: Views.FeedDetail(news : item)) {
                                    Views.Feeds.FeedRow(feed: item)
                                        .onAppear{
                                            viewModel.fetchMore(model: item)
                                        }
                                        .frame(maxHeight: 100)
                                        
                                }
                                
                                
                            }
                        }
                        
                        if viewModel.isNetworking {
                        
                            HStack {
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                            
                        }
                        
                    }
                    .listStyle(PlainListStyle())
                }
                
                Spacer()
                
            }
            .onChange(of: searchFieldText) { newValue in
                viewModel.request.searchQuery = newValue
                if newValue.isEmpty {
                    viewModel.refresh()
                }
            }
            .navigationTitle(Localization.Feeds.page_title.text)
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: self.$viewModel.showAlert, content: self.viewModel.getAlert)
            
            
        }
    }
    
}
struct Views_Feeds_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Views.Feeds()
        }
    }
}
