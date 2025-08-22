import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    @Binding var path: [SelectPage]
    
    var body: some View {
        ZStack(alignment: .top) {
            HeaderView(viewModel: homeViewModel)
            ScrollView {
                
                ForEach(homeViewModel.filterDoctors, id: \.self) { item in
                    CardView(path: $path, doctor: item)
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 15)
                
                if homeViewModel.filterDoctors.isEmpty && !homeViewModel.searchText.isEmpty {
                    Text("Докторы не найдены")
                        .foregroundStyle(.gray)
                }
            }
            .padding(.top, 150)
        }
        .background(.appGray)
        .ignoresSafeArea(.keyboard)
        .onAppear {
            homeViewModel.getDoctors()
            print(homeViewModel.doctors?.data?.users?.first?.firstName)
        }
    }
}
