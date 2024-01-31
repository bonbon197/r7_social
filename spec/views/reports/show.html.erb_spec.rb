require 'rails_helper'

RSpec.describe "reports/show", type: :view do
  before(:each) do
    assign(:report, Report.create!(
      title: "Title",
      content: "MyText",
      emp_transid: 2,
      report_type: "Report Type",
      office: "Office",
      user_id: 3,
      remarks: "Remarks"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Report Type/)
    expect(rendered).to match(/Office/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Remarks/)
  end
end
