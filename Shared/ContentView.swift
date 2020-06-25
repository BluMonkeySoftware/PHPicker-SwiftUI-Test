//
//  ContentView.swift
//  Shared
//
//  Created by Steve Marcotte on 6/24/20.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var showingPicker = false    // A Bool State for presenting the sheet
    @State var image: UIImage?          // The State var that will contain the fetched Image
    
    var body: some View {
        
        NavigationView {                // Wrap everthing in a NavigationView for .primaryAction Placement in the Toolbar
            VStack {
                if let image = image {  // Use Swift 5.3's new  if/let syntax to handle the Optional image
                    Image( uiImage: image )
                        .resizable()
                        .aspectRatio( contentMode: .fill )
                } else {
                    noImageView
                }
            }
            .navigationTitle( "PHPicker Demo" )
            .toolbar {
                
                // Place the Add Image button in the primary action location, the trailing NavigationBar item.
                ToolbarItem( placement: .primaryAction ) {
                    Button( action: { showingPicker.toggle( )}) {
                        Label( "Add Image", systemImage: "plus" )
                            .labelStyle( IconOnlyLabelStyle( ))
                    }
                    .accessibility(label: Text("Add an Image"))
                }
            }
            
            // Present the PHPickerView the same way any other sheet is displayed.
            .sheet( isPresented: $showingPicker ) { PHPickerView( image: $image )}
            
        }
    }
     
    /// The View to display before selecting an Image
    var noImageView: some View {
        VStack {
            Spacer( )
            Image( systemName: "photo" )
                .resizable()
                .imageScale(.large)
                .font( .largeTitle )
                .aspectRatio( contentMode: .fit )
                .opacity( 0.42 )                    // Because, 42
                .padding( )
            Spacer( )
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
