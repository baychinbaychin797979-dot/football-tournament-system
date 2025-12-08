<?php
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TeamsSeeder extends Seeder
{
    public function run()
    {
        DB::table('teams')->insert([
            ['id' => 'clb-akbou',      'competition_id' => 'lnh-dz',   'country_id' => 'dz', 'name' => 'CLB nữ Akbou',            'logo' => 'https://ui-avatars.com/api/?name=CA&size=128&background=006233&color=fff&bold=true'],
            ['id' => 'afak-relizane',  'competition_id' => 'lnh-dz',   'country_id' => 'dz', 'name' => 'Afak Relizane(w)',        'logo' => 'https://ui-avatars.com/api/?name=AR&size=128&background=006233&color=fff&bold=true'],
            ['id' => 'cr-belouzza',    'competition_id' => 'lnh-dz',   'country_id' => 'dz', 'name' => 'CR Belouizzad (W)',       'logo' => 'https://ui-avatars.com/api/?name=CR&size=128&background=d50000&color=fff&bold=true'],
            ['id' => 'ase-alger',      'competition_id' => 'lnh-dz',   'country_id' => 'dz', 'name' => 'ASE Alger Centre (w)',    'logo' => 'https://ui-avatars.com/api/?name=AS&size=128&background=0066cc&color=fff&bold=true'],
            ['id' => 'saoura-u21',     'competition_id' => 'u21-dz',   'country_id' => 'dz', 'name' => 'Saoura U21',              'logo' => 'https://ui-avatars.com/api/?name=JS&size=128&background=ff8800&color=fff&bold=true'],
            ['id' => 'kabylie-u21',    'competition_id' => 'u21-dz',   'country_id' => 'dz', 'name' => 'Kabylie U21',             'logo' => 'https://ui-avatars.com/api/?name=JK&size=128&background=ffdd00&color=000&bold=true'],
            ['id' => 'hyderabad',      'competition_id' => 'aff-cup',  'country_id' => 'in', 'name' => 'Hyderabad',               'logo' => 'https://ui-avatars.com/api/?name=HY&size=128&background=ffcc00&color=000&bold=true'],
            ['id' => 'sreenidi',       'competition_id' => 'aff-cup',  'country_id' => 'in', 'name' => 'Sreenidi Deccan',         'logo' => 'https://ui-avatars.com/api/?name=SD&size=128&background=ff6600&color=fff&bold=true'],
            ['id' => 'fortis',         'competition_id' => 'bd-league','country_id' => 'bd', 'name' => 'Fortis Limited',          'logo' => 'https://ui-avatars.com/api/?name=FL&size=128&background=006747&color=fff&bold=true'],
            ['id' => 'rahmatgonj',     'competition_id' => 'bd-league','country_id' => 'bd', 'name' => 'Rahmatgonj MFS',          'logo' => 'https://ui-avatars.com/api/?name=RM&size=128&background=0033cc&color=fff&bold=true'],
            ['id' => 'sheikh-jamal',   'competition_id' => 'bd-league','country_id' => 'bd', 'name' => 'Sheikh Jamal',            'logo' => 'https://ui-avatars.com/api/?name=SJ&size=128&background=ff0000&color=fff&bold=true'],
            ['id' => 'bashundhara',    'competition_id' => 'bd-league','country_id' => 'bd', 'name' => 'Bashundhara Kings',       'logo' => 'https://ui-avatars.com/api/?name=BK&size=128&background=e63946&color=fff&bold=true'],
            ['id' => 'clb-akbou-3',    'competition_id' => 'iwr-in',   'country_id' => 'in', 'name' => 'CLB nữ Akbou 3',          'logo' => 'https://ui-avatars.com/api/?name=C3&size=128&background=006233&color=fff&bold=true'],
        ]);
    }
}