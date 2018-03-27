var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      comCards: [],
      myCards: [],
      myDecks:[],
      message: "Welcome to the Yu-Gi-Stone Card Completist!"
    };
  },
  created: function() {
    axios.get("/user").then(
      function(response) {
        axios.get("/cards").then(
          function(response) {
            this.comCards = response.data;
            axios.get("/user_cards").then(
              function(response) {
                this.myCards = response.data;
                
              }.bind(this)
            );
          }.bind(this)
        )
      }.bind(this))
      .catch(function(error) {
          this.errors = error.response.data.errors;
          router.push("/login/");
        }.bind(this));


    ;
  },
  methods: {},
  computed: {}
};

var CommunityCardsPage = {
  template: "#community-cards-page",
  data: function() {
    return {
      message: "Running",
      cards: []
    };
  },
  created: function() {
    axios.get("/cards").then(
      function(response) {
        this.cards = response.data;
        this.cards = this.cards.reverse();
      }.bind(this)
    );
  },
  methods: {},
  computed: {}
};

var CommunityShowPage = {
  template: "#community-show-page",
  data: function() {
    return {
      card: {user:{}, user_card:{print_tag:{}}},
      prices: [],
      corsUrl: "https://cors-anywhere.herokuapp.com/",
      printUrl: "http://yugiohprices.com/api/price_for_print_tag/",
      pictureUrl: "http://yugiohprices.com/api/card_image/",
      imgUrl: "http://yugiohprices.com/api/card_image/",
      imgCardName: "",
      searchPrice: [],
      searchCardName: "",
      searchCardPrintTag: "",
      errors: {},
      value: "",
      source: "",
      cardId: this.$route.params.id,
      message: "Page is being displayed"
    };
  },
  created: function() {
    axios.get("/cards/" + this.$route.params.id).then(
      function(response) {
        this.card = response.data;
        this.prices = response.data.prices;
        this.imgCardName = this.imgUrl + this.card.name;
        if (this.card.prices.length > 3) {
        // console.log("Has 4 or more prices");
          document.getElementById("pricesTab").classList.add('table-card-limit');
        }
      }.bind(this)
    );
    // axios.get('http://yugiohprices.com/api/card_image/blue-eyes white dragon').then(
    //   function(response) {
    //     console.log(response);
    //   }.bind(this)
    // );
    // console.log(this.$route.params.id);
  },
  methods: {
    submit: function() {
      var params = {
        card_id: this.cardId,
        value: this.value,
        source: this.source
      };
      axios
        .post("/prices", params)
        .then(function(response) {
          // console.log(response.config.data);
          location.reload();
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
            router.push("/cards/" + this.$route.params.id);
          }.bind(this)
        );
      // console.log(this.card);
    },
    getMarketPrices: function() {
      document.getElementById("pricesTab").classList.remove('table-card-limit');
      // console.log(this.card.name);
      // console.log(this.card.user_card.print_tag);

      this.searchCardPrintTag = this.card.user_card.print_tag;

      // console.log(this.searchCardName)
      // console.log("http://yugiohprices.com/api/price_for_print_tag/" + this.searchCardPrintTag)

      axios
        .get(this.corsUrl + this.printUrl + this.searchCardPrintTag)
        .then(function(response) {
          this.searchPrice = response.data.data.price_data.price_data.data.prices;
          // console.log(this.searchPrice);
        }.bind(this));
    },

    changeTableSize: function() {
      if (this.card.prices.length > 3) {
        // console.log("Has 4 or more prices");
        document.getElementById("pricesTab").classList.add('table-card-limit');
      } else {
        console.log("Not enough prices");
      }
    },
  },
  computed: {
    shiftCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift;
      return (this.searchPrice.average * num).toFixed(2);
    },
    threeCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_3;
      return (this.searchPrice.average * num).toFixed(2);
    },
    sevenCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_7;
      return (this.searchPrice.average * num).toFixed(2);
    },
    twentyoneCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_21;
      return (this.searchPrice.average * num).toFixed(2);
    },
    thirtyCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_30;
      return (this.searchPrice.average * num).toFixed(2);
    },
    ninetyCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_90;
      return (this.searchPrice.average * num).toFixed(2);
    },
    one8CurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_180;
      return (this.searchPrice.average * num).toFixed(2);
    },
    yearCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_365;
      return (this.searchPrice.average * num).toFixed(2);
    }
  }
};

