# frozen_string_literal: true

# helper for calculates controller
module CalculatesHelper
  def set_numbers
    @numbers = params[:numbers].split(' ')
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

  def create_file
    data = @all_data.to_xml.split("\n")
    data.delete_at(0)

    header_version = ["<?xml version='1.0' encoding='UTF-8'?>"]
    header_style = ["<?xml-stylesheet type='text/xsl' href='output.xslt'?>"]
    output = header_version + header_style + data

    File.open('public/output.xml', 'w') { |f| f.puts(output.join("\n")) } if defined? @all_data
  end
end
