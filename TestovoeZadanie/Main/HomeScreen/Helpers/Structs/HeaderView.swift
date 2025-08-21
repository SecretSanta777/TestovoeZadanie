import SwiftUI

struct HeaderView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State var searchText: String = ""
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Педиатры")
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.black)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("Поиск", text: $searchText)
            }
            .padding(10)
            .background(Color.white)
            .cornerRadius(8)
            .padding(.horizontal, 20)
            
            HStack(spacing: 0) {
                Button(action: {
                    withAnimation {
                        viewModel.sortDoctors(by: .price)
                    }
                }) {
                    HStack(spacing: 4) {
                        Text("По цене")
                        if viewModel.currentSort == .price {
                            Image(systemName: viewModel.sortIcon(for: .price))
                                .resizable()
                                .frame(width: 10, height: 10)
                        }
                    }
                    .font(.system(size: 14))
                    .foregroundColor(viewModel.currentSort == .price ? .white : .gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                }
                .background(viewModel.currentSort == .price ? Color.myPink : Color.white)
                
                Button(action: {
                    withAnimation {
                        viewModel.sortDoctors(by: .experience)
                    }
                }) {
                    HStack(spacing: 4) {
                        Text("По стажу")
                        if viewModel.currentSort == .experience {
                            Image(systemName: viewModel.sortIcon(for: .experience))
                                .resizable()
                                .frame(width: 10, height: 10)
                        }
                    }
                    .font(.system(size: 14))
                    .foregroundColor(viewModel.currentSort == .experience ? .white : .gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                }
                .background(viewModel.currentSort == .experience ? Color.myPink : Color.white)
                
                Button(action: {
                    withAnimation {
                        viewModel.sortDoctors(by: .rating)
                    }
                }) {
                    HStack(spacing: 4) {
                        Text("По рейтингу")
                        if viewModel.currentSort == .rating {
                            Image(systemName: viewModel.sortIcon(for: .rating))
                                .resizable()
                                .frame(width: 10, height: 10)
                        }
                    }
                    .font(.system(size: 14))
                    .foregroundColor(viewModel.currentSort == .rating ? .white : .gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                }
                .background(viewModel.currentSort == .rating ? Color.myPink : Color.white)
            }
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 10)
        .background(Color.appGray)
    }
}
