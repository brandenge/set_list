require 'rails_helper'

RSpec.describe 'the songs show page', type: :feature do
  let!(:artist) { Artist.create!(name: 'Carly Rae Jepsen') }
  let!(:song_1) do
    Song.create!(title:       "I Really Like You",
                 length:      208,
                 play_count:  243810867,
                 artist_id:   artist.id)
  end
  let!(:song_2) do
    Song.create!(title:       "Call Me Maybe",
                 length:      199,
                 play_count:  1214722172,
                 artist_id:   artist.id)
  end

  it 'displays the song title' do
    visit "/songs/#{song_1.id}"

    expect(page).to have_content(song_1.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of the artist for the song' do
    visit "/songs/#{song_1.id}"

    expect(page).to have_content(artist.name)
  end
end
