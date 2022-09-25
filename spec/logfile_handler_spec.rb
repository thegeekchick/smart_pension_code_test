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
describe 'populate total views and unique ips hash' do
  subject(:add_entry) { handler.populate_visits_unique_hash(entry) }

  let(:entry) { LogParser::LogfileMeta.new("/abc", "1.1.1.1") }

  it "increments total views" do
    expect { add_entry }.to change { handler.total }.by(1)
  end

  it "increments unique values" do
    expect { add_entry }.to change { handler.unique }.by(1)
  end

context "with an already existing ip" do
  before do
    handler.ips["1.1.1.1"] = true 
  end
 it "does not increment unique values" do
   expect { add_entry }.to_not change { handler.unique }
 end
end
end
end
