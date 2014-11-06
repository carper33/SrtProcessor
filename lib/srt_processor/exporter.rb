module SrtProcessor
	class Exporter 
		def initialize (file,text)
			@file = file
			@text = text
		end
		def export
			IO.write(@file,@text)
		end
	end
end