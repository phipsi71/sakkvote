json.array!(@inquiries) do |inquiry|
  json.extract! inquiry, :answer, :remark
  json.url inquiry_url(inquiry, format: :json)
end
