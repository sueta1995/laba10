# frozen_string_literal: true

# class of controller
class CalculatesController < ApplicationController
  before_action :set_numbers, only: %i[ create ]

  include CalculatesHelper

  def new; end

  def create
    if valid?(@numbers)
      assignment

      respond_to do |format|
        format.html
        format.xml { render xml: @all_data }
      end
    else
      flash.now[:alert] = 'Введены не верные значения!'

      render :new
    end
  end
end
