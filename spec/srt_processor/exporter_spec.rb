require 'spec_helper'

module SrtProcessor
	describe Exporter do 
		describe 'export' do
		it 'exports the given content to a file' do
			file = File.expand_path('spec/support/foo.txt')
			Exporter.new(file,'Hi').export

			expect(IO.read(file)).to eq('Hi')
			end
		end
	end	
end