var MyCardsIndexPage = {
  template: "#my-cards-index-page",
  data: function() {
    return {
      user: [],
      cards: [{card:{user_card:{}}}]
    };
  },
  created: function() {
    axios.get("/users")
      .then(function(response) {
        this.user = response.data;
        axios.get("/user_cards").then(
          function(response) {
            // console.log(response.data);
            this.cards = response.data;
          }.bind(this))
          .catch(
            function(error) {
              this.errors = error.response.data.errors;
              router.push("/login");
            }.bind(this)
          );
     }.bind(this))
    .catch(function(error) {
      this.errors = error.response.data.errors;
      router.push("/login");
    }.bind(this));

  },
  methods: {},
  computed: {}
};

var MyCardShowPage = {
  template: "#my-card-show-page",
  data: function() {
    return {
      card: {card:{user_card:{}}},
      price: [],
      computePrices: [],
      corsUrl: "https://cors-anywhere.herokuapp.com/",
      printUrl: "http://yugiohprices.com/api/price_for_print_tag/",
      pictureUrl: "http://yugiohprices.com/api/card_image/",
      imgUrl: "http://yugiohprices.com/api/card_image/",
      searchPrice: [],
      errors: {},
      value: "",
      source: "",
      cardId: this.$route.params.id,
      searchCardName: "",
      searchCardPrintTag: "",
      message: "Page is being displayed"
    };
  },
  created: function() {
    axios.get("/user_cards/" + this.$route.params.id).then(
      function(response) {
        // console.log(response.data);
        this.card = response.data;
        this.searchCardName = 'http://yugiohprices.com/api/card_image/' + this.card.card.name;
        if (this.card.card.prices.length > 3) {
        // console.log("Has 4 or more prices");
          document.getElementById("pricesTab").classList.add('table-card-limit');
        }
        // console.log("B");
        // console.log(this.corsUrl + this.pictureUrl + this.searchCardName);
        // console.log("A");
        // axios.get(this.corsUrl + this.pictureUrl + this.searchCardName).then(
        //   function(response){
        //     console.log(response);
        //   }.bind(this));
      }.bind(this)
    )
      .catch(
        function(error) {
          this.errors = error.response.data.errors;
          router.push("/login");
        }.bind(this)
      );


  },
  methods: {
    submit: function() {      
      var params = {
        card_id: this.cardId,
        value: this.value,
        source: this.source
      };
      axios
        .post("/prices", params)
        .then(function(response) {
          location.reload();
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
            router.push("/user_cards/" + this.$route.params.id);
          }.bind(this)
        );
      // console.log(this.card);
    },
    getMarketPrices: function() {
      document.getElementById("pricesTab").classList.remove('table-card-limit');
      // console.log(this.card.card.name);
      // console.log(this.card.card.user_card.print_tag);

      this.searchCardPrintTag = this.card.card.user_card.print_tag;

      // console.log(this.searchCardName)
      // console.log("http://yugiohprices.com/api/price_for_print_tag/" + this.searchCardPrintTag)

      axios
        .get(this.corsUrl + this.printUrl + this.searchCardPrintTag)
        .then(function(response) {
          this.searchPrice = response.data.data.price_data.price_data.data.prices;
        // console.log(this.searchPrice);
        }.bind(this));
    },

    changeTableSize: function() {
      if (this.card.card.prices.length > 3) {
        // console.log("Has 4 or more prices");
        document.getElementById("pricesTab").classList.add('table-card-limit');
      }
    },
    
  },
  computed: {
    shiftCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift;
      return (this.searchPrice.average * num).toFixed(2);
    },
    threeCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_3;
      return (this.searchPrice.average * num).toFixed(2);
    },
    sevenCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_7;
      return (this.searchPrice.average * num).toFixed(2);
    },
    twentyoneCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_21;
      return (this.searchPrice.average * num).toFixed(2);
    },
    thirtyCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_30;
      return (this.searchPrice.average * num).toFixed(2);
    },
    ninetyCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_90;
      return (this.searchPrice.average * num).toFixed(2);
    },
    one8CurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_180;
      return (this.searchPrice.average * num).toFixed(2);
    },
    yearCurrentPrice: function() {
      var num = 1 + this.searchPrice.shift_365;
      return (this.searchPrice.average * num).toFixed(2);
    }
  }
};

