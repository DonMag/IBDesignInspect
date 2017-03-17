//
//  Other.swift
//  SW3IBDesignables
//
//  Created by Don Mag on 3/17/17.
//  Copyright © 2017 DonMag. All rights reserved.
//

import UIKit

@IBDesignable
class Other: UIButton {

	public enum ImagePosition: Int {
		case BottomLeft = 1, BottomCenter, BottomRight, CenterLeft, CenterRight = 6, TopLeft, TopCenter, TopRight
		
		public enum HorizontalPosition {
			case Left, Center, Right
		}
		public var horizontalPosition: HorizontalPosition {
			switch self {
			case .TopLeft, .CenterLeft, .BottomLeft: return .Left
			case .TopCenter, .BottomCenter: return .Center
			case .TopRight, .CenterRight, .BottomRight: return .Right
			}
		}
		
		public enum VerticalPosition {
			case Top, Center, Bottom
		}
		public var verticalPosition: VerticalPosition {
			switch self {
			case .TopLeft, .TopCenter, .TopRight: return .Top
			case .CenterLeft, .CenterRight: return .Center
			case .BottomLeft, .BottomCenter, .BottomRight: return .Bottom
			}
		}
	}
	public var imagePosition: ImagePosition = .CenterLeft {
		didSet { updateEdgeInsets() }
	}
	@IBInspectable public var imagePositionInteger: Int {
		get { return imagePosition.rawValue }
		set { imagePosition = ImagePosition(rawValue: newValue) ?? .CenterLeft }
	}
	
	@IBInspectable public var contentGap: CGSize = .zero {
		didSet { updateEdgeInsets() }
	}
	
	private var _contentEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero {
		didSet { updateEdgeInsets() }
	}
	override public var contentEdgeInsets: UIEdgeInsets {
		get { return super.contentEdgeInsets }
		set { _contentEdgeInsets = newValue }
	}
	
	private func updateEdgeInsets() {
		let initialEdgeInsets = contentEdgeInsets
		if let image = currentImage,
			let label = titleLabel {
			let imageSize = image.size
			let labelSize = label.intrinsicContentSize
			
			let horizontalMultiplier = { () -> CGFloat in
				switch self.imagePosition.horizontalPosition {
				case .Left:		return -0.5
				case .Center:	return +0.0
				case .Right:	return +0.5
				}
			}()
			let imageXOffset = +(labelSize.width * (horizontalMultiplier + 0.5) + contentGap.width * horizontalMultiplier)
			let labelXOffset = -(imageSize.width * (horizontalMultiplier + 0.5) + contentGap.width * horizontalMultiplier)
			
			let verticalMultiplier = { () -> CGFloat in
				switch self.imagePosition.verticalPosition {
				case .Top:		return -0.5
				case .Center:	return +0.0
				case .Bottom:	return +0.5
				}
			}()
			let imageYOffset = +(labelSize.height * verticalMultiplier + contentGap.height * verticalMultiplier)
			let labelYOffset = -(imageSize.height * verticalMultiplier + contentGap.height * verticalMultiplier)
			
			super.imageEdgeInsets = UIEdgeInsetsMake(imageYOffset, imageXOffset, -imageYOffset, -imageXOffset)
			super.titleEdgeInsets = UIEdgeInsetsMake(labelYOffset, labelXOffset, -labelYOffset, -labelXOffset)
			
			let contentWidthInset = { () -> CGFloat in
				switch self.imagePosition.horizontalPosition {
				case .Center: return min(imageSize.width, labelSize.width)
				default: return -self.contentGap.width
				}
			}()
			let contentHeightInset = { () -> CGFloat in
				switch self.imagePosition.verticalPosition {
				case .Center: return 0
				default: return -(min(imageSize.height, labelSize.height) + self.contentGap.height)
				}
			}()
			let t = -contentHeightInset / 2 + _contentEdgeInsets.top
			let l = -contentWidthInset / 2 + _contentEdgeInsets.left
			let b = -contentHeightInset / 2 + _contentEdgeInsets.bottom
			let r = -contentWidthInset / 2 + _contentEdgeInsets.right

			super.contentEdgeInsets = UIEdgeInsets(top: t, left: l, bottom: b, right: r)
			
		}

		let tt = initialEdgeInsets.top
		
		let t = _contentEdgeInsets.top + initialEdgeInsets.top
		let l = _contentEdgeInsets.left + initialEdgeInsets.left
		let b = _contentEdgeInsets.bottom + initialEdgeInsets.bottom
		let r = _contentEdgeInsets.right + initialEdgeInsets.right

		super.contentEdgeInsets = UIEdgeInsets(top: t, left: l, bottom: b, right: r)
//		super.contentEdgeInsets = UIEdgeInsets(top: 20, left: 16, bottom: 12, right: 16)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		commonInit()
	}

	func commonInit() {
		_contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)
		updateEdgeInsets()
//		self.invalidateIntrinsicContentSize()
	}

//	required public init(coder aDecoder: NSCoder) {
//		super.init(coder: aDecoder)
////		_contentEdgeInsets = contentEdgeInsets
//		_contentEdgeInsets = UIEdgeInsetsMake(8, 16, 8, 16)
//	}

}
