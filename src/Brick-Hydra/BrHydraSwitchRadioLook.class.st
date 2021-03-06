Class {
	#name : #BrHydraSwitchRadioLook,
	#superclass : #BrHydraSwitchLook,
	#instVars : [
		'thumb'
	],
	#category : 'Brick-Hydra'
}

{ #category : #accessing }
BrHydraSwitchRadioLook >> deactivatedColor [
	^ self color alpha: 0.4
]

{ #category : #initialization }
BrHydraSwitchRadioLook >> initialize [
	super initialize.
	thumb := self newThumbElement.
	changes
		add:
			(#(widget layout)
				asBrLookPropertyChangeWithValue: [ BlFrameLayout new ]).
	changes
		add:
			(#(widget padding)
				asBrLookPropertyChangeWithValue: [ BlInsets all: 3 ]).
	changes
		add:
			(#(widget border)
				asBrLookPropertyChangeWithValue: [ BlBorder builder
						width: 1;
						build ]).
	changes
		add:
			(#(widget geometry) asBrLookPropertyChangeWithValue: [ BlEllipse new ]).
	changes
		add: (#(content thumb) asBrLookChildAddAsChangeWithValue: [ thumb ]).
	changes
		add: (#(widget size) asBrLookPropertyChangeWithValue: [ 20 @ 20 ])
]

{ #category : #initialization }
BrHydraSwitchRadioLook >> initializeLook [
	super initializeLook.
	self updateColor
]

{ #category : #'instance creation' }
BrHydraSwitchRadioLook >> newThumbElement [
	^ BlElement new
		geometry: BlEllipse new;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ]
]

{ #category : #'event handling' }
BrHydraSwitchRadioLook >> toggleActivated [
	thumb background: self color
]

{ #category : #'event handling' }
BrHydraSwitchRadioLook >> toggleDeactivated [
	thumb background: self deactivatedColor
]

{ #category : #updating }
BrHydraSwitchRadioLook >> updateColor [
	widget border: (widget border copyWithPaint: self color).

	widget isActivated
		ifTrue: [ thumb background: self color ]
		ifFalse: [ thumb background: self deactivatedColor ]
]
