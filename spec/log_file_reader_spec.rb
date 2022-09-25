
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
  let(:reader) { described_class.new(file) }
  let(:file) { File.expand_path("../fixtures/log_file.log", __FILE__) }

  describe 'reads file' do
    subject(:lines) { reader.lines }
    let(:expected_lines) { ["line1", "line2", "line3"] }
    it { is_expected.to eql(expected_lines) }
  end  
end