var MyCardCreatePage = {
  template: "#my-card-create-page",
  data: function() {
    return {
      errors: {},
      card: [],
      userCard: [],
      searchCard: [],
      corsUrl: "https://cors-anywhere.herokuapp.com/",
      printUrl: "http://yugiohprices.com/api/price_for_print_tag/",
      infoUrl: "http://yugiohprices.com/api/card_data/",
      searchTag: "",
      name: "",
      printTag: "",
      description: "",
      element: "",
      condition: "",
      race: "",
      rarity: ""
    };
  },
  created: function() {},
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        description: this.description,
        element: this.element,
        race: this.race,
        rarity: this.rarity
      };
      axios
        .post("/cards", params)
        .then(function(response) {
          this.card = response.data;
          // console.log(this.card.id);
          var params1 = {
            card_id: this.card.id,
            condition: this.condition,
            print_tag: this.searchTag
          };
          axios
            .post("/user_cards", params1)
            .then(
              function(response) {
                this.userCard = response.data;
                // console.log(this.userCard);
                router.push("/user_cards");
              }.bind(this))
            .catch(function(error) {
              this.errors = error.response.data.errors;
              router.push("/cards");
            }.bind(this));
        }.bind(this))
        .catch(
          function(error) {
            if(error) {
              // console.log(error);
              this.errors = error.response.data.errors;
              router.push("/cards");
            } 
          }.bind(this)
        );
    },


    cardSearch: function() {
      this.searchTag = this.searchTag.toUpperCase();
      // console.log(this.corsUrl + this.printUrl + this.searchTag);
      
      axios
        .get(this.corsUrl + this.printUrl + this.searchTag)
        .then(function(response) {
          this.searchCard = response.data.data;
          // console.log(this.searchCard);
          this.name = this.searchCard.name;
          this.race = this.searchCard.type;
          this.element = this.searchCard.family;
          this.rarity = this.searchCard.price_data.rarity;
          axios
            .get(this.corsUrl + this.infoUrl + this.name)
            .then(function(response) {
              // console.log(response.data.data);
              this.description = response.data.data.text;
 
            }.bind(this));
        }.bind(this));
    }

  },
  computed: {}
};

var MyCardCreateSearchPage = {
  template: "#my-card-create-search-page",
  data: function() {
    return {
      errors: [],
      corsUrl: "https://cors-anywhere.herokuapp.com/",
      printUrl: "http://yugiohprices.com/api/price_for_print_tag/",
      name: "",
      printTag: "",
      message: "Welcome to the card collector!"
    };
  },
  created: function() {},
  methods: {
    cardSearch: function() {
      axios
      .get(this.corsUrl + this.printUrl + this.printTag)
      .then(function(response) {
        // console.log(response.data.data);
      }.bind(this))
    }
  },
  computed: {}
};

var MyUserCardCreatePage = {
  template: "#my-user-card-create-page",
  data: function() {
    return {
      errors: {},
      card: {},
      cardId: this.$route.params.id,
      condition: "",
      printTag: ""
    };
  },
  created: function() {},
  methods: {
    submit: function() {
      var params = {
        card_id: this.cardId,
        condition: this.condition,
        print_tag: this.printTag
      };
      axios
        .post("/user_cards", params)
        .then(function(response) {
          router.push("/user_cards");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
            router.push("/user_cards/" + this.$route.params.id + "/create");
          }.bind(this)
        );
        // console.log(this.card);
    }

  },
  computed: {}
};

