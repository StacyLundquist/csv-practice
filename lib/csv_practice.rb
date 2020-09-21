require 'csv'
require 'awesome_print'

# FILEPATH = '../../data/athlete_events.csv'

def get_all_olympic_athletes(filename)
  olympic_medalists = []

  CSV.read(filename, headers: true).each do |record|
    medalist = {
        "ID" => record["ID"],
        "Name" => record["Name"],
        "Height" => record["Height"],
        "Team" => record["Team"],
        "Year" => record["Year"],
        "City" => record["City"],
        "Sport" => record["Sport"],
        "Event" => record["Event"],
        "Medal" => record["Medal"]
    }
    olympic_medalists << medalist
  end

  return olympic_medalists
end

# fields = %w[ID Name Height Team Year City Sport Event Medal]
  #
  # csv_table = CSV.read(filename, headers: true)
  # csv_array_of_hashes = csv_table.map(&:to_h)
  #
  # olympic_athletes = csv_array_of_hashes.select {|field, info| field.include? fields}
  #
  #
  # return olympic_athletes

def total_medals_per_team(olympic_data)
  total_medals_count = {}

  olympic_data.each do |olympic_medalist|
    if olympic_medalist["Medal"] != "NA"
      if total_medals_count[olympic_medalist["Team"]].nil?
        total_medals_count[olympic_medalist["Team"]] = 1
      else
        total_medals_count[olympic_medalist["Team"]] += 1
      end
    end
  end

  return total_medals_count
  # total_medals = olympic_data.find_all {|medals| [medals]["Medal"] != "NA"}
  # return total_medals
end

def get_all_gold_medalists(olympic_data)
  return olympic_data.filter do |gold| gold["Medal"] == "Gold" end
end
