require 'acceptance/acceptance_helper'

feature Service do
  describe ".load_quotes", js: true do

    scenario "authorize" do
      consumer_key = 'dj0yJmk9dUNXa3Z5Nk1nUXdtJmQ9WVdrOWVITkVlRFpMTjJjbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmeD1jMg--'
      consumer_secret = 'f9e8594c5f89dc2fd1de9c751b97c5b7de4f802b'
      code = "<the user code you got after you gave permission>"

      # data = { client_id: consumer_key,
      #          redirect_uri: "oob",
      #          response_type: "code",
      #          language: "en-us"  }
      # url = "https://api.login.yahoo.com/oauth2/request_auth?#{data.to_query}"
      # visit url
      # find('input#login-username').set('rustamakhmetov@yandex.ru')
      # #fill_in "login-username", with: "rustamakhmetov@yandex.ru"
      # find("input#login-signin").click
      # click_on "Next"
      # save_and_open_page


      #stock_name = "GILD"
      #expect(Service.load_quotes(Date.today, stock_name)).to eq 80
    end
  end
end