require File.expand_path(File.join(File.dirname(__FILE__), '..', "helper"))

module Nokogiri
  module XML
    class TestNodeSet < Nokogiri::TestCase
      def setup
        @xml = Nokogiri::XML.parse(File.read(XML_FILE), XML_FILE)
      end

      def test_negative_index_works
        assert node_set = @xml.search('//employee')
        assert_equal node_set.last, node_set[-1]
      end

      def test_large_negative_index_returns_nil
        assert node_set = @xml.search('//employee')
        assert_nil(node_set[-1 * (node_set.length + 1)])
      end

      def test_node_set_fetches_private_data
        assert node_set = @xml.search('//employee')

        set = node_set
        assert_equal(set[0], set[0])
      end

      def test_node_set_returns_0
        assert node_set = @xml.search('//asdkfjhasdlkfjhaldskfh')
        assert_equal(0, node_set.length)
      end
    end
  end
end
