<template>
  <v-card class="mx-auto overflow-hidden">
    <v-app-bar color="deep-purple" dark>
      <v-app-bar-nav-icon @click="drawer = true"></v-app-bar-nav-icon>

      <v-toolbar-title>Gestor de Administrador</v-toolbar-title>
    </v-app-bar>

    <v-navigation-drawer v-model="drawer" absolute temporary>
      <v-list nav dense>
        <v-list-item-group
          v-model="group"
          active-class="deep-purple--text text--accent-4"
        >
          <v-list-item>
            <v-list-item-icon>
              <v-btn
                style="border: none"
                class="mx-2 mr-2"
                outlined
              >
                <v-icon>mdi-home</v-icon>
                Home
              </v-btn>
            </v-list-item-icon>
          </v-list-item>

          <v-list-item>
            <v-list-item-icon>
              <v-btn
                style="border: none"
                class="mx-2 mr-2"
                @click="logout"
                outlined
              >
                <v-icon>mdi-logout</v-icon>
                Cerrar Sesión
              </v-btn>
            </v-list-item-icon>
            <!-- <v-list-item-title>Cerrar Sesión</v-list-item-title> -->
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
    <div>
      <table-usuarios></table-usuarios>
    </div>
  </v-card>
</template>

<script>
export default {
  data: () => ({
    drawer: false,
    group: null,
  }),
  methods: {
    logout() {
      location.replace("/login");
    },
  },
};
</script>
