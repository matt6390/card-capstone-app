User.create!([
  {name: "Matthew Stone", email: "matthew@gmail.com", password_digest: "$2a$10$aQtAQQXw4y.pREh3gT.tJuXWCjZdb8u3BocwKY7i7eo/bWsHO75uS"},
  {name: "Ariel Klingsporn", email: "ariel@gmail.com", password_digest: "$2a$10$jA6v2raQ1C.JgBViLOuGGeUGudFtRtaMQmbke51wUFGBkFv3z9VM2"},
  {name: "Jack Stone", email: "jack@gmail.com", password_digest: "$2a$10$YmpkbYY3NglEBEdKumAQuuciISYn80azM9IHqFgJhVvQbeUDvXyd6"},
  {name: "Annie Stone", email: "annie@gmail.com", password_digest: "$2a$10$tALxiPCRMBX5BOVmzEEsdeCovIuAFzTbqYhuutX0KNT97biHO3jlS"},
  {name: "Peter Komlofske", email: "peter@gmail.com", password_digest: "$2a$10$oN88fA8JJc.5a1lVygSHF.5QYqf3MFlZdi251ewBaRYV4OysT6qAi"}
])
# Card.create!([
#   {name: "Kuriboh", description: "During your opponent's turn, at damage calculation: You can discard this card; you take no battle damage from that battle (this is a Quick Effect).", element: "Dark", race: "Fiend", rarity: "C"},
#   {name: "Red-Eyes B. Dragon", description: "Filler Description", element: "Dark", race: "Dragon", rarity: "R"},
#   {name: "Time Wizard", description: "Once per turn: You can toss a coin and call it. If you call it right, destroy all monsters your opponent controls. If you call it wrong, destroy as many monsters you control as possible, and if you do, take damage equal to half the total ATK those destroyed monsters had on the field.", element: "Light", race: "Spellcaster", rarity: "UR"},
#   {name: "Insect Queen", description: "Cannot declare an attack unless you Tribute 1 monster. This card gains 200 ATK for each Insect-Type monster on the field. During the End Phase, if this card destroyed an opponent's monster by battle this turn: Special Summon 1 \"Insect Monster Token\" (Insect-Type/EARTH/Level 1/ATK 100/DEF 100) in Attack Position.", element: "Earth", race: "Insect", rarity: "C"},
#   {name: "Winged Kuriboh", description: "If this card on the field is destroyed and sent to the Graveyard: For the rest of this turn, you take no battle damage.", element: "Light", race: "Fairy", rarity: "SR"},
#   {name: "Mirage Knight", description: "Cannot be Normal Summoned/Set. Must be Special Summoned by \"Dark Flare Knight\" and cannot be Special Summoned by other ways. During damage calculation only, this card gains ATK equal to the original ATK of the opponent's monster it is battling. During the End Phase of a turn this card attacked or was attacked: Banish this card.", element: "Light", race: "Warrior", rarity: "SR"},
#   {name: "Black Luster Soldier", description: "You can Ritual Summon this card with \"Black Luster Ritual\".", element: "Earth", race: "Warrior", rarity: "GR"},
#   {name: "Blue-Eyes Toon Dragon", description: "Cannot be Normal Summoned/Set. Must first be Special Summoned (from your hand) by Tributing 2 monsters, while you control \"Toon World\". Cannot attack the turn it is Special Summoned. You must pay 500 LP to declare an attack with this monster. If \"Toon World\" on the field is destroyed, destroy this card. Can attack your opponent directly, unless they control a Toon monster, in which case this card must target a Toon monster for its attacks.", element: "Light", race: "Dragon", rarity: "R"},
#   {name: "Blue-Eyes White Dragon", description: "This legendary dragon is a powerful engine of destruction. Virtually invincible, very few have faced this awesome creature and lived to tell the tale.", element: "Light", race: "Dragon", rarity: "UR"},
#   {name: "Rainbow Dragon", description: "This card is always treated as an \"Ultimate Crystal\" card. Cannot be Normal Summoned/Set. Must be Special Summoned (from your hand) by having 7 \"Crystal Beast\" cards with different names on your field and/or GY. This card cannot activate the following effects the turn it is Special Summoned. (Quick Effect): You can send all face-up \"Crystal Beast\" monsters you control to the GY; this card gains 1000 ATK for each monster sent to the GY. You can banish all \"Crystal Beast\" monsters from your GY; shuffle all cards on the field into the Deck.", element: "Light", race: "Dragon", rarity: "SE"},
#   {name: "Blue-Eyes Ultimate Dragon", description: "\"Blue-Eyes White Dragon\" + \"Blue-Eyes White Dragon\" + \"Blue-Eyes White Dragon\"", element: "Light", race: "Dragon", rarity: "SR"},
#   {name: "Dark Magician Girl", description: "Gains 300 ATK for every \"Dark Magician\" or \"Magician of Black Chaos\" in the GY.", element: "dark", race: "Spellcaster / Effect", rarity: "Secret Rare"},
#   {name: "Gamma The Magnet Warrior", description: "Alpha, Beta, and Gamma meld as one to form a powerful monster.", element: "earth", race: "Rock", rarity: "Common"},
#   {name: "Gearfried the Iron Knight", description: "When an Equip Card(s) is equipped to this card: Destroy that Equip Card(s).", element: "earth", race: "Warrior / Effect", rarity: "Super Rare"},
#   {name: "Gearfried the Swordmaster", description: "Cannot be Normal Summoned/Set. Must be Special Summoned by \"Release Restraint\" and cannot be Special Summoned by other ways. When an Equip Card(s) is equipped to this card: Target 1 monster your opponent controls; destroy that target.", element: "light", race: "Warrior / Effect", rarity: "Ultra Rare"}
# ])
# Deck.create!([
#   {name: "The Magnet Warriors", info: "Contains the 3 magnet warriors, as well as their combined form, Valkirion", user_id: 4},
#   {name: "My First Deck", info: "Need to add some cards to this", user_id: 1}
# ])
# DeckCard.create!([
#   {deck_id: 1, card_id: 23},
#   {deck_id: 1, card_id: 24},
#   {deck_id: 14, card_id: 79},
#   {deck_id: 14, card_id: 29},
#   {deck_id: 14, card_id: 17}
# ])
# Price.create!([
#   {card_id: 18, style: "SR", condition: "Good", source: "Myself", value: "25.0"},
#   {card_id: 18, style: "SR", condition: "Good", source: "Myself", value: "25.0"},
#   {card_id: 18, style: "SR", condition: "Good", source: "Myself", value: "15.0"},
#   {card_id: 18, style: "SR", condition: "Good", source: "Myself", value: "20.0"},
#   {card_id: 18, style: "SR", condition: "Good", source: "Myself", value: "25.0"},
#   {card_id: 16, style: "C", condition: "good", source: "Its from Matthew", value: "2.0"},
#   {card_id: 17, style: "R", condition: "good", source: "google.com", value: "20.0"},
#   {card_id: 18, style: "C", condition: "bad", source: "myslef", value: "10.0"},
#   {card_id: 24, style: "GR", condition: "Mint", source: "google.com", value: "200.0"},
#   {card_id: 24, style: "GR", condition: "Great", source: "wikipedia.com", value: "215.5"},
#   {card_id: 24, style: nil, condition: nil, source: "Hoping this one works", value: "225.0"},
#   {card_id: 29, style: nil, condition: nil, source: "gmail helped me", value: "25.0"},
#   {card_id: 29, style: nil, condition: nil, source: "yugioh.db", value: "48.0"},
#   {card_id: 29, style: nil, condition: nil, source: "yugioh.db again", value: "34.0"},
#   {card_id: 78, style: nil, condition: nil, source: "the Tardis", value: "18.0"},
#   {card_id: 29, style: nil, condition: nil, source: "google.com", value: "18.0"},
#   {card_id: 29, style: nil, condition: nil, source: "router push", value: "26.0"},
#   {card_id: 79, style: nil, condition: nil, source: "this is the first working price on this card", value: "15.0"},
#   {card_id: 23, style: nil, condition: nil, source: "gmail is my friend", value: "45.0"},
#   {card_id: 23, style: nil, condition: nil, source: "I heard about this price from my friend, who is very into YuGiOh", value: "40.0"},
#   {card_id: 78, style: nil, condition: "Peter Komlofske", source: "Because it will have my name on it", value: "25.0"},
#   {card_id: 79, style: nil, condition: "Peter Komlofske", source: "This is a weirdly designed card...", value: "3.0"},
#   {card_id: 82, style: nil, condition: "Peter Komlofske", source: "Its a little lower than the current market price", value: "2.56"},
#   {card_id: 78, style: nil, condition: "Peter Komlofske", source: "Ariel told me to", value: "12.0"},
#   {card_id: 23, style: nil, condition: "Peter Komlofske", source: "Josh told me too", value: "12.0"}
# ])
# UserCard.create!([
#   {user_id: 3, card_id: 16, condition: "Good", style: nil, print_tag: "SKE-001"},
#   {user_id: 1, card_id: 17, condition: "ok", style: nil, print_tag: "SKE-001"},
#   {user_id: 3, card_id: 19, condition: "Bad", style: nil, print_tag: "DPBC-EN026"},
#   {user_id: 4, card_id: 22, condition: "Excellent", style: nil, print_tag: "DCR-018"},
#   {user_id: 4, card_id: 23, condition: "Great", style: nil, print_tag: "DLG1-EN001"},
#   {user_id: 4, card_id: 24, condition: "Mint", style: nil, print_tag: "SYE-024"},
#   {user_id: 4, card_id: 25, condition: "Decent", style: nil, print_tag: "RP01-EN050"},
#   {user_id: 4, card_id: 27, condition: "Bad", style: nil, print_tag: "TAEV-EN006"},
#   {user_id: 1, card_id: 29, condition: "Great", style: nil, print_tag: "SKE-001"},
#   {user_id: 4, card_id: 78, condition: "Mint", style: nil, print_tag: "MRD-065"},
#   {user_id: 1, card_id: 79, condition: "Good", style: nil, print_tag: "GX1-EN002"},
#   {user_id: 4, card_id: 86, condition: "", style: nil, print_tag: "MFC-000"},
#   {user_id: 4, card_id: 87, condition: "Good", style: nil, print_tag: "SDMY-EN009"},
#   {user_id: 1, card_id: 88, condition: "Great", style: nil, print_tag: "PSV-101"},
#   {user_id: 1, card_id: 89, condition: "Meh", style: nil, print_tag: "FET-EN022"}
# ])
