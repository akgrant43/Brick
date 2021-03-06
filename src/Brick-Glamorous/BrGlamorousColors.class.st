"
I define colors used for Glamorous Toolkit.

Here is the list of available colors: ${class:BrGlamorousColors|show=gtColorsFor:|expanded=true}$
"
Class {
	#name : #BrGlamorousColors,
	#superclass : #SharedPool,
	#classVars : [
		'ActiveColor',
		'ButtonBackgroundColor',
		'ButtonBorderColor',
		'ButtonTextColor',
		'DarkBorderColor',
		'DisabledButtonBackgroundColor',
		'DisabledButtonBorderColor',
		'DisabledButtonTextColor',
		'DisabledHeaderTextColor',
		'EditorBorderColor',
		'ErrorBackgroundColor',
		'ErrorBorderColor',
		'FocusedEditorBorderColor',
		'HeaderBackgroundColor',
		'HeaderTextColor',
		'HoveredButtonBorderColor',
		'HoveredButtonTextColor',
		'LightBorderColor',
		'LinkColor',
		'LinkWithErrorColor',
		'PressedButtonBorderColor',
		'PressedButtonTextColor',
		'PrimaryBorderColor',
		'SuccessBackgroundColor',
		'SuccessBorderColor',
		'TextHighlightColor'
	],
	#category : #'Brick-Glamorous'
}

