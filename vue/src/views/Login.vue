<template>
<body>
<div class="bg">
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <h1 id="header" class="h3 mb-3 font-weight-normal">The Usual?</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <div class="big-box">
      <div class="box">
      <label for="username" class="sr-only">Username:  </label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      </div>
      <div class="box">
      <label for="password" class="sr-only">Password:  </label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      </div>
      <div class="lil-box">
        <button type="submit" id="signin" >Sign in</button>
      </div>
      <div class="lil-box">
      <router-link :to="{ name: 'register' }"  class="need-account" >Need an account?</router-link>
      <router-link :to="{ name: 'home' }" class="need-account" >Continue as Guest</router-link>
      </div>
      </div>
    
    </form>
  </div>
</div>
</body>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style>
.form-signin {
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  align-items: center;
}
.need-account{
  text-align: center;
}
h1{
  display: flex;
}
</style>
