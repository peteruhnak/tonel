baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: #'MonticelloTonel-Core';
				package: #'MonticelloTonel-FileSystem' with: [ spec requires: #('MonticelloTonel-Core') ];
				package: #'MonticelloTonel-Tests' with: [ spec requires: #('MonticelloTonel-Core') ].
			spec
				group: 'default' with: #('core' 'tests');
				group: 'core' with: #('MonticelloTonel-Core' 'MonticelloTonel-FileSystem');
				group: 'tests' with: #('MonticelloTonel-Tests') ].
			
	spec for: #(#'pharo1.x' #'pharo2.x' #'pharo3.x' #'pharo4.x') do: [ 
		self ston: spec.
		
		spec package: #'MonticelloTonel-Core' with: [ spec requires: #('Ston') ] ]