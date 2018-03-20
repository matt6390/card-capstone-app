var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to the card collector!"
    };
  },
  created: function() {},
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
      card: [],
      message: "Page is being displayed"
    };
  },
  created: function() {
    axios.get("/cards/" + this.$route.params.id).then(
      function(response) {
        this.card = response.data;
      }.bind(this)
    );
  },
  methods: {},
  computed: {}
};

var MyCardsIndexPage = {
  template: "#my-cards-index-page",
  data: function() {
    return {
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
  methods: {},
  computed: {}
};

var MyCardShowPage = {
  template: "#my-card-show-page",
  data: function() {
    return {
      card: [],
      message: "Page is being displayed"
    };
  },
  created: function() {
    axios.get("/user_cards/" + this.$route.params.id).then(
      function(response) {
        this.card = response.data;
      }.bind(this)
    );
    // axios.get("http://yugiohprices.com/api/card_image/blue-eyes white dragon").then(
    //   function(response){
    //     this.image = response;
    //   }.bind(this));
  },
  methods: {},
  computed: {}
};

var MyCardCreatePage = {
  template: "#my-card-create-page",
  data: function() {
    return {
      errors: {},
      card: {},
      name: "",
      description: "",
      element: "",
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
          router.push("/user_cards/" + this.card.id + "/create");
        })
        .catch(
          function(error) {
            if(error) {
              // console.log(error);
              this.errors = error.response.data.errors;
              router.push("/cards");
            } 
          }.bind(this)
        );
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
      card: {},
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
      message: "Welcome to Vue.js!"
    };
  },
  created: function() {},
  methods: {},
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
          router.push("/");
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
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [ { path: "/", component: HomePage },
            { path: '/cards/all', component: CommunityCardsPage },
            { path: '/cards', component: MyCardCreatePage },
            { path: '/cards/:id', component: CommunityShowPage },
            { path: '/user_cards', component: MyCardsIndexPage },
            { path: '/user_cards/:id', component: MyCardShowPage },
            { path: '/user_cards/:id/create', component: MyUserCardCreatePage },
            { path: '/user_cards/:id/edit', component: MyCardEditPage },
            { path: '/user_cards/:id/delete', component: MyCardDestroyPage },
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




