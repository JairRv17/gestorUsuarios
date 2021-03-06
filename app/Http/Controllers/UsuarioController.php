<?php

namespace App\Http\Controllers;

use App\Models\Disability;
use App\Models\Genre;
use App\Models\Person;
use App\Models\Usuario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UsuarioController extends Controller
{
    public function index()
    {
        return view('layouts.template');
    }
    public function cargarDatos()
    {
        $person = Person::select(['Id', 'UserId', 'GenreId', 'FirstName', 'LasName', 'DateOfBirth', 'IsActive'])
            ->with('disability')->get();
        $disability = Disability::select(['Id', 'Name'])->get();
        $user = Usuario::select(['Id', 'PhoneNumber'])->get();
        $genre = Genre::select(['Id', 'Name'])->get();

        return [
            'person' => $person,
            'disability' => $disability,
            'user' => $user,
            'genre' => $genre
        ];
    }
    public function update(Request $request)
    {
        $id = $request->input('id');
        $estado = $request->input('Estado') === 'A' ? 1 : 0;
        if (isset($estado)) {
            $person = Person::where('Id', $id)
                ->update([
                    'IsActive' => $estado
                ]);
        }
    }
    public function delete(Request $request)
    {
        $id = $request->input('id');
        Person::where('Id', $id)
            ->update([
                'IsActive' => 0
            ]);
    }
    public function buscarDB(Request $request)
    {
        $palabra = $request->input('palabra');
        $person = $person = Person::select(['Id', 'UserId', 'GenreId', 'FirstName', 'LasName', 'DateOfBirth', 'IsActive'])
            ->with('disability')
            ->where('Firstname', 'like', '%' . $palabra . '%')
            ->orWhere('LasName', 'like', '%' . $palabra . '%')
            ->get();
        $disability = Disability::select(['Id', 'Name'])->get();
        $user = Usuario::select(['Id', 'PhoneNumber'])->get();
        $genre = Genre::select(['Id', 'Name'])->get();

        return [
            'person' => $person,
            'disability' => $disability,
            'user' => $user,
            'genre' => $genre
        ];
    }
    public function autenticacion(Request $request)
    {
        $email = $request->input('email');
        $password = $request->input('password');
        if($email === "admin@mail.com" && $password ==="admin")
            return "true";
        else
            return "false";
    }
}
