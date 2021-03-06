Class {
	#name : #BrExpanderExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Expander'
}

{ #category : #'examples - with text' }
BrExpanderExamples >> expanderWithText [
	<gtExample>
	| anExpander aText |

	aText := 'I am the first line of the text', String cr, 'I am the second line'.

	anExpander := BrExpander new.
	anExpander vFitContent; hExact: 300.
	anExpander look: BrGlamorousExpanderLook new.
	anExpander header: [ BrEditorElement new editor: (BrTextEditor new text: aText lines first asRopedText) ].
	anExpander content: [ BrEditorElement new editor: (BrTextEditor new text: aText asRopedText) ].
	
	anExpander margin: (BlInsets all: 10).
	^ anExpander
]
