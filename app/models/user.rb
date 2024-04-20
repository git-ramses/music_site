class User < ApplicationRecord
  # has_many :albums
  # add validation that user must have username and password
  validates :username, presence: true
  validates :password, presence: true

  ALTERNATIVE = "Alternative"
  AMBIENT = "Ambient"
  CLASSICAL = "Classical"
  ELECTRONIC = "Electronic"
  EXPERIMENTAL = "Experimental"
  FUNK = "Funk"
  JAZZ = "Jazz"
  ROCK = "Rock"
  SOUNDTRACK = "Soundtrack"

  GENRES = [
    ALTERNATIVE,
    AMBIENT,
    CLASSICAL,
    ELECTRONIC,
    EXPERIMENTAL,
    FUNK,
    JAZZ,
    ROCK,
    SOUNDTRACK
  ].freeze
end