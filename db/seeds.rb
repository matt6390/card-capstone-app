User.create!([
  {name: "Matthew Stone", email: "matthew@gmail.com", password: "password", password_confirmation: "password"},
  {name: "Ariel Klingsporn", email: "ariel@gmail.com", password: "password", password_confirmation: "password"},
  {name: "Peter Komlofske", email: "peter@gmail.com", password: "password", password_confirmation: "password"},
  {name: "Jack Stone", email: "jack@gmail.com", password: "password", password_confirmation: "password"}
])
Card.create!([
  {name: "Kuriboh", description: "During your opponent's turn, at damage calculation: You can discard this card; you take no battle damage from that battle (this is a Quick Effect).", element: "Dark", race: "Fiend", rarity: "C"},
  {name: "Red-Eyes B. Dragon", description: "Filler Description", element: "Dark", race: "Dragon", rarity: "R"},
  {name: "Insect Queen", description: "Cannot declare an attack unless you Tribute 1 monster. This card gains 200 ATK for each Insect-Type monster on the field. During the End Phase, if this card destroyed an opponent's monster by battle this turn: Special Summon 1 \"Insect Monster Token\" (Insect-Type/EARTH/Level 1/ATK 100/DEF 100) in Attack Position.", element: "Earth", race: "Insect", rarity: "C"},
  {name: "Mirage Knight", description: "Cannot be Normal Summoned/Set. Must be Special Summoned by \"Dark Flare Knight\" and cannot be Special Summoned by other ways. During damage calculation only, this card gains ATK equal to the original ATK of the opponent's monster it is battling. During the End Phase of a turn this card attacked or was attacked: Banish this card.", element: "Light", race: "Warrior", rarity: "SR"},
  {name: "Blue-Eyes Ultimate Dragon", description: "Blue-Eyes White Dragon + \"Blue-Eyes White Dragon\" + \"Blue-Eyes White Dragon\"", element: "Light", race: "Dragon", rarity: "SR"},
  {name: "Black Luster Soldier", description: "You can Ritual Summon this card with \"Black Luster Ritual\".", element: "Earth", race: "Warrior", rarity: "GR"},
  {name: "Blue-Eyes Toon Dragon", description: "Cannot be Normal Summoned/Set. Must first be Special Summoned (from your hand) by Tributing 2 monsters, while you control \"Toon World\". Cannot attack the turn it is Special Summoned. You must pay 500 LP to declare an attack with this monster. If \"Toon World\" on the field is destroyed, destroy this card. Can attack your opponent directly, unless they control a Toon monster, in which case this card must target a Toon monster for its attacks.", element: "Light", race: "Dragon", rarity: "R"},
  {name: "Alien Shocktrooper", description: "The Aliens have used a mysterious biological substance to create a supreme race of soldiers. They do not have the natural powers of the other Aliens, but can make stunning physical attacks.", element: "Earth", race: "Reptile", rarity: "C"},
  {name: "Blue-Eyes White Dragon", description: "This legendary dragon is a powerful engine of destruction. Virtually invincible, very few have faced this awesome creature and lived to tell the tale.", element: "Light", race: "Dragon", rarity: "UR"},
  {name: "Rainbow Dragon", description: "This card is always treated as an \"Ultimate Crystal\" card. Cannot be Normal Summoned/Set. Must be Special Summoned (from your hand) by having 7 \"Crystal Beast\" cards with different names on your field and/or GY. This card cannot activate the following effects the turn it is Special Summoned. (Quick Effect): You can send all face-up \"Crystal Beast\" monsters you control to the GY; this card gains 1000 ATK for each monster sent to the GY. You can banish all \"Crystal Beast\" monsters from your GY; shuffle all cards on the field into the Deck.", element: "Light", race: "Dragon", rarity: "SE"}
])
UserCard.create!([
  {user_id: 3, card_id: 16, condition: "Good", style: nil, print_tag: "SKE-001"},
  {user_id: 1, card_id: 17, condition: "ok", style: nil, print_tag: "SKE-001"},
  {user_id: 3, card_id: 19, condition: "Bad", style: nil, print_tag: "DPBC-EN026"},
  {user_id: 4, card_id: 22, condition: "Excellent", style: nil, print_tag: "DCR-018"},
  {user_id: 4, card_id: 23, condition: "Great", style: nil, print_tag: "DLG1-EN001"},
  {user_id: 4, card_id: 24, condition: "Mint", style: nil, print_tag: "SYE-024"},
  {user_id: 4, card_id: 25, condition: "Decent", style: nil, print_tag: "RP01-EN050"},
  {user_id: 4, card_id: 27, condition: "Bad", style: nil, print_tag: "TAEV-EN006"},
  {user_id: 4, card_id: 28, condition: "Good", style: nil, print_tag: "TAEV-EN001"},
  {user_id: 1, card_id: 29, condition: "Great", style: nil, print_tag: "SKE-001"}
])
Comment.create!([
  {commentable_id: 0, user_id: 3, commentable_type: 0, text: "This is an amazing card that you have here."},
  {commentable_id: nil, user_id: 3, commentable_type: 0, text: "This is a cool card"},
  {commentable_id: 18, user_id: 3, commentable_type: 0, text: "I really like this card"},
  {commentable_id: 18, user_id: 3, commentable_type: 0, text: "This is a beautiful card"},
  {commentable_id: 17, user_id: 1, commentable_type: 0, text: "The red-est, Red-Eyed dragon."},
  {commentable_id: 17, user_id: 3, commentable_type: 0, text: "But I think that is is not the brightest red ever..."},
  {commentable_id: 18, user_id: 1, commentable_type: 0, text: "This is a comment left by the very first created account for this picture"},
  {commentable_id: 24, user_id: 1, commentable_type: 0, text: "Why does Peter get to have this card??? I want it!"},
  {commentable_id: 24, user_id: 4, commentable_type: 0, text: "Sorry Matt, but its mine"}
])
Price.create!([
  {card_id: 18, style: "SR", condition: "Good", source: "Myself", value: "25.0"},
  {card_id: 18, style: "SR", condition: "Good", source: "Myself", value: "25.0"},
  {card_id: 18, style: "SR", condition: "Good", source: "Myself", value: "15.0"},
  {card_id: 18, style: "SR", condition: "Good", source: "Myself", value: "20.0"},
  {card_id: 18, style: "SR", condition: "Good", source: "Myself", value: "25.0"},
  {card_id: 16, style: "C", condition: "good", source: "Its from Matthew", value: "2.0"},
  {card_id: 17, style: "R", condition: "good", source: "google.com", value: "20.0"},
  {card_id: 18, style: "C", condition: "bad", source: "myslef", value: "10.0"},
  {card_id: 24, style: "GR", condition: "Mint", source: "google.com", value: "200.0"},
  {card_id: 24, style: "GR", condition: "Great", source: "wikipedia.com", value: "215.5"}
])
