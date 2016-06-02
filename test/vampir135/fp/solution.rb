module Vampir135
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        sum_rating_kinopoisk = 0
        array = array.map { |film| film if film['country'].to_s.include?(',') && film['rating_kinopoisk'].to_i > 0 }.compact
        array.each { |film| sum_rating_kinopoisk += film['rating_kinopoisk'].to_f }
        sum_rating_kinopoisk / array.size
      end

      def chars_count(films, threshold)
        koll = 0
        films = films.map { |film| film if film['rating_kinopoisk'].to_f >= threshold.to_f }.compact
        films.each do |film|
          if film['name'].to_s.include?('и')
            film['name'].each { |letter| koll += 1 if letter.to_s.include?('и') }
          end
        end
        koll
      end
    end
  end
end
