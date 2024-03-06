//
//  FachView.swift
//  Grades_v4
//
//  Created by Jakob Erlebach on 04.03.24.
//

import SwiftUI

struct FachView: View {
    
    var buttoncolor: Color = .red
    @ObservedObject var storage: storageclass
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                Divider()
                HStack{
                    Text("Klassenarbeiten").frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .font(.title)
                        .bold()
                    
                label: do {
                    HStack{
                        Text("-,--")
                            .font(.title2)
                            .foregroundStyle(Color(cgColor: CGColor(red: 0.54902, green: 0.54902, blue: 0.54902, alpha: 1)))
                        
                        Text("Ø").font(.title2)
                            .bold()
                    }.padding(.trailing, 20)
                }
                    
                }
                Group{
                    Notenkasten(note: "1,0", testtyp: .klassenarbeit)
                    Notenkasten(note: "1,25", testtyp: .klassenarbeit)
                    Notenkasten(note: "1,75", testtyp: .klassenarbeit)
                    Notenkasten(note: "1,0", testtyp: .klassenarbeit)
                }
                Divider()
                HStack{
                    Text("HÜ´S").frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .font(.title)
                        .bold()
                    
                label: do {
                    HStack{
                        Text("-,--")
                            .font(.title2)
                            .foregroundStyle(Color(cgColor: CGColor(red: 0.54902, green: 0.54902, blue: 0.54902, alpha: 1)))
                        
                        Text("Ø").font(.title2)
                            .bold()
                    }.padding(.trailing, 20)
                }
                    
                }
                Group{
                    Notenkasten(note: "4,0", testtyp: .hü)
                    Notenkasten(note: "3,25", testtyp: .hü)
                    Notenkasten(note: "2,75", testtyp: .hü)
                    Notenkasten(note: "1,0", testtyp: .hü)
                }
                Divider()
                
                Button("Löschen") {
                    
                }.bold().font(.title3).foregroundColor(buttoncolor).frame(maxWidth: .infinity, alignment: .center)
                
                    
                
                
            }.navigationBarItems(trailing: Button(action: {
                
            }){
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)

                    .foregroundColor(.blue)
            } )
            .navigationBarItems(leading: Button(action: {
                
                }){
                    Button(action: {
                        storage.activeview = .schuljahr
                    }, label: {
                        HStack{
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            
                                .foregroundColor(.blue)
                            
                        Text("Zurück")
                        }
                    })
                    
                    
                } )
            .navigationTitle("Mathe")
            
        }
    }
}

struct FachView_Previews: PreviewProvider {
    static var previews: some View {
        Wrapper()
    }
}

