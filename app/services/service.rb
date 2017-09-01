class Service
  def self.authorization_url
    data = { client_id: Rails.application.secrets.yahoo_consumer_key,
             redirect_uri: "oob",
             response_type: "code",
             language: "en-us"  }
    return "https://api.login.yahoo.com/oauth2/request_auth?#{data.to_query}"
  end

  def self.load_quotes(date, stock_name)
    consumer_key = 'dj0yJmk9dUNXa3Z5Nk1nUXdtJmQ9WVdrOWVITkVlRFpMTjJjbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1jMg--'
    consumer_secret = 'f9e8594c5f89dc2fd1de9c751b97c5b7de4f802b'
    code = "<the user code you got after you gave permission>"

    data = { client_id: consumer_key,
             redirect_uri: "oob",
             response_type: "code",
             language: "en-us"  }
    url = "https://api.login.yahoo.com/oauth2/request_auth?#{data.to_query}"
    #req = Net::HTTP::Get.new(url)
    #url = "https://api.login.yahoo.com/oauth2/request_auth?client_id=dj0yJmk9ak5IZ2x5WmNsaHp6JmQ9WVdrOVNqQkJUMnRYTjJrbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1hYQ--&redirect_uri=oob&response_type=code&language=en-us"

    # browser = Capybara.current_session
    # browser.visit url
    # browser.save_and_open_page
    # exit

    resp = Net::HTTP.get_response(URI.parse(url))
    puts resp.body
    exit


    uri = URI('https://api.login.yahoo.com/oauth2/get_token')
    req = Net::HTTP::Post.new(uri.path)
    req.basic_auth consumer_key, consumer_secret
    req.set_form_data({client_id: consumer_key, client_secret: consumer_secret,
                       redirect_uri: 'oob'}) #, code: code, grant_type: 'authorization_code'

    sock = Net::HTTP.new(uri.host, uri.port)
    sock.use_ssl = true
    res = sock.start {|http| http.request(req) }
    puts res.body
    access_token = JSON.parse(res.body)['access_token']
    refresh_token = JSON.parse(res.body)['refresh_token']

    exit

    client = OAuth2::Client.new(Rails.application.secrets.yahoo_consumer_id,
                                Rails.application.secrets.yahoo_consumer_secret,
                                site: 'https://api.login.yahoo.com',
                                authorize_url: '/oauth2/request_auth',
                                token_url: '/oauth2/get_token')
    client.auth_code.authorize_url(redirect_uri: redirect_uri, headers: { "Authorization" => basic_authorization })
    token = client.auth_code.get_token(code, redirect_uri: redirect_uri)

# Later
    token.refresh!

    yql_base_url = "http://query.yahooapis.com/v1/yql"
    yql_results = ""
    yql_query = "select * from yahoo.finance.quotes where symbol in ('GILD')"
    yql_query_url = yql_base_url + "?q=" + URI.escape(yql_query)
    resp = Net::HTTP.get_response(URI.parse(yql_query_url))
    data = resp.body
    print data
#print yql_query_url
  end
end