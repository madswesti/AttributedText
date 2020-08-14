import SwiftUI

struct UITextViewWrapper: UIViewRepresentable {
	
	let attributedText: NSAttributedString
	
    @Binding private var calculatedHeight: CGFloat
	
	init(_ attributedText: NSAttributedString, calculatedHeight: Binding<CGFloat>) {
		self.attributedText = attributedText
		self._calculatedHeight = calculatedHeight
	}
	
	func makeUIView(context: Context) -> UITextView {
		let textView = UITextView()
		
		textView.textContainer.lineFragmentPadding = 0
		textView.textContainerInset = .zero
		textView.backgroundColor = .clear
		textView.isEditable = false
		textView.isScrollEnabled = false
		textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
		
		return textView
	}
	
	func updateUIView(_ textView: UITextView, context: Context) {
		textView.attributedText = attributedText
		textView.font = .preferredFont(forTextStyle: .body)
		
		//Calculate height
		let targetSize = CGSize(width: textView.frame.width, height: UIView.layoutFittingCompressedSize.height)
		let newHeight = textView.systemLayoutSizeFitting(targetSize).height
		guard $calculatedHeight.wrappedValue != newHeight else { return }
		
		// Avoids the "Modifying state during view update, this will cause undefined behavior." error
		DispatchQueue.main.async {
			self.$calculatedHeight.wrappedValue = newHeight
		}
	}
}

