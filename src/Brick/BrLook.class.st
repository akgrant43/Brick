"
I define how widgets look. In addition to the BrViewModel I listen to UI events and update decoration (non meaningful) elements of the widgets
"
Class {
	#name : #BrLook,
	#superclass : #BrActor,
	#instVars : [
		'changes'
	],
	#category : #'Brick-! Core'
}

{ #category : #'api - composition' }
BrLook class >> + anotherLook [
	^ self asLook + anotherLook
]

{ #category : #'api - composition' }
BrLook class >> - anotherLook [
	^ self asLook - anotherLook
]

{ #category : #'api - composition' }
BrLook class >> asLook [
	^ self new
]

{ #category : #'api - composition' }
BrLook >> + anotherLook [
	self add: anotherLook asLook
]

{ #category : #'api - composition' }
BrLook >> - anotherLook [
	self remove: anotherLook
]

{ #category : #comparing }
BrLook >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #'api - composition' }
BrLook >> add: aBrLook [
	| aLookInstance |

	aLookInstance := aBrLook asLook.
	self looks add: aLookInstance.
	self widgetDo: [ :anElement | aLookInstance onInstalledIn: anElement ]
]

{ #category : #'api - composition' }
BrLook >> addAll: aCollectionOfLooks [
	aCollectionOfLooks do: [ :aLook | self add: aLook ]
]

{ #category : #'api - composition' }
BrLook >> asLook [
	^ self
]

{ #category : #accessing }
BrLook >> changes [
	^ changes
]

{ #category : #initialization }
BrLook >> finalizeLook [
	"Override me to clean up widget state after the look is removed.
	For example, if a look adds shadow effect to the element, that shadow effect should be removed when we remove the look"
	changes downOn: self
]

{ #category : #comparing }
BrLook >> hash [
	^ self class hash
]

{ #category : #initialization }
BrLook >> initialize [
	super initialize.
	changes := BrLookChanges new
]

{ #category : #initialization }
BrLook >> initializeListeners [
	"Override me to initialize event listeners such as property updates from the view model"
	
	self when: BrViewModelAttached do: [ self initializeRequests ]
]

{ #category : #initialization }
BrLook >> initializeLook [
	changes upOn: self
]

{ #category : #initialization }
BrLook >> initializeRequests [
	"Override me to implement requests to the view model to synchronise its properties"
]

{ #category : #accessing }
BrLook >> looks [
	^ self children
]

{ #category : #hooks }
BrLook >> onAttachedTo: anElement [
]

{ #category : #hooks }
BrLook >> onDetached: anElement [
]

{ #category : #'api - hooks' }
BrLook >> onInstalledIn: anElement [
	super onInstalledIn: anElement.
	self
		assert: [ widget isNil ]
		description: [ 'Can not install the same look instance on multiple widgets' ].
	widget := anElement.
	self onAttachedTo: anElement.
	self initializeLook.
	"we must send events after look initialization where we set defaults"
	self initializeRequests.
	self looks do: [ :aLook | aLook onInstalledIn: anElement ]
]

{ #category : #'api - hooks' }
BrLook >> onUninstalledIn: anElement [
	super onUninstalledIn: anElement.
	self
		assert: [ self widget == anElement ]
		description: [ 'Can not uninstall from a different widget' ].
	self looks reversed do: [ :aLook | aLook onUninstalledIn: anElement ].
	self finalizeLook.
	self onDetached: anElement.
	widget := nil
]

{ #category : #'api - composition' }
BrLook >> remove: aBrLook [
	| aLookInstance |

	aLookInstance := aBrLook asLook.
	self looks remove: aLookInstance ifAbsent: [ ^ self ].
	
	aLookInstance widgetDo: [ :anElement | aLookInstance onUninstalledIn: anElement ]
]

{ #category : #accessing }
BrLook >> widgetContent [
	"Return widget's content container element"
	<return: #BlElement>

	self
		assert: [ widget isNotNil ]
		description: [ 'I must be attached to the widget first' ].

	"if widget does not have explicit #content container, we treat widget as a container itself"
	^ widget
		childNamed: #content
		ifFound: [ :anElement | anElement ]
		ifNone: [ widget ]
]
