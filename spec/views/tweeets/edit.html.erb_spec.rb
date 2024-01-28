require 'rails_helper'

RSpec.describe "tweeets/edit", type: :view do
  let(:tweeet) {
    Tweeet.create!()
  }

  before(:each) do
    assign(:tweeet, tweeet)
  end

  it "renders the edit tweeet form" do
    render

    assert_select "form[action=?][method=?]", tweeet_path(tweeet), "post" do
    end
  end
end
