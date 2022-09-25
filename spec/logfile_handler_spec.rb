RSpec.describe LogParser::LogfileHandler do
  let(:handler) { described_class.new(lines) }
 let(:lines) {
   ["/abc 1.1.1.1",
    "/def 2.2.2.2"]
 }
 let(:metaobject) { LogParser::LogfileMeta.new("/abc", "1.1.1.1") }

before do
  allow(LogParser::LogfileMeta).to receive(:new).and_return(metaobject)
end
describe 'splits file entries into lines and ips' do
  subject { handler.split_file_entries }
  
  let(:expected_entries) {
   [
     LogParser::LogfileMeta.new("/abc", "1.1.1.1"),
     LogParser::LogfileMeta.new("/def", "2.2.2.2") 
   ]
  }
  it { is_expected.to eql(expected_entries) } 
end
end
