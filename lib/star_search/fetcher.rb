module StarSearch
  class Fetcher

    def self.setup_agent
      agent = Mechanize.new
      login_page = agent.get("#{StarSearch.campfire_url}/login")
      login_form = login_page.forms[0]

      login_form.username = StarSearch.campfire_username
      login_form.password = StarSearch.campfire_password

      agent.submit(login_form)
      agent
    end
    
    def self.agent
      @agent ||= setup_agent
    end

    def self.get_page(range)
      stars = []

      range.each do |page|
        puts "doing page #{page}"
        new_page = agent.get("#{StarSearch.campfire_url}/files+transcripts?room_id=165670&n=#{page*14}")
        
        break unless new_page.search("div.transcript.clearfix")
        
        new_page.search("div.transcript.clearfix").each do |day|
          messages = []

          day.search("div.stars.group table tr").each do |starred_message|
            author = starred_message.at("td.person").inner_text.strip
            starred_message_id = starred_message["id"].gsub('starred_message_', '').to_i
            email = mogrify_user(author)
            date = day.at("h1 strong").inner_text
            time = starred_message.at("td.link a").inner_html

            star = StarSearch::Star.create(:author => author, :starred_message_id => starred_message_id, :email => email, :posted_at => DateTime.parse("#{date} #{time}"))
            message = starred_message.at("td.body")

            if message.at("a.image.loading")
              star.body = process_url(message.at("a")["href"])
              star.type = "image"
            elsif message.at("a.youtube_video")
              star.body = process_url(message.at("a")["href"])
              star.type = "youtube"
            elsif message.at("a")
              star.body = process_url(message.at("a")["href"])
              star.type = "link"
            else
              star.body = message.inner_text.strip
              star.type = "text"
            end

            stars << star
          end
        end
      end
    end
    
    def self.process_url(url)
      url[0..0] == "/" ? StarSearch.campfire_url + url : url
    end

    def self.mogrify_user(username)
      users = { "maddox" => "jon@mustacheinc.com",
                "chris" => "chris@github.com",
                "tpw" => "tom@github.com",
                "scott" => "schacon@gmail.com",
                "rtomayko" => "ryan@github.com",
                "melissa" => "melissa@github.com",
                "pj" => "pj@github.com",
                "rick" => "technoweenie@gmail.com",
                "zach" => "zach@github.com",
                "kyle" => "kneath@gmail.com"
              }

      users[username.downcase] || username
    end
    
  end
end