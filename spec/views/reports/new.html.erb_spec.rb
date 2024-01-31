require 'rails_helper'

RSpec.describe "reports/new", type: :view do
  before(:each) do
    assign(:report, Report.new(
      title: "MyString",
      content: "MyText",
      emp_transid: 1,
      report_type: "MyString",
      office: "MyString",
      user_id: 1,
      remarks: "MyString"
    ))
  end

  it "renders new report form" do
    render

    assert_select "form[action=?][method=?]", reports_path, "post" do

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
