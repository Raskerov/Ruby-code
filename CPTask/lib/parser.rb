# Returns the following:
# > list of webpages with most page views ordered from most pages views to less page views e.g.:
# /home 90 visits /index 80 visits etc...
# > list of webpages with most unique page views also ordered e.g.:
# /about/2 8 unique views /index 5 unique views etc...
require "pry"

class Parser
  def run
    weblog_array = sort_input_data(ARGV[0])
    most_visits = count_most_visits(weblog_array)
    most_uniq_visits = count_uniq_visits(weblog_array)

    puts 'Most visited pages'
    present_data(most_visits)
    puts '- - - - - - - - - - - - -'
    puts 'Most uniq visits'
    present_data(most_uniq_visits)
  end

  def sort_input_data(weblog_path)
    weblog_array = []
    File.readlines(weblog_path).each do |line|
      data = line.split
      if page_log = weblog_array.find { |log| log[:page] == data[0] }
        weblog_array.reject! { |log| log[:page] == page_log[:page] }
        page_log[:visits] << data[1]
      else
        page_log = { page: data[0], visits: [data[1]] }
      end
      weblog_array << page_log
    end
    weblog_array
  end

  def count_most_visits(weblog)
    data = []
    weblog.each do |page_log|
      page_data = { page: page_log[:page] }
      page_data[:visits] = page_log[:visits].size
      data << page_data
    end
    data.sort_by { |page_data| page_data[:total_visits] }.reverse
  end

  def count_uniq_visits(weblog)
    data = []
    weblog.each do |page_log|
      page_data = { page: page_log[:page] }
      page_data[:visits] = page_log[:visits].uniq.size
      data << page_data
    end
    data.sort_by { |page_data| page_data[:uniq_visits] }.reverse
  end

  def present_data(data)
    data.each do |value|
      puts "Page: #{value[:page]}  Visits: #{value[:visits]}"
    end
  end
end

Parser.new.run
