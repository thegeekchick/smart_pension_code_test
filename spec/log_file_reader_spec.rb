
RSpec.describe LogParser::LogFileReader do
  describe '.new' do 
    describe 'without a file argument' do
      it 'raises an error' do
        expect { described_class.new } 
          .to raise_error(ArgumentError)
      end
    end
  end
  describe 'when the file is nil' do
    it 'raises an error' do
      expect { described_class.new(nil) }
        .to raise_error(ArgumentError) 
    end
  end
  describe 'when the file does not exist' do
    before do 
      allow(File).to receive(:exist?).and_return(false)
    end
    it 'raises an error' do
      expect { described_class.new('nil.log') }
        .to raise_error(ArgumentError)
    end
  end
end
