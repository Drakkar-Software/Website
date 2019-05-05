require 'net/http'

module WelcomeHelper
  def metrics(year = 0, month = 0, day = 0)
    uri = URI.parse("https://octobotmetrics.herokuapp.com/metrics/community/count/#{year}/#{month}/#{day}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    @data = http.get(uri.request_uri)
    JSON.parse(@data.body)["total"]
  end
end
