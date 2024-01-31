require 'rails_helper'

RSpec.describe "reports/index", type: :view do
  before(:each) do
    assign(:reports, [
      Report.create!(
        title: "Title",
        content: "MyText",
        emp_transid: 2,
        report_type: "Report Type",
        office: "Office",
        user_id: 3,
        remarks: "Remarks"
      ),
      Report.create!(
        title: "Title",
        content: "MyText",
        emp_transid: 2,
        report_type: "Report Type",
        office: "Office",
        user_id: 3,
        remarks: "Remarks"
      )
    ])
  end

  it "renders a list of reports" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Report Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Office".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Remarks".to_s), count: 2
  end
end