{ #category : #accessing }
BrGlamorousColors class >> darkBorderColor [
	^ DarkBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> darkBorderColor: anObject [
	DarkBorderColor := anObject
]

{ #category : #'button - background' }
BrGlamorousColors class >> defaultButtonBackgroundColor [
	^ ButtonBackgroundColor
]

{ #category : #'button - background' }
BrGlamorousColors class >> defaultButtonBackgroundColor: anObject [
	ButtonBackgroundColor := anObject
]

{ #category : #'button - border' }
BrGlamorousColors class >> defaultButtonBorderColor [
	^ ButtonBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> defaultButtonBorderColor: anObject [
	ButtonBorderColor := anObject
]

{ #category : #'button - text' }
BrGlamorousColors class >> defaultButtonTextColor [
	^ ButtonTextColor
]

{ #category : #'button - text' }
BrGlamorousColors class >> defaultButtonTextColor: anObject [
	ButtonTextColor := anObject
]

{ #category : #'header - background' }
BrGlamorousColors class >> defaultHeaderBackgroundColor [
	^ HeaderBackgroundColor
]

{ #category : #'header - text' }
BrGlamorousColors class >> defaultHeaderTextColor [
	^ HeaderTextColor
]

{ #category : #'button - background' }
BrGlamorousColors class >> disabledButtonBackgroundColor [
	^ DisabledButtonBackgroundColor
]

{ #category : #'button - background' }
BrGlamorousColors class >> disabledButtonBackgroundColor: anObject [
	DisabledButtonBackgroundColor := anObject
]

{ #category : #'button - border' }
BrGlamorousColors class >> disabledButtonBorderColor [
	^ DisabledButtonBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> disabledButtonBorderColor: anObject [
	DisabledButtonBorderColor := anObject
]

{ #category : #'button - text' }
BrGlamorousColors class >> disabledButtonTextColor [
	^ DisabledButtonTextColor
]

{ #category : #'button - text' }
BrGlamorousColors class >> disabledButtonTextColor: anObject [
	DisabledButtonTextColor := anObject
]

{ #category : #'header - text' }
BrGlamorousColors class >> disabledHeaderTextColor [
	^ DisabledHeaderTextColor
]

{ #category : #accessing }
BrGlamorousColors class >> distinctTenLightColors [
	"This is a list of 10 light colors that can be distinguished b
	the typical human eye even when seen together in the same picture.
	They complement the distinctTenStrongColors.
	They are described in the Show Me the Numbers book by Stephen Few"

	^ OrderedCollection new
		"red"
		add: (Color 
					h: Color red hue
					s: 0.3
					v: Color red brightness);
		"blue"
		add: (Color 
					h: Color blue hue
					s: 0.3
					v: Color blue brightness);
		"orange"
		add: (Color 
					h: Color orange hue
					s: 0.3
					v: Color orange brightness);
		"cyan"
		add: (Color 
					h: Color cyan hue
					s: 0.3 
					v: Color cyan brightness );
		"green"
		add: (Color 
					h: Color lightGreen hue
					s: 0.1
					v: 0.7);
		"pink"
		add: (Color 
					h: Color pink hue
					s: 0.1
					v: Color pink brightness);
		"brown"
		add: (Color 
					h: Color brown hue
					s: 0.2
					v: 1 );
		"purple"
		add: (Color 
					h: Color purple hue
					s: 0.2
					v: Color purple brightness );
		"yellow"
		add: (Color 
					h: Color yellow hue
					s: 0.3
					v: Color yellow brightness);
		"gray"
		add: (Color veryLightGray);
		yourself;


		yourself
]

{ #category : #accessing }
BrGlamorousColors class >> distinctTenStrongColors [
	"This is a list of 10 light colors that can be distinguished b
	the typical human eye even when seen together in the same picture.
	They complement the distinctTenLightColors.
	They are described in the Show Me the Numbers book by Stephen Few"

	^ (OrderedCollection new)
			add: Color red;
			add: Color blue;
			add: Color orange;
			add: Color cyan;
			add: Color green;
			add: Color pink;
			add: Color brown;
			add: Color purple;
			add: Color yellow;
			add: Color gray;
			yourself
]

{ #category : #accessing }
BrGlamorousColors class >> editorBorderColor [
	^ EditorBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> editorBorderColor: anObject [
	EditorBorderColor := anObject
]

{ #category : #'button - background' }
BrGlamorousColors class >> errorBackgroundColor [
	^ ErrorBackgroundColor
]

{ #category : #'button - background' }
BrGlamorousColors class >> errorBackgroundColor: aColor [
	ErrorBackgroundColor := aColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> errorBorderColor [
	^ ErrorBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> focusedEditorBorderColor [
	^ FocusedEditorBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> focusedEditorBorderColor: anObject [
	FocusedEditorBorderColor := anObject
]

{ #category : #'button - border' }
BrGlamorousColors class >> hoveredButtonBorderColor [
	^ HoveredButtonBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> hoveredButtonBorderColor: anObject [
	HoveredButtonBorderColor := anObject
]

{ #category : #'button - text' }
BrGlamorousColors class >> hoveredButtonTextColor [
	^ HoveredButtonTextColor
]

{ #category : #'button - text' }
BrGlamorousColors class >> hoveredButtonTextColor: anObject [
	HoveredButtonTextColor := anObject
]

{ #category : #initialization }
BrGlamorousColors class >> initialize [
	LightBorderColor := Color fromHexString: #d9d9d9.
	DarkBorderColor := Color darkGray.
	PrimaryBorderColor := Color fromHexString: #'45abfe'.
	ActiveColor := Color fromHexString: #'096dd9'.

	"buttons - border"
	ButtonBorderColor := LightBorderColor.
	HoveredButtonBorderColor := PrimaryBorderColor.
	PressedButtonBorderColor := ActiveColor.
	DisabledButtonBorderColor := LightBorderColor.
	SuccessBorderColor := Color fromHexString: #'389e0d' "green-7".
	ErrorBorderColor := Color fromHexString: #'cf1322' "red-7".
	
	"buttons - background"
	ButtonBackgroundColor := Color white.
	DisabledButtonBackgroundColor := Color fromHexString: #f5f5f5 "grey-3".
	ErrorBackgroundColor := Color fromHexString: #ffa39e "red-3".
	SuccessBackgroundColor := Color fromHexString: #b7eb8f "green-3".

	"buttons - text"
	ButtonTextColor := Color black alpha: 0.65.
	HoveredButtonTextColor := PrimaryBorderColor.
	PressedButtonTextColor := ActiveColor.
	DisabledButtonTextColor := Color black alpha: 0.25.

	"header - background"
	HeaderBackgroundColor := Color fromHexString: #fafafa.

	"header - text"
	HeaderTextColor := Color black alpha: 0.85.
	DisabledHeaderTextColor := Color black alpha: 0.25.
	
	"highlighting - text"
	TextHighlightColor := Color fromHexString: #ffd666.

	"editors"
	EditorBorderColor := LightBorderColor.
	FocusedEditorBorderColor := PrimaryBorderColor.
	
	"others"
	LinkColor := Color fromHexString: #'096dd9'.
	LinkWithErrorColor := Color fromHexString: #cf1322.
]

{ #category : #accessing }
BrGlamorousColors class >> lightBorderColor [
	^ LightBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> lightBorderColor: anObject [
	LightBorderColor := anObject
]

{ #category : #links }
BrGlamorousColors class >> linkColor [
	^ LinkColor
]

{ #category : #links }
BrGlamorousColors class >> linkWithErrorColor [
	^ LinkWithErrorColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> pressedButtonBorderColor [
	^ PressedButtonBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> pressedButtonBorderColor: anObject [
	PressedButtonBorderColor := anObject
]

{ #category : #'button - text' }
BrGlamorousColors class >> pressedButtonTextColor [
	^ PressedButtonTextColor
]

{ #category : #'button - text' }
BrGlamorousColors class >> pressedButtonTextColor: anObject [
	PressedButtonTextColor := anObject
]

{ #category : #accessing }
BrGlamorousColors class >> primaryBorderColor [
	^ PrimaryBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> primaryBorderColor: anObject [
	PrimaryBorderColor := anObject
]

{ #category : #'button - background' }
BrGlamorousColors class >> successBackgroundColor [
	^ SuccessBackgroundColor
]

{ #category : #'button - background' }
BrGlamorousColors class >> successBackgroundColor: aColor [
	SuccessBackgroundColor := aColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> successBorderColor [
	^ SuccessBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> textHighlightColor [
	^ TextHighlightColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> textHighlightColor: anObject [
	TextHighlightColor := anObject
]
