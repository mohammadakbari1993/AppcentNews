//
//  ContentView.swift
//  AppcentNews
//
//  Created by Mohammad Akbari on 5/13/1402 AP.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel : ViewModels.Feeds = ViewModels.Feeds()
    var body: some View {
        VStack {
            List {
                
                
                ForEach(viewModel.filterModeIsActive ? viewModel.filteredItems ?? [] : viewModel.items ?? []) { item in
                    HStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Text(item.title)
                            .padding(8)
                        Spacer()
                    }
                }
                
 
                
            }
        }
        .padding()
        .onAppear{
            viewModel.fetchMovie()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
