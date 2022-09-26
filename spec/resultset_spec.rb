RSpec.describe LogParser::Resultset do
  let(:result) { described_class[grouped_entries] }
  let(:grouped_entries) {
    {
      "/about" => meta_collector1,
      "/home" => meta_collector2,
      "/contact-us" => meta_collector3 
    }
  }
  let(:meta_collector1) { instance_double(LogParser::MetaCollection, unique: 5, total: 5) }
  let(:meta_collector2) { instance_double(LogParser::MetaCollection, unique: 10, total: 25) }
  let(:meta_collector3) { instance_double(LogParser::MetaCollection, unique: 2, total: 150) }

  describe "#sort_by_total" do
    subject { result.sort_by_total }

    let(:expected_sorted_entries) {
      [
        ["/contact-us", meta_collector3],
        ["/home", meta_collector2],
        ["/about", meta_collector1]
      ]
    }

    it { is_expected.to eql(expected_sorted_entries) }
  end

  describe "#sort_by_unique" do
    subject { result.sort_by_unique }

    let(:expected_sorted_entries) {
      [
        ["/home", meta_collector2],
        ["/about", meta_collector1],
        ["/contact-us", meta_collector3]
      ]
    }

    it { is_expected.to eql(expected_sorted_entries) }
  end
end
