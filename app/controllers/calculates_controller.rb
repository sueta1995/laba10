# frozen_string_literal: true

# class of controller
class CalculatesController < ApplicationController
  def new; end

  def create
    @numbers = params.require(:calculates).permit(:numbers)[:numbers].split(' ')

    if ::CalculatesController.valid?(@numbers)
      @result = ::CalculatesController.calculating(@numbers.collect(&:to_i))
      @max_result = @result.max_by(&:length)

      render :results
    else
      flash.now[:alert] = 'Введены не верные значения!'

      render :new
    end
  end

  def self.valid?(array)
    result = true if array.any?

    array.each { |x| result = false if x.scan(/[-0-9]/).length != x.length }

    result
  end

  def self.calculating(array)
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
end
