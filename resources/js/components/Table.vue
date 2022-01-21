<template>
  <!-- <v-icon left> mdi-pencil </v-icon> -->
  <v-app>
    <v-main class="ml-5 mr-5">
      <v-container fluid>
        <v-row>
          <v-col md="4">
            <v-text-field label="Digite un nombre o apellido"></v-text-field>
          </v-col>
          <v-col class="text-right">
            <v-btn color="primary" rounded outlined>
              <v-icon left> mdi-magnify </v-icon>
              Buscar
            </v-btn>
          </v-col>
        </v-row>
        <v-data-table
          :headers="headers"
          :items="desserts"
          :items-per-page="5"
          class="elevation-1"
        ></v-data-table>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      headers: [
        {
          text: "Nombres",
          align: "start",
          sortable: false,
          value: "nombres",
        },
        { text: "Apellidos", value: "apellidos" },
        { text: "# Teléfono", value: "telefono" },
        { text: "Fecha Naciemiento", value: "nacimiento" },
        { text: "# Celular", value: "celular" },
        { text: "Género", value: "genero" },
        { text: "Discapacidad", value: "discapacidad" },
      ],
      desserts: [
        {
          nombres: "Jair Rodrigo",
          apellidos: "Roca Viteri",
          telefono: "0960293229",
          nacimiento: "17/01/2001",
          celular: "0960293229",
          genero: "M",
          discapacidad: "Auditiva",
        },
        {
          nombres: "Jair Rodrigo",
          apellidos: "Roca Viteri",
          telefono: "0960293229",
          nacimiento: "17/01/2001",
          celular: "0960293229",
          genero: "M",
          discapacidad: "Auditiva",
        },
        {
          nombres: "Jair Rodrigo",
          apellidos: "Roca Viteri",
          telefono: "0960293229",
          nacimiento: "17/01/2001",
          celular: "0960293229",
          genero: "M",
          discapacidad: "Auditiva",
        },
        {
          nombres: "Jair Rodrigo",
          apellidos: "Roca Viteri",
          telefono: "0960293229",
          nacimiento: "17/01/2001",
          celular: "0960293229",
          genero: "M",
          discapacidad: "Auditiva",
        },
        {
          nombres: "Jair Rodrigo",
          apellidos: "Roca Viteri",
          telefono: "0960293229",
          nacimiento: "17/01/2001",
          celular: "0960293229",
          genero: "M",
          discapacidad: "Auditiva",
        },
        {
          nombres: "Jair Rodrigo",
          apellidos: "Roca Viteri",
          telefono: "0960293229",
          nacimiento: "17/01/2001",
          celular: "0960293229",
          genero: "M",
          discapacidad: "Auditiva",
        },
      ],
    };
  },
};
</script>
