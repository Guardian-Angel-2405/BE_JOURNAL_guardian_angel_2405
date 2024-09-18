class AffirmationService 
  def self.obtain
    conn = Faraday.new(url: "https://www.affirmations.dev/")
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end
end