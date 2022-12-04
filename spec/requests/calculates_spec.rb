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

    it 'should be html' do
      get 'create', params: { numbers: '1 0', format: :html }
      expect(response.content_type).to eq('text/html; charset=utf-8')
    end
  end

  describe 'various input' do
		it 'returns first output' do
			get 'create', params: { numbers: '1 2 3 2 1 6 5' }
			expect(assigns(:all_data)[:max_result]).to eq [1, 2, 3]
    end

    it 'returns second output' do
      get 'create', params: { numbers: '1 5 -1 45 1 9 18 1' }
			expect(assigns(:all_data)[:max_result]).to eq [1, 9, 18]
    end
  end
end
