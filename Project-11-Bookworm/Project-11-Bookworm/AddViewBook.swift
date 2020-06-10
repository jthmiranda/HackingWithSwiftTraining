//
//  AddViewBook.swift
//  Project-11-Bookworm
//
//  Created by Jonathan Miranda on 6/5/20.
//  Copyright © 2020 Jonathan Miranda. All rights reserved.
//

import SwiftUI

struct AddViewBook: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Category"
    @State private var review = ""
    @State private var date = Date()
    
    let genres = ["Fantasy", "Horrors", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of  book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text("\(genre)")
                        }
                    }
                }
                
                Section {
                    RatingView(rating: $rating)
                    TextField("Write a review", text: $review)
                    DatePicker("Date of resealse", selection: $date, in: ...Date(), displayedComponents: .date)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: self.moc)
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        newBook.genre = self.genre
                        newBook.review = self.review
                        newBook.date = self.date
                        
                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        .navigationBarTitle("Add Book")
        }
    }
}

struct AddViewBook_Previews: PreviewProvider {
    static var previews: some View {
        AddViewBook()
    }
}
