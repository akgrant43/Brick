Class {
	#name : #BrPager,
	#superclass : #BlElement,
	#category : 'Brick-Pager - UI'
}

{ #category : #'api - adding / removing' }
BrPager >> addPage: aContentElement [	
	self viewModel addPage: aContentElement viewModel
]

{ #category : #testing }
BrPager >> hasPageAfter: aPageElement [
	^ self viewModel hasPageAfter: aPageElement viewModel
]

{ #category : #initialization }
BrPager >> initialize [
	super initialize.
	
	self look: BrPagerScrollbarLook new + BrPagerLook new + BrLayoutLook linearVertical.
	self viewModel: BrPagerModel new
]

{ #category : #accessing }
BrPager >> pageAfter: aBlElement ifFound: aFoundBlock ifNone: aNoneBlock [ 
	self viewModel 
		pageAfter: aBlElement viewModel 
		ifFound: aFoundBlock 
		ifNone: aNoneBlock 
]

{ #category : #'api - accessing' }
BrPager >> pages [
	^ self viewModel pages
]

{ #category : #'api - adding / removing' }
BrPager >> removePage: aContentElement [	
	self viewModel removePage: aContentElement viewModel
]

{ #category : #'api - adding / removing' }
BrPager >> removePagesAfter: aPageElement [	
	self viewModel removePagesAfter: aPageElement viewModel
]

{ #category : #'api - scrolling' }
BrPager >> scrollTo: aPageIndex [
	self dispatchEvent: (BrPagerScrollWish new
		pageIndex: aPageIndex;
		isSmooth: false)
]

{ #category : #'api - scrolling' }
BrPager >> scrollToLast [
	self scrollTo: self pages size
]

{ #category : #'api - scrolling' }
BrPager >> smoothScrollTo: aPageIndex [
	self dispatchEvent: (BrPagerScrollWish new
		pageIndex: aPageIndex;
		isSmooth: true)
]

{ #category : #'api - scrolling' }
BrPager >> smoothScrollToLast [
	self smoothScrollTo: self pages size
]
