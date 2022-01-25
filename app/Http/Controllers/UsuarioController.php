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
}
