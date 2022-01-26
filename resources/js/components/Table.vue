<template>
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
            <!--
            <v-btn color="success" class="mr-5" rounded outlined>
              <v-icon left> mdi-account-check </v-icon>
              Guardar
            </v-btn>
            -->
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
            <template v-slot:item.Estado="props">
              <v-edit-dialog
                :return-value.sync="props.item.Estado"
                large
                persistent
                @save="update(props.item)"
              >
                <div>{{ props.item.Estado }}</div>
                <template v-slot:input>
                  <div class="mt-4 text-h6">Actualizar</div>
                  <v-text-field
                    v-model="props.item.Estado"
                    :rules="[max1chars]"
                    label="Edit"
                    single-line
                    counter
                    autofocus
                  ></v-text-field>
                </template>
              </v-edit-dialog>
            </template>
            <template v-slot:item.actions="{ item }">
              <!--
              <v-btn
                class="mx-2 mr-2"
                fab
                dark
                small
                outlined
                @click="editar(item.Id)"
              >
                <v-icon color="primary"> mdi-pencil </v-icon>
              </v-btn>
              -->
              <v-btn
                class="mx-2 mr-2"
                fab
                dark
                small
                outlined
                @click="delete item.Id"
              >
                <v-icon color="red" small> mdi-delete </v-icon>
              </v-btn>
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
const moment = require("moment");

export default {
  data() {
    return {
      search: "",

      headers: [
        { text: "Nombres", value: "FirstName", align: "start" },
        { text: "Apellidos", value: "LasName" },
        { text: "# Celular", value: "PhoneNumber" },
        { text: "Fecha Naciemiento", value: "DateOfBirth" },
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
      max1chars: (v) => v.length == 1 || "Ingrese A (activo) o I (inactivo)",
    };
  },
  methods: {
    cargarDatos() {
      axios
        .get("/cargarDatos")
        .then(({ data }) => {
          //console.log(data);
          const disability = data.disability;
          const person = data.person;
          const user = data.user;
          const genre = data.genre;
          for (let i = 0; i < person.length; i++) {
            this.object.Id = person[i].Id;
            this.object.FirstName = person[i].FirstName;
            this.object.LasName = person[i].LasName;
            if (person[i].DateOfBirth != null)
              this.object.DateOfBirth = moment(
                new Date(person[i].DateOfBirth)
              ).format("YYYY-MM-DD");
            else this.object.DateOfBirth = null;
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
    delete(id) {
      console.log(id);
    },
    /*
    editar(id) {
      console.log(id);
    },
    */

    update(usuario) {
      axios
        .put("/usuario", usuario)
        .then(({ data }) => {
          console.log(data);
          swal.fire("Estado actualizado", "", "success");
        })
        .catch( error => {
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
