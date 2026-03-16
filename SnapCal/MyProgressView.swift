import SwiftUI

struct MyProgressView: View {
    @State private var scannedText = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                Text("Progress")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Today's Summary")
                    .font(.subheadline)
                    .fontWeight(.bold)

                Text("Quick Actions")
                    .font(.subheadline)
                    .fontWeight(.bold)

                HStack{
                    NavigationLink(destination: ScannerView(scannedText: $scannedText)) {
                        Text("Scan Label")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    if !scannedText.isEmpty {
                        Text("Scanned Text:")
                            .font(.headline)
                        
                        Text(scannedText)
                            .padding()
                    }
                    
                    NavigationLink(destination: LogMealView()) {
                        Text("Log Meal")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: ProgressView()) {
                        Text("Progress")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                Spacer()
            }
            .padding()
        }
    }
}



struct MyProgressView_Previews: PreviewProvider {
    static var previews: some View {
        MyProgressView()
    }
}
