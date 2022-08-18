puts "Seeding API Data"
# Add seed data in this file
spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

spells.each do |spell|

    response = RestClient.get("https://www.dnd5eapi.co/api/spells/#{spell}")

    spell_hash = JSON.parse(response)

    Spell.create(
        name: spell_hash["name"],
        level: spell_hash["level"],
        description: spell_hash["desc"][0] # spell_hash["desc"] returns an array, so we need to access the first index to get just a string of the description
    )

end

puts "Done seeding"