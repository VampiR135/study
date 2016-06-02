module Vampir135
  module Arrays
    class << self
      def replace(array)
        max_element = array.max
        array.map { |elem| elem > 0 ? max_element : elem }
      end

      def search(array, query)
        array = array.sort
        return -1 if array.empty?
        left = array.index(array.min)
        right = array.index(array.max)
        binary_search_array(array, query, left, right)
      end

      def binary_search_array(array, query, left, right)
        mid = left + (right - left) / 2
        return mid if query == array[mid]
        return -1 if left == right
        query < array[mid] ? right = mid : left = mid + 1
        binary_search_array(array, query, left, right)
      end
    end
  end
end
