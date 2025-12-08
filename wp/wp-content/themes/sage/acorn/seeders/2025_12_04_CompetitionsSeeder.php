<?php
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CompetitionsSeeder extends Seeder
{
    public function run()
    {
        DB::table('competitions')->insert([
            ['id' => 'lnh-dz','name' => 'Giải bóng đá nữ Algeria','logo' => 'https://flagcdn.com/dz.svg'],
            ['id' => 'u21-dz','name' => 'Liga U21 Youth Algeria','logo' => 'https://flagcdn.com/dz.svg'],
            ['id' => 'aff-cup','name' => 'Siêu cúp Ấn Độ - Bảng đấu A','logo' => 'https://flagcdn.com/in.svg'],
            ['id' => 'bd-league','name' => 'Giải ngoại hạng Bangladesh - Vòng 4','logo' => 'https://flagcdn.com/bd.svg'],
            ['id' => 'iwr-in','name' => 'IWR India','logo' => 'https://flagcdn.com/in.svg'],
        ]);
    }
}
