require 'rails_helper'

RSpec.describe 'Items Api' do
  it 'returns a list of items' do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success
    expect(response).to have_http_status(200)

    items = JSON.parse(response.body, symbolize_names: true)
    first_item = items.first

    expect(items.count).to eq(3)
    expect(first_item).to have_key(:id)    
    expect(first_item).to have_key(:name)
    expect(first_item).to have_key(:description)
    expect(first_item).to have_key(:image_url)
    expect(first_item).to_not have_key(:created_at)
    expect(first_item).to_not have_key(:updated)
  end

  it 'can find and return one item by id' do
    id = create(:item).id

    get "/api/v1/items/#{id}"
    expect(response).to be_success
    expect(response).to have_http_status(200)

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:id]).to eq(id)
  end

  it 'can delete a request' do
    id = create(:item).id
    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{id}"

    expect(response).to be_success
    expect(response).to have_http_status(204)

    expect(Item.count).to eq(0)
  end

  it 'can create an item' do
    expect(Item.count).to eq(0)
    item_params = { name: 'new_item',
                    description: 'its a new item',
                    image_url: 'www.google.com' }

    post '/api/v1/items', item: item_params

    expect(response).to be_success
    expect(response).to have_http_status(201)
    expect(Item.count).to eq(1)
    expect(Item.last.name).to eq(item_params[:name])

    item = JSON.parse(response.body, symbolize_names: true)

    expect(item[:id]).to eq(Item.last.id)
    expect(item[:name]).to eq(item_params[:name])
    expect(item[:description]).to eq(item_params[:description])
    expect(item[:image_url]).to eq(item_params[:image_url])
    expect(item).to_not have_key(:created_at)
    expect(item).to_not have_key(:updated)
  end
end


# We need an API for the application that can both read and write data. Start by focusing on functionality for items. All of this should happen in a dedicated, versioned controller.

# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at

# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at

# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted

# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at

# * Verify that your non-GET requests work using Postman or curl. (Hint: `ActionController::API`). Why doesn't the default `ApplicationController` support POST and PUT requests?