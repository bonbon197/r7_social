require 'rails_helper'

RSpec.describe "reports/edit", type: :view do
  let(:report) {
    Report.create!(
      title: "MyString",
      content: "MyText",
      emp_transid: 1,
      report_type: "MyString",
      office: "MyString",
      user_id: 1,
      remarks: "MyString"
    )
  }

  before(:each) do
    assign(:report, report)
  end

  it "renders the edit report form" do
    render

    assert_select "form[action=?][method=?]", report_path(report), "post" do

      assert_select "input[name=?]", "report[title]"

      assert_select "textarea[name=?]", "report[content]"

      assert_select "input[name=?]", "report[emp_transid]"

      assert_select "input[name=?]", "report[report_type]"

      assert_select "input[name=?]", "report[office]"

      assert_select "input[name=?]", "report[user_id]"

      assert_select "input[name=?]", "report[remarks]"
    end
  end
end
