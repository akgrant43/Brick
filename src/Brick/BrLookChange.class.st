Class {
	#name : #BrLookChange,
	#superclass : #Object,
	#instVars : [
		'initialized',
		'up',
		'down'
	],
	#category : #'Brick-! Core'
}

{ #category : #accessing }
BrLookChange >> down [
	^ down
]

{ #category : #accessing }
BrLookChange >> down: anObject [
	down := anObject
]

{ #category : #initialization }
BrLookChange >> downOn: aLook [
	self assert: [ initialized ].
	down value: aLook.
	initialized := false
]

{ #category : #initialization }
BrLookChange >> initialize [
	super initialize.
	initialized := false.
	up := [ :e |  ].
	down := [ :e |  ]
]

{ #category : #accessing }
BrLookChange >> initialized [
	^ initialized
]

{ #category : #accessing }
BrLookChange >> initialized: anObject [
	initialized := anObject
]

{ #category : #accessing }
BrLookChange >> up [
	^ up
]

{ #category : #accessing }
BrLookChange >> up: anObject [
	up := anObject
]

{ #category : #initialization }
BrLookChange >> upOn: aLook [
	self assert: [ initialized not ].
	up value: aLook.
	initialized := true
]
