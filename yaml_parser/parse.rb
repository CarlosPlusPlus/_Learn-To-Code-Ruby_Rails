require 'yaml'

class YamlParser
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  private
    # Assumes last values will single values (e.g. integer / string).
    def complete?(new_data)
      !(new_data.is_a?(Array) || new_data.is_a?(Hash))
    end

    def method_missing(m, *args)
      new_data = ( m == :[] ? data[args.first] : (
                              data.is_a?(Array) ? data.send(m) : data[m.to_s]))
      complete?(new_data) ? new_data : YamlParser.new(new_data)
    end
end

##############
# TEST BENCH #
##############

require 'rspec'

describe 'YamlParser' do
  before do
    yaml  = YAML.load_file('shipping.yaml')
    @data = YamlParser.new(yaml)
  end

  context 'with first level keys' do
    it 'handles [] notation' do
      expect( @data['tax'] ).to eq(251.42)
    end

    it 'handles . notiation' do
      expect( @data.tax ).to eq(251.42)
    end
  end

  context 'with nested keys' do
    it 'handles [] notation' do
      expect( @data['product'].first['sku'] ).to eq('BL394D')
    end

    it 'handles . notiation' do
      expect( @data.product.first.sku ).to eq('BL394D')
    end
  end
end
