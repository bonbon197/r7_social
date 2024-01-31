json.extract! report, :id, :title, :content, :date, :emp_transid, :report_type, :office, :user_id, :remarks, :created_at, :updated_at
json.url report_url(report, format: :json)
