import SwiftUI

struct DashboardView: View {
    @State private var scannedText: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                Text("Dashboard")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Calories (in vs out)")
                    .font(.subheadline)
                    .fontWeight(.bold)

                Text("Quick Actions")
                    .font(.subheadline)
                    .fontWeight(.bold)

                HStack(spacing: 12) {
                    NavigationLink(destination: ScannerView(scannedText: $scannedText)) {
                        Text("Scan Label")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: LogMealView()) {
                        Text("Log Meal")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                NavigationLink(destination: MyProgressView()) {
                    Text("Progress")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                if !scannedText.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Scanned Text:")
                            .font(.headline)

                        ScrollView {
                            Text(scannedText)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                        }
                        .frame(maxHeight: 200)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Dashboard")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
