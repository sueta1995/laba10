# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalculatesController, type: :controller do
  describe 'GET /new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'check response format' do
    it 'should be xml' do
      get 'create', params: { numbers: '1 2 3 4', format: :xml }
      expect(response.content_type).to eq('application/xml; charset=utf-8')
    end
  end
end
