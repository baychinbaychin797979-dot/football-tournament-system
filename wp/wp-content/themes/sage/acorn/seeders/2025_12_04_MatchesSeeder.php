<?php
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MatchesSeeder extends Seeder
{
    public function run()
    {
        DB::table('matches')->insert([
            ['id' => 'm1','competition_id' => 'lnh-dz','home_team_id' => 'clb-akbou','away_team_id' => 'afak-relizane','status_id'=>2,'match_time'=>1733331600,'home_scores'=>json_encode([1,0]),'away_scores'=>json_encode([0,0])],
            ['id' => 'm2','competition_id' => 'lnh-dz','home_team_id' => 'cr-belouzza','away_team_id' => 'ase-alger','status_id'=>2,'match_time'=>1733331600,'home_scores'=>json_encode([2,1]),'away_scores'=>json_encode([1,1])],
            ['id' => 'm3','competition_id' => 'u21-dz','home_team_id' => 'saoura-u21','away_team_id' => 'kabylie-u21','status_id'=>2,'match_time'=>1733332200,'home_scores'=>json_encode([0,0]),'away_scores'=>json_encode([4,2])],
            ['id' => 'm4','competition_id' => 'aff-cup','home_team_id' => 'hyderabad','away_team_id' => 'sreenidi','status_id'=>2,'match_time'=>1733328600,'home_scores'=>json_encode([1,0]),'away_scores'=>json_encode([4,2])],
            ['id' => 'm5','competition_id' => 'bd-league','home_team_id' => 'fortis','away_team_id' => 'rahmatgonj','status_id'=>2,'match_time'=>1733327400,'home_scores'=>json_encode([1,1]),'away_scores'=>json_encode([2,1])],
            ['id' => 'm6','competition_id' => 'bd-league','home_team_id' => 'sheikh-jamal','away_team_id' => 'bashundhara','status_id'=>2,'match_time'=>1733327400,'home_scores'=>json_encode([0,0]),'away_scores'=>json_encode([0,0])],
            ['id' => 'm7','competition_id' => 'iwr-in','home_team_id' => 'clb-akbou','away_team_id' => 'clb-akbou-3','status_id'=>3,'match_time'=>1733408400,'home_scores'=>json_encode([2,1,0,0,-1,0,0]),'away_scores'=>json_encode([3,2,0,0,-1,0,0])],
        ]);
    }
}
