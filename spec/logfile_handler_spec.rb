RSpec.describe LogParser::LogfileHandler do
  let(:handler) { described_class.new(lines) }

 let(:lines) {
   ["/abc 1.1.1.1",
    "/def 2.2.2.2"]
 }

 let(:metaobject) { LogParser::LogfileMeta.new("/abc", "1.1.1.1") }

 let(:aggregator_result) {
    LogParser::AggregatorResult[
      "/about" => instance_double(LogParser::LogfileHandler, unique: 5, total: 100),
      "/home" => instance_double(LogParser::LogfileHandler, unique: 10, total: 25),
      "/contact-us" => instance_double(LogParser::LogfileHandler, unique: 2, total: 140)
    ]
  }


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
  describe 'groups by ips  and path ' do
    subject(:group) { handler.aggregate }

    it "groups entries by their paths" do
      expect(group.keys).to match_array(['/abc'])
    end

    it "stores total values" do
      expect(group.fetch('/abc').total).to eql(2)
    end
  end
end
