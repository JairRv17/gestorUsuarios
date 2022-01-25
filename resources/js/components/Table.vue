<template>
  <!-- <v-icon left> mdi-pencil </v-icon> -->
  <v-app>
    <v-main class="ml-5 mr-5">
      <v-container fluid>
        <h2>Usuarios</h2>
        <v-row>
          <v-col class="mt-5" md="1">
            <p>Buscar:</p>
          </v-col>
          <v-col md="4">
            <v-text-field label="Digite un nombre o apellido"></v-text-field>
          </v-col>
          <v-col class="text-right">
            <v-btn color="success" class="mr-5" rounded outlined>
              <v-icon left> mdi-account-check </v-icon>
              Guardar
            </v-btn>
            <v-btn color="primary" rounded outlined>
              <v-icon left> mdi-magnify </v-icon>
              Buscar
            </v-btn>
          </v-col>
        </v-row>
        <v-card>
          <v-card-title>
            <v-spacer></v-spacer>
            <v-col md="3">
              <v-text-field
                v-model="search"
                append-icon="mdi-magnify"
                label="Buscar"
                single-line
                hide-details
              ></v-text-field>
            </v-col>
          </v-card-title>
          <v-data-table
            :headers="headers"
            :items="desserts"
            :items-per-page="5"
            :search="search"
            class="elevation-1"
          >
            <template v-slot:item.actions="{ item }">
              <v-icon color="primary" class="mr-2"> mdi-pencil </v-icon>
              <v-icon color="red" small> mdi-delete </v-icon>
            </template>
          </v-data-table>
        </v-card>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import axios from "axios";
import swal from "sweetalert2";

export default {
  data() {
    return {
      search: "",
      headers: [
        { text: "Nombres", value: "FirstName", align: "start" },
        { text: "Apellidos", value: "LasName" },
        { text: "# Teléfono", value: "telefono" },
        { text: "Fecha Naciemiento", value: "DateOfBirth" },
        { text: "# Celular", value: "PhoneNumber" },
        { text: "Género", value: "Genre" },
        { text: "Discapacidad", value: "Disability" },
        { text: "Estado", value: "Estado" },
        { text: "Acciones", value: "actions", sortable: false },
      ],
      desserts: [],
      object: {
        Id: "",
        FirstName: "",
        LasName: "",
        DateOfBirth: "",
        Disability: "",
        Estado: "",
        PhoneNumber: "",
        Genre: "",
      },
    };
  },
  methods: {
    cargarDatos() {
      axios
        .get("/cargarDatos")
        .then(({ data }) => {
          console.log(data);
          const disability = data.disability;
          const person = data.person;
          const user = data.user;
          const genre = data.genre;
          for (let i = 0; i < person.length; i++) {
            this.object.Id = person[i].Id;
            this.object.FirstName = person[i].FirstName;
            this.object.LasName = person[i].LasName;
            this.object.DateOfBirth = person[i].DateOfBirth;
            this.object.Estado = person[i].IsActive == 1 ? "A" : "I";
            if (person[i].disability != null) {
              for (let j = 0; j < disability.length; j++) {
                if (person[i].disability.DisabilityId === disability[j].Id)
                  this.object.Disability = disability[j].Name;
              }
            }
            for (let j = 0; j < user.length; j++) {
              if (person[i].UserId === user[j].Id)
                this.object.PhoneNumber = user[j].PhoneNumber;
            }
            for (let j = 0; j < genre.length; j++) {
              if (person[i].GenreId === genre[j].Id)
                this.object.Genre = genre[j].Name;
            }

            this.desserts.push(this.object);
            this.object = {};
          }
        })
        .catch((error) => {
          swal.fire(
            "Hubo un error al cargar los datos!" + error,
            "Error",
            "error"
          );
        });
    },
  },
  mounted() {
    this.cargarDatos();
  },
};
</script>
