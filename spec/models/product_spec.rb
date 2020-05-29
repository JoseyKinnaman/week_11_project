require 'rails_helper'

describe Product do
  it{ should have_many(:reviews)}
  it { should validate presence_of :name, :cost, :country_of_origin}
end