var MyCardEditPage = {
  template: "#my-card-edit-page",
  data: function() {
    return {
      card: [],
      name: "",
      description: "",
      element: "",
      race: "",
      rarity: "",
      errors: []
    };
  },
  created: function() {
    axios.get("/cards/" + this.$route.params.id).then(
      function(response) {
        // console.log(card);
        this.card = response.data;
        this.name = this.card.name;
        this.description = this.card.description;
        this.element = this.card.element;
        this.race = this.card.race;
        this.rarity = this.card.rarity;
      }.bind(this)
    );
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        description: this.description,
        element: this.element,
        race: this.race
      };
      axios
        .patch("/cards/" + this.$route.params.id, params)
        .then(
          function(response) {
            router.push("/user_cards/" + response.data.id);
          }.bind(this)
        )
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
            router.push("/login");
          }.bind(this)
        );
    }
  },
  computed: {}
};

var MyCardDestroyPage = {
  template: "#my-card-destroy-page",
  data: function() {
    return {
      message: "Welcome to destroy page!"
    };
  },
  created: function() {
    axios
      .delete('/user_cards/' + this.$route.params.id)
      .then(
        function(response) {
          // console.log("User Card Deleted");
          axios
          .delete('/cards/' + this.$route.params.id)
          .then(
            function(response) {
              // console.log("Card Deleted");
            }.bind(this)
          )
          .catch(
            function(errors) {
              this.errors = error.response.data.errors;
              router.push("/user_cards/" + this.$route.params.id);
            }.bind(this))
        }.bind(this)
      )
      .catch(
        function(errors) {
          this.errors = error.response.data.errors;
          router.push("/user_cards/" + this.$route.params.id);
        }.bind(this))
  },
  methods: {},
  computed: {}
};

var MyDecksIndexPage = {
  template: "#my-decks-index-page",
  data: function() {
    return {
      decks: [],
      message: "Welcome to decks index page!"
    };
  },
  created: function() {
    axios.get("/decks/").then(
      function(response) {
        this.decks = response.data;
      }.bind(this)
    ).catch(
        function(errors) {
          this.errors = error.response.data.errors;
          router.push("/decks/" + this.$route.params.id);
        }.bind(this));
  },
  methods: {},
  computed: {}
};

var MyDeckShowPage = {
  template: "#my-deck-show-page",
  data: function() {
    return {
      deck: [],
      errors: [],
      deckId: this.$route.params.id,
      message: "Page is being displayed"
    };
  },
  created: function() {
    axios.get("/decks/" + this.$route.params.id).then(
      function(response) {
        this.deck = response.data;
        // console.log(this.deck.cards.length)
      }.bind(this)
    );
  },
  methods: {
    deleteDeck: function() {
      axios
        .delete("/decks/" + this.deckId)
        .then(function(response) {
          for (var i = this.deck.cards.length; i > 0; i--) {
            axios
              .delete("/deck_cards/" + this.deckId)
              .then(function(response) {
                // console.log("DeckCard Destroyed")
              }.bind(this))
              .catch(function(errors) {
                this.errors = error.response.data.errors;
                router.push("/decks/" + this.deckId);
              }.bind(this))
          }
          // console.log("Deck Destroyed");
          router.push("#/decks/destroy");
        }.bind(this))
        .catch(function(error) {
          this.errors = error.response.data.errors;
          router.push("/decks/" + this.deckId);
        }.bind(this))
    },

    deleteCard: function(card) {
      // console.log(card)
      
    }
  },
  computed: {}
};

var MyDeckCreatePage = {
  template: "#my-deck-create-page",
  data: function() {
    return {
      errors: {},
      name: "",
      info: "",
      deck: {}
    };
  },
  created: function() {},
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        info: this.info
      };
      axios
        .post("/decks", params)
        .then(function(response) {
          this.deck = response.data;
          router.push("/decks");
        })
        .catch(
          function(error) {
            if(error) {
              // console.log(error);
              this.errors = error.response.data.errors;
              router.push("/decks");
            } 
          }.bind(this)
        );
    }

  },
  computed: {}
};

