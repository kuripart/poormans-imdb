oneth = 1000
twoth = 2000
threeth = 3000
forth = 4000
fifth = 5000

oneth.times do
    name = Faker::Name.name_with_middle
    dob = Faker::Date.between(from: '1970-09-23', to: '2000-09-25')
    sex = Faker::Gender.short_binary_type
    Director.create(name: name, dob: dob, sex: sex)
end


oneth.times do
    name = Faker::Name.name_with_middle
    dob = Faker::Date.between(from: '1970-09-23', to: '2000-09-25')
    sex = Faker::Gender.short_binary_type
    Actor.create(name: name, dob: dob, sex: sex)
end

twoth.times do
    name = Faker::Movie.title
    year = rand 1800...2000
    media_type = ['tv', 'anime', 'movie'].sample
    Medium.create(name: name, year: year, media_type: media_type)
end


twoth.times do
    review_type = ['user', 'critic'].sample
    rate = rand 0...5
    media = Faker::Movie.title
    Review.create(media: media, rate: rate, review_type: review_type)
end

