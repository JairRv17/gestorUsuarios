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
          <!-- <v-card-title>
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
          </v-card-title> -->
          <v-data-table
            :headers="headers"
            :items="desserts"
            :items-per-page="5"
            :search="search"
            class="elevation-1"
          >
            <template v-slot:top>
              <v-toolbar flat>
                <v-toolbar-title>
                  <img width="50" src="https://scontent.fgye1-2.fna.fbcdn.net/v/t1.6435-9/86875447_140016354154346_2161150165216395264_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=wYKov-uUBWEAX_lZEQw&_nc_ht=scontent.fgye1-2.fna&oh=00_AT-G0kanZM-d_DVdmBb9eUgsa8kzgnXGWTP040zt1lx6sg&oe=621AF931">
                </v-toolbar-title>
                <v-divider class="mx-4" inset vertical></v-divider>
                <v-spacer></v-spacer>
                <v-text-field
                  v-model="search"
                  append-icon="mdi-magnify"
                  label="Buscar"
                  single-line
                  hide-details
                ></v-text-field>
                <v-dialog v-model="dialog" max-width="500px">
                  <v-card>
                    <v-card-title>
                      <span class="text-h5">Editar</span>
                    </v-card-title>

                    <v-card-text>
                      <v-container>
                        <v-row>
                          <v-col cols="12" sm="6" md="4">
                            <v-text-field
                              v-model="editedItem.Estado"
                              label="Estado"
                            ></v-text-field>
                          </v-col>
                        </v-row>
                      </v-container>
                    </v-card-text>

                    <v-card-actions>
                      <v-spacer></v-spacer>
                      <v-btn color="blue darken-1" text @click="close">
                        Cancelar
                      </v-btn>
                      <v-btn color="blue darken-1" text @click="save">
                        Guardar
                      </v-btn>
                    </v-card-actions>
                  </v-card>
                </v-dialog>
                <v-dialog v-model="dialogDelete" max-width="500px">
                  <v-card>
                    <v-card-title class="text-h5"
                      >¿Deseas eliminar este usuario?</v-card-title
                    >
                    <v-card-actions>
                      <v-spacer></v-spacer>
                      <v-btn color="blue darken-1" text @click="closeDelete"
                        >Cancelar</v-btn
                      >
                      <v-btn
                        color="blue darken-1"
                        text
                        @click="deleteItemConfirm"
                        >OK</v-btn
                      >
                      <v-spacer></v-spacer>
                    </v-card-actions>
                  </v-card>
                </v-dialog>
              </v-toolbar>
            </template>
            <template v-slot:item.actions="{ item }">
              <v-btn
                class="mx-2 mr-2"
                fab
                dark
                small
                outlined
                @click="editItem(item)"
              >
                <v-icon color="primary"> mdi-pencil </v-icon>
              </v-btn>

              <v-btn
                class="mx-2 mr-2"
                fab
                dark
                small
                outlined
                @click="deleteItem(item)"
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
        id: "",
        FirstName: "",
        LasName: "",
        DateOfBirth: "",
        Disability: "",
        Estado: "",
        PhoneNumber: "",
        Genre: "",
      },

      dialog: false,
      dialogDelete: false,
      editedIndex: -1,
      editedItem: {
        id: "",
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
    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.object);
      });
    },
    save() {
      Object.assign(this.desserts[this.editedIndex], this.editedItem);
      axios
        .put("/usuario", this.editedItem)
        .then(() => {
          swal.fire("Estado actualizado", "", "success");
        })
        .catch((error) => {
          swal.fire(
            "Hubo un error al cargar los datos! " + error,
            "Error",
            "error"
          );
        });
      this.close();
    },
    editItem(item) {
      this.editedIndex = this.desserts.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
    },
    deleteItem(item) {
      this.editedIndex = this.desserts.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },
    deleteItemConfirm() {
      this.editedItem.Estado = "I";
      Object.assign(this.desserts[this.editedIndex], this.editedItem);
      axios
        .post("/usuario", this.editedItem)
        .then(() => {
          swal.fire("Usuario eliminado", "", "success");
        })
        .catch((error) => {
          swal.fire(
            "Hubo un error al cargar los datos! " + error,
            "Error",
            "error"
          );
        });
      this.closeDelete();
    },
    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.object);
      });
    },

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
            this.object.id = person[i].Id;
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
            "Hubo un error al cargar los datos! " + error,
            "Error",
            "error"
          );
        });
    },
    borrar(usuario) {
      axios
        .post("/usuario", usuario)
        .then(() => {
          usuario.Estado = "I";
          swal.fire("Usuario eliminado", "", "success");
        })
        .catch((error) => {
          swal.fire(
            "Hubo un error al cargar los datos! " + error,
            "Error",
            "error"
          );
        });
    },
    editar(usuario) {
      console.log(usuario);

      axios
        .put("/usuario", usuario)
        .then(() => {
          swal.fire("Estado actualizado", "", "success");
        })
        .catch((error) => {
          swal.fire(
            "Hubo un error al cargar los datos! " + error,
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
