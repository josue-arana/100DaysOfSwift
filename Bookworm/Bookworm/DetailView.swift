//
//  DetailView.swift
//  Bookworm
//
//  Created by Josue on 6/8/22.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Unknown")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "UNKNOWN")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            HStack {
                Text(book.date ?? Date.now , style: .date)
                    .padding()
                Spacer()
                Text("by: \(book.author ?? "Unknown Author")" )
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                
            }
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.title2)
                .padding(.bottom)
            
            VStack(alignment: .leading) {
                Text("Review:")
                Text(book.review ?? "No Review")
                    .padding()
            }
            
            
            
            
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Book?", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
    }
    
    func deleteBook(){
        moc.delete(book)
        
         try? moc.save()
        dismiss()
    }
}

