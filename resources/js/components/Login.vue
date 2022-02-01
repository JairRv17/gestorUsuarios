<template>
  <v-app id="inspire">
    <v-main>
      <v-container fluid fill-height>
        <v-layout justify-center>
          <v-flex xs12 sm8 md4>
            <v-card class="elevation-12">
              <v-toolbar dark color="secondary">
                <v-toolbar-title>Login</v-toolbar-title>
              </v-toolbar>
              <v-card-text>
                <v-form>
                  <v-text-field
                    autofocus
                    prepend-icon="mdi-account"
                    name="login"
                    label="Email"
                    type="text"
                    v-model="form.email"
                  ></v-text-field>
                  <v-text-field
                    id="password"
                    prepend-icon="mdi-lock"
                    name="password"
                    label="Password"
                    type="password"
                    @keyup.enter="loguear"
                    v-model="form.password"
                  ></v-text-field>
                </v-form>
              </v-card-text>
              <div class="text-center">
                <v-btn class="mb-3" color="secondary" @click="loguear"
                  >Login</v-btn
                >
              </div>
            </v-card>
          </v-flex>
        </v-layout>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import Swal from "sweetalert2";
import axios from "axios";
export default {
  data() {
    return {
      form: {
        email: "",
        password: "",
      },
    };
  },
  methods: {
    loguear() {
      axios
        .post("login", this.form)
        .then(({ data }) => {
          if (data) location.replace("/usuarios");
          else
            Swal.fire(
              "Credenciales incorrectas",
              "Email o contraseña incorrecta",
              "error"
            );
        })
        .catch((error) => {
          Swal.fire("Hubo un error " + error, "", "error");
        });
    },
  },
};
</script>

<style></style>
