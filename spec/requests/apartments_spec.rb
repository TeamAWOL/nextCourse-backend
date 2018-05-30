require 'rails_helper'

describe "APARTMENTS API" do
  it "gets a list of Apartments" do
    Apartment.create(street_name1:'test Street', street_name2: 'k Street', city:'San Diego',
                     zipcode:'92270', state:'CA', country:'USA', m_name:'Tina', m_number:'313-3i4-9383',
                     m_hour:'10AM to 4PM')
    # Make a request to the API
    get '/apartments'

    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)

    # Assure that we got a successful response
    expect(response).to be_success

    # Assure that we got one result back as expected
    expect(json.length).to eq 1
  end
end
