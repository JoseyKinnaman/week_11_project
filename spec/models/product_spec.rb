require 'rails_helper'

describe Product do
  it{ should have_many(:reviews)}
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin}
  it("titleizes the name of an product") do
    product = product.create({name: "pastrami pickles", cost: 5, country_of_origin: "usa"})
    expect(product.name()).to(eq("Pastrami Pickles"))
end