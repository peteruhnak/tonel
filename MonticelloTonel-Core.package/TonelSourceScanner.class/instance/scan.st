scanning
scan
	self prepareToScan.	
	stream peek = $[ ifFalse: [ TonelParseError signal: 'Can''t parse method body' ].
	[ stream atEnd or: [ isFinished ] ]
	whileFalse: [ self scanNextChunk ].
	isFinished ifTrue: [ 
		"clean up to return"
		^ self 
			removeFrom: result contents withSqueakLineEndings
			enclosingStart: $[ 
			end: $]
			clean: #right ].

	TonelParseError signal: 'Can''t parse method body'