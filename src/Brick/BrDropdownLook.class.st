Class {
	#name : #BrDropdownLook,
	#superclass : #BrLook,
	#instVars : [
		'toggleStencil',
		'popupStencil',
		'popupEmbellisher',
		'popupElement',
		'toggleElement',
		'outskirtsEmbellisher'
	],
	#category : #'Brick-Dropdown - Look'
}

{ #category : #'instance creation' }
BrDropdownLook >> createPopupElement [
	"Create a popup element from a stencil and embellish it using outskirts embellisher"
	<return: #BlElement>
	| aPopupElement |

	aPopupElement := (self popupEmbellisher
		toggleStencil: self toggleStencil;
		popupElement: self popupStencil asElement) asElement.

	^ (self outskirtsEmbellisher element: aPopupElement) asElement
]

{ #category : #'instance creation' }
BrDropdownLook >> createToggleElement [
	"Create a toggle element from a stencil and embellish it using outskirts embellisher"
	<return: #BlElement>

	^ (self outskirtsEmbellisher element: self toggleStencil asElement) asElement
]

{ #category : #hooks }
BrDropdownLook >> dropdownCollapsed [

	self isExpanded
		ifFalse: [ ^ self ].

	self popupElement removeFromParent.
	popupElement := nil
]

{ #category : #hooks }
BrDropdownLook >> dropdownExpanded [
	self widgetDo: [ :aWidget |
		aWidget isAttachedToSceneGraph
			ifTrue: [
				aWidget space addChild: (popupElement := self createPopupElement).
				self relocatePopup ] ]
]

{ #category : #'element handlers' }
BrDropdownLook >> elementPositionInSpaceChanged: anEvent [
	self relocatePopup
]

{ #category : #initialization }
BrDropdownLook >> initialize [
	super initialize.

	toggleStencil := BrDropdownModel defaultToggleStencil.
	popupStencil := BrDropdownModel defaultPopupStencil.

	popupEmbellisher := BrDropdownPopupEmbellisher new.
	outskirtsEmbellisher := BrDropdownOutskirtsEmbellisher new
]

{ #category : #initialization }
BrDropdownLook >> initializeListeners [
	super initializeListeners.

	self when: BrExpansionChanged do: [ :anEvent |
		anEvent isExpanded
			ifTrue: [ self dropdownExpanded ]
			ifFalse: [ self dropdownCollapsed ] ].

	self when: BrDropdownPopupStencilChanged do: [ :anEvent | self popupStencil: anEvent stencil ].
	self when: BrDropdownToggleStencilChanged do: [ :anEvent | self toggleStencil: anEvent stencil ]
]

{ #category : #initialization }
BrDropdownLook >> initializeLook [
	super initializeLook.

	self initializeToggleElement
]

{ #category : #initialization }
BrDropdownLook >> initializeRequests [
	super initializeRequests.

	self request: BrDropdownPopupStencilRequest new.
	self request: BrDropdownToggleStencilRequest new.
]

{ #category : #initialization }
BrDropdownLook >> initializeToggleElement [
	toggleElement ifNotNil: #removeFromParent.
	self widget addChild: (toggleElement := self createToggleElement)
]

{ #category : #testing }
BrDropdownLook >> isExpanded [
	<return: #Boolean>

	^ popupElement isNotNil and: [ popupElement isAttachedToSceneGraph ]
]

{ #category : #accessing }
BrDropdownLook >> outskirtsEmbellisher [
	^ outskirtsEmbellisher
]

{ #category : #accessing }
BrDropdownLook >> outskirtsEmbellisher: anObject [
	outskirtsEmbellisher := anObject asStencilBuilder: BrDropdownOutskirtsEmbellisher
]

{ #category : #accessing }
BrDropdownLook >> popupElement [
	<return: #BlElement>

	^ popupElement
]

{ #category : #accessing }
BrDropdownLook >> popupEmbellisher [
	^ popupEmbellisher
]

{ #category : #accessing }
BrDropdownLook >> popupEmbellisher: anObject [
	popupEmbellisher := anObject
]

{ #category : #geometry }
BrDropdownLook >> popupPosition [
	"Return a popup position relative to the on space coordinates"
	<return: #Point>
	| boundsInSpace |

	boundsInSpace := self widget bounds inSpace.
	^ (self popupElement globalPointToParent: boundsInSpace position)
]

{ #category : #accessing }
BrDropdownLook >> popupStencil [
	<return: #BrStencil>

	^ popupStencil
]

{ #category : #accessing }
BrDropdownLook >> popupStencil: aBrStencil [
	popupStencil := aBrStencil asStencil
]

{ #category : #geometry }
BrDropdownLook >> relocatePopup [
	self isExpanded
		ifFalse: [ ^ self ].

	self popupElement relocate: self popupPosition
]

{ #category : #accessing }
BrDropdownLook >> toggleStencil [
	<return: #BrStencil>

	^ toggleStencil
]

{ #category : #accessing }
BrDropdownLook >> toggleStencil: aBrStencil [
	toggleStencil := aBrStencil asStencil.
	self widgetDo: [ self initializeToggleElement ]
]