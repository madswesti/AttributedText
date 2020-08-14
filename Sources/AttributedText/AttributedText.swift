import SwiftUI

public struct AttributedText: View {
	
	public let content: NSAttributedString
	
	@State private var height: CGFloat = .infinity
	
	public var body: some View {
		UITextViewWrapper(content, calculatedHeight: $height)
			.frame(maxHeight: height)
	}
	
	public init(_ content: NSAttributedString) {
		self.content = content
	}
}
