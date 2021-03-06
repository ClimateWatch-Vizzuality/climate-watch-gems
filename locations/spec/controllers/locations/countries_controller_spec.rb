require 'rails_helper'

describe Locations::CountriesController, type: :controller do
  routes { Locations::Engine.routes }

  context do
    let!(:some_locations) {
      FactoryBot.create_list(:location_country, 3)
    }

    describe 'GET index' do
      it 'returns a successful 200 response' do
        get :index
        expect(response).to be_successful
      end

      it 'lists all known locations that are countries' do
        get :index
        parsed_body = JSON.parse(response.body)
        expect(parsed_body.length).to eq(3)
      end
    end
  end
end
