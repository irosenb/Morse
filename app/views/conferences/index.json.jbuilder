json.array!(@conferences) do |conference|
  json.extract! conference, :id, :open, :number, :start_date, :end_date, :name
  json.url conference_url(conference, format: :json)
end
