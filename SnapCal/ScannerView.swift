import SwiftUI
import UIKit

struct ScannerView: View {
    @Binding var scannedText: String

    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false
    @State private var isRecognizing = false

    private let textRecognizer = TextRecognizer()

    var body: some View {
        VStack(spacing: 20) {
            Text("Scan Label")
                .font(.title)
                .fontWeight(.bold)

            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(12)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 250)
                    .overlay(
                        Text("No image selected")
                            .foregroundColor(.gray)
                    )
            }

            Button("Choose Photo") {
                showImagePicker = true
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            Button("Recognize Text") {
                guard let image = selectedImage else { return }

                isRecognizing = true
                textRecognizer.recognizeText(from: image) { text in
                    scannedText = text
                    isRecognizing = false
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(selectedImage == nil ? Color.gray : Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .disabled(selectedImage == nil)

            if isRecognizing {
                ProgressView("Recognizing...")
            }

            Spacer()
        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannedText: .constant(""))
    }
}
