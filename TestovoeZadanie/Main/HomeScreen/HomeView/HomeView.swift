import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    @Binding var path: [SelectPage]
    
    var body: some View {
        ZStack(alignment: .top) {
            HeaderView(viewModel: homeViewModel)
            ScrollView {
                if let doctors = homeViewModel.doctors?.data?.users {
                    ForEach(doctors, id: \.self) { item in
                        CardView(path: $path, doctor: item)
                    }
                    .padding(.horizontal, 15)
                    .padding(.bottom, 15)
                }
            }
            .padding(.top, 150)
        }
        .background(.appGray)
        .onAppear {
            homeViewModel.getDoctors()
            print(homeViewModel.doctors?.data?.users?.first?.firstName)
        }
    }
}
