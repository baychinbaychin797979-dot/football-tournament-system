<?php
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CountriesSeeder extends Seeder
{
    public function run()
    {
        DB::table('countries')->insert([
            ['id' => 'dz','name' => 'Algeria','logo' => 'https://flagcdn.com/dz.svg'],
            ['id' => 'in','name' => 'India','logo' => 'https://flagcdn.com/in.svg'],
            ['id' => 'bd','name' => 'Bangladesh','logo' => 'https://flagcdn.com/bd.svg'],
        ]);
    }
}
