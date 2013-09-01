require 'pp'
require 'pry-debugger'
require 'yaml'

class YamlParser
	attr_accessor :yaml

	def initialize(hash)
		@yaml = hash
	end

	def method_missing(arg)
		sub_yml = @yaml[arg.to_s]
		YamlParser.new(sub_yml)
	end

	def first
		YamlParser.new(@yaml.first)
	end

end

yaml_hash 	= YAML.load_file('shipping.yaml')
parsed_yaml = YamlParser.new(yaml_hash)

puts parsed_yaml.product.first.sku.inspect