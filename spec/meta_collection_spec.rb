RSpec.describe LogParser::MetaCollection do
  let(:meta_collector) { described_class.new }

describe 'populate total views and unique ips hash' do
  subject(:add_entry) { meta_collector.add(entry) }
   
     let(:entry) { LogParser::LogfileMeta.new("/abc", "1.1.1.1") }
   
     it "increments total views" do
       expect { add_entry }.to change { meta_collector.total }.by(1)
     end
   
     it "increments unique values" do
       expect { add_entry }.to change { meta_collector.unique }.by(1)
     end
   
   context "with an already existing ip" do
     before do
       meta_collector.ips["1.1.1.1"] = true
     end
    it "does not increment unique values" do
      expect { add_entry }.to_not change { meta_collector.unique }
    end
   end
   end
end

