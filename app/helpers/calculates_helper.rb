module CalculatesHelper
	def set_numbers
		@numbers = params.require(:calculates).permit(:numbers)[:numbers].split(' ')
	end

	def valid?(array)
    result = true if array.any?

    array.each { |x| result = false if x.scan(/[-0-9]/).length != x.length }

    result
  end

  def calculating(array)
    result = []
    temp = []

    array.each_index do |x|
      temp << array[x]
      unless array[x] < array[x + 1]
        result << temp
        temp = []
      end
    rescue StandardError
      result << temp
    end

    result
  end

	def assignment
		@result = calculating(@numbers.collect(&:to_i))
    @max_result = @result.max_by(&:length)
		@all_data = { 'result': @result, 'max_result': @max_result }
	end
end
