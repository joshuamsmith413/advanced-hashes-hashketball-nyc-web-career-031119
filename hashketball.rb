# Write your code here!
#require "pry"
require "pry"
def game_hash
  game = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson":
        {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans":
        {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez":
        {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee":
        {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry":
        {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players:
      {
        "Jeff Adrien":
        {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo":
        {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop":
        {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon":
        {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },
      "Brendan Haywood":
      {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12
      }
      }
    }
  }
end

def num_points_scored(player)
#game_hash[:away][:players][:(player)][:points]
foo = 0
game_hash.each do |location, team_data|
  team_data.each do |attribute, data|
     if attribute == :players
       data.each do |name, stats|
         if name == :"#{player}"
         stats.each do |player_points, point_value|
           if player_points == :points
           foo += point_value
           end
         end
       end
         end
     end
  end
end
foo
end

def shoe_size(player)
  foo = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
       if attribute == :players
         data.each do |name, stats|
           if name == :"#{player}"
           stats.each do |player_shoe, size|
             if player_shoe == :shoe
             foo += size
             end
           end
         end
           end
       end
    end
  end
  foo
end

def team_colors(team)
  #game_hash[:away][:team_colors]
  foo = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.include? "#{team}"
        foo << team_data[:colors]
      end
end
  end
  foo.flatten
end

def team_names
  foo = []
  game_hash.each do |location, team_data|
    if team_data.include? :team_name
      foo << team_data[:team_name]
    end
  end
  foo
end

def player_numbers(team)
foo = []
  game_hash.each do |location, team_data|
    if team_data[:team_name].include? "#{team}"
      team_data.each do |k, v|
        if k == :players
          v.each do |name, stats|
              stats.each do |stat_line, val|
                if stat_line == :number
                  foo << val
                end
              end
          end
          end
      end
    end
end
foo
end

def player_stats(player)
foo = {}
  game_hash.each do |location, team_data|
    team_data.each do |data, player_name|
    if data == :players
      player_name.each do |name, stats|
        if name == :"#{player}"
          foo = stats
        end
      end
    end
  end
  end
foo
end

def big_shoe_rebounds
  foo = 0
  bar = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, stats|
          stats.each do |stats, val|
            if stats == :shoe
              if val > bar
                bar = val
            end
          end
        end
      end
    end
      if  attribute == :players
        data.each do |names, stats|
          stats.each do |stat_line, val|
            if stat_line == :shoe
              if val == bar
                foo = stats[:rebounds]
              end
            end
          end
        end
        end
    end
  end
  foo
end


  def winning_team
  foo = 0
  bar = 0
  winner = ""
  game_hash[:home][:players].each do |name, stats|
  stats.each do |data, item|
  if data == :points
  foo += item
  end
  end
  end
  game_hash[:away][:players].each do |name, stats|
  stats.each do |data, item|
  if data == :points
  bar += item
  end
  end
  end
  if foo > bar
  winner = game_hash[:home][:team_name]
  else
  winner = game_hash[:away][:team_name]
  end
  winner
  end

  def most_points_scored
    foo = {}
      game_hash.each do |location, team_data|
        team_data.each do |data, player_name|
        if data == :players
          player_name.each do |name, stats|
            if name == :"#{player}"
              foo = stats
            end
          end
        end
      end
      end
    foo
  end
