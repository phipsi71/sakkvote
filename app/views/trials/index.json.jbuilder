json.array!(@trials) do |trial|
  json.extract! trial, :id, :trl_code, :trl_name
  json.url trial_url(trial, format: :json)
end
