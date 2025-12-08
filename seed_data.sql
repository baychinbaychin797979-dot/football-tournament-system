-- Clear existing data
SET NAMES utf8mb4;

DELETE FROM matches;
DELETE FROM teams;
DELETE FROM competitions;
DELETE FROM countries;

-- Insert countries
INSERT INTO countries (id, name, logo) VALUES
('dz', 'Algeria', 'https://flagcdn.com/dz.svg'),
('in', 'India', 'https://flagcdn.com/in.svg'),
('bd', 'Bangladesh', 'https://flagcdn.com/bd.svg');

-- Insert competitions
INSERT INTO competitions (id, name, logo) VALUES
('lnh-dz', 'Giải bóng đá nữ Algeria', 'https://flagcdn.com/dz.svg'),
('u21-dz', 'Liga U21 Youth Algeria', 'https://flagcdn.com/dz.svg'),
('aff-cup', 'Siêu cúp Ấn Độ - Bảng đấu A', 'https://flagcdn.com/in.svg'),
('bd-league', 'Giải ngoại hạng Bangladesh - Vòng 4', 'https://flagcdn.com/bd.svg'),
('iwr-in', 'IWR India', 'https://flagcdn.com/in.svg');

-- Insert teams
INSERT INTO teams (id, competition_id, country_id, name, logo) VALUES
('clb-akbou', 'lnh-dz', 'dz', 'CLB nữ Akbou', 'https://ui-avatars.com/api/?name=CA&size=128&background=006233&color=fff&bold=true'),
('afak-relizane', 'lnh-dz', 'dz', 'Afak Relizane(w)', 'https://ui-avatars.com/api/?name=AR&size=128&background=006233&color=fff&bold=true'),
('cr-belouzza', 'lnh-dz', 'dz', 'CR Belouizzad (W)', 'https://ui-avatars.com/api/?name=CR&size=128&background=d50000&color=fff&bold=true'),
('ase-alger', 'lnh-dz', 'dz', 'ASE Alger Centre (w)', 'https://ui-avatars.com/api/?name=AS&size=128&background=0066cc&color=fff&bold=true'),
('saoura-u21', 'u21-dz', 'dz', 'Saoura U21', 'https://ui-avatars.com/api/?name=JS&size=128&background=ff8800&color=fff&bold=true'),
('kabylie-u21', 'u21-dz', 'dz', 'Kabylie U21', 'https://ui-avatars.com/api/?name=JK&size=128&background=ffdd00&color=000&bold=true'),
('hyderabad', 'aff-cup', 'in', 'Hyderabad', 'https://ui-avatars.com/api/?name=HY&size=128&background=ffcc00&color=000&bold=true'),
('sreenidi', 'aff-cup', 'in', 'Sreenidi Deccan', 'https://ui-avatars.com/api/?name=SD&size=128&background=ff6600&color=fff&bold=true'),
('fortis', 'bd-league', 'bd', 'Fortis Limited', 'https://ui-avatars.com/api/?name=FL&size=128&background=006747&color=fff&bold=true'),
('rahmatgonj', 'bd-league', 'bd', 'Rahmatgonj MFS', 'https://ui-avatars.com/api/?name=RM&size=128&background=0033cc&color=fff&bold=true'),
('sheikh-jamal', 'bd-league', 'bd', 'Sheikh Jamal', 'https://ui-avatars.com/api/?name=SJ&size=128&background=ff0000&color=fff&bold=true'),
('bashundhara', 'bd-league', 'bd', 'Bashundhara Kings', 'https://ui-avatars.com/api/?name=BK&size=128&background=e63946&color=fff&bold=true'),
('clb-akbou-3', 'iwr-in', 'in', 'CLB nữ Akbou 3', 'https://ui-avatars.com/api/?name=C3&size=128&background=006233&color=fff&bold=true');

-- Insert matches
INSERT INTO matches (id, competition_id, home_team_id, away_team_id, status_id, match_time, home_scores, away_scores) VALUES
('m1', 'lnh-dz', 'clb-akbou', 'afak-relizane', 2, 1733331600, '[1, 0]', '[0, 0]'),
('m2', 'lnh-dz', 'cr-belouzza', 'ase-alger', 2, 1733331600, '[2, 1]', '[1, 1]'),
('m3', 'u21-dz', 'saoura-u21', 'kabylie-u21', 2, 1733332200, '[0, 0]', '[4, 2]'),
('m4', 'aff-cup', 'hyderabad', 'sreenidi', 2, 1733328600, '[1, 0]', '[4, 2]'),
('m5', 'bd-league', 'fortis', 'rahmatgonj', 2, 1733327400, '[1, 1]', '[2, 1]'),
('m6', 'bd-league', 'sheikh-jamal', 'bashundhara', 2, 1733327400, '[0, 0]', '[0, 0]'),
('m7', 'iwr-in', 'clb-akbou', 'clb-akbou-3', 3, 1733408400, '[2, 1, 0, 0, -1, 0, 0]', '[3, 2, 0, 0, -1, 0, 0]');