var MyDeckDestroyPage = {
  template: "#my-deck-destroy-page",
  data: function() {
    return {
      message: "Welcome to deck destroy page!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var DeckCardsChoicePage = {
  template: "#deck-cards-choice-page",
  data: function() {
    return {
      addCards: [],
      dropCards: "",
      errors: {},
      deckCards: [],
      cards: []
    };
  },
  created: function() {
    axios.get("/user_cards").then(
      function(response) {
        this.cards = response.data;
      }.bind(this)
    );
  },
  methods: {
    addToDeck: function(card) {
      // console.log("working");
      // console.log(card.card.id);

      if (this.addCards.includes(card.card.id)) {
        var cardId = this.addCards.indexOf(card.card.id);
        // console.log(cardId);
        this.addCards.splice(cardId, 1);
        // console.log("Removed Card from array");
      } else  {
        this.addCards.push(card.card.id);
        // console.log("Added Card to array");
        // if (dropCards === "") {
        //   this.dropCards += card.card.name
        // } else  {
        //   this.dropCards += " + " + card.card.name
        // }
      }
      // console.log(this.addCards)
    },
    cardsToAdd: function() {
      for (var i = this.addCards.length; i > 0; i--) {
        // console.log(this.addCards[i - 1]);
        var params = {
          deck_id: this.$route.params.id,
          card_id: this.addCards[i - 1]
        };
        axios
          .post("/deck_cards", params)
          .then(function(response) {
            this.deckCards = response.data;
            // console.log(this.deckCards.deck);
            router.push("/decks/" + this.deckCards.deck);
          })
          .catch(
            function(error) {
              if(error) {
                console.log(error);
                this.errors = error.response.data.errors;
                router.push("/user_cards/" + this.$route.params.id + "/choice");
              } 
            }.bind(this)
          );

      }
    }
  },
  computed: {}
};

var UserShowPage = {
  template: "#user-show-page",
  data: function() {
    return {
      user: {},
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: [],
      message: "Welcome to user show page!"
    };
  },
  created: function() {
    axios.get("/users/")
    .then(function(response) {
      this.user = response.data;
      this.name = this.user.name;
      this.email = this.user.email;
      // console.log(this.user);
    }.bind(this))
    .catch(function(error) {
      this.errors = error.response.data.errors;
      router.push("/login");
    }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password
      };
      axios
      .patch("/users", params)
      .then(function(response) {
        // console.log(response.data);
      }.bind(this))
      .catch(function(error) {
        this.errors = error.response.data.errors;
      }.bind(this));
    }
  },
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/user_cards");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/login");
  }
};

var router = new VueRouter({
  routes: [ { path: "/", component: HomePage },
            { path: '/cards/all', component: CommunityCardsPage },
            { path: '/cards/search', component: MyCardCreateSearchPage },
            { path: '/cards', component: MyCardCreatePage },
            { path: '/cards/:id', component: CommunityShowPage },
            { path: '/user_cards', component: MyCardsIndexPage },
            { path: '/user_cards/:id', component: MyCardShowPage },
            { path: '/user_cards/:id/choice', component: DeckCardsChoicePage },
            { path: '/user_cards/:id/create', component: MyUserCardCreatePage },
            { path: '/user_cards/:id/edit', component: MyCardEditPage },
            { path: '/user_cards/:id/delete', component: MyCardDestroyPage },
            { path: '/decks', component: MyDecksIndexPage },
            { path: '/decks/create', component: MyDeckCreatePage },
            { path: '/decks/destroy', component: MyDeckDestroyPage },
            { path: '/decks/:id', component: MyDeckShowPage },
            { path: '/user', component: UserShowPage },
            { path: "/logout", component: LogoutPage },
            { path: '/login', component: LoginPage },
            { path: '/signup', component: SignupPage }
          ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});