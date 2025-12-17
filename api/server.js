const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());

// Dữ liệu demo về bóng đá
const data = {
  countries: [
    { id: 1, name: 'Việt Nam', code: 'VN', flag: '🇻🇳' },
    { id: 2, name: 'Thái Lan', code: 'TH', flag: '🇹🇭' },
    { id: 3, name: 'Malaysia', code: 'MY', flag: '🇲🇾' },
    { id: 4, name: 'Indonesia', code: 'ID', flag: '🇮🇩' },
    { id: 5, name: 'Singapore', code: 'SG', flag: '🇸🇬' }
  ],
  competitions: [
    { id: 1, name: 'AFF Cup 2024', country_id: null, season: '2024', type: 'International' },
    { id: 2, name: 'V.League 1', country_id: 1, season: '2024', type: 'Domestic' },
    { id: 3, name: 'Thai League 1', country_id: 2, season: '2024', type: 'Domestic' }
  ],
  teams: [
    { 
      id: 1, 
      name: 'Đội tuyển Việt Nam', 
      country_id: 1, 
      stadium: 'Mỹ Đình', 
      founded: 1962, 
      logo: '🇻🇳',
      badge: '⭐',
      color: '🔴'
    },
    { 
      id: 2, 
      name: 'Đội tuyển Thái Lan', 
      country_id: 2, 
      stadium: 'Rajamangala', 
      founded: 1915, 
      logo: '🇹🇭',
      badge: '🐘',
      color: '🔵'
    },
    { 
      id: 3, 
      name: 'Hà Nội FC', 
      country_id: 1, 
      stadium: 'Hàng Đẫy', 
      founded: 2006, 
      logo: '🟣',
      badge: '💜',
      color: '🟣'
    },
    { 
      id: 4, 
      name: 'Công An Hà Nội', 
      country_id: 1, 
      stadium: 'Hàng Đẫy', 
      founded: 2010, 
      logo: '🟡',
      badge: '⚡',
      color: '🟡'
    },
    { 
      id: 5, 
      name: 'Hoàng Anh Gia Lai', 
      country_id: 1, 
      stadium: 'Pleiku', 
      founded: 2001, 
      logo: '🟠',
      badge: '🏔️',
      color: '🟠'
    },
    { 
      id: 6, 
      name: 'Sài Gòn FC', 
      country_id: 1, 
      stadium: 'Thống Nhất', 
      founded: 2015, 
      logo: '💗',
      badge: '🌸',
      color: '💗'
    }
  ],
  matches: [
    {
      id: 1,
      competition_id: 1,
      home_team_id: 1,
      away_team_id: 2,
      match_date: '2024-12-20T19:00:00',
      home_score: 2,
      away_score: 1,
      status: 'scheduled',
      venue: 'Sân vận động Mỹ Đình'
    },
    {
      id: 2,
      competition_id: 2,
      home_team_id: 3,
      away_team_id: 4,
      match_date: '2024-12-18T18:00:00',
      home_score: 1,
      away_score: 1,
      status: 'completed',
      venue: 'Sân vận động Hàng Đẫy'
    },
    {
      id: 3,
      competition_id: 2,
      home_team_id: 5,
      away_team_id: 6,
      match_date: '2024-12-19T17:00:00',
      home_score: 3,
      away_score: 0,
      status: 'completed',
      venue: 'Sân vận động Pleiku'
    },
    {
      id: 4,
      competition_id: 2,
      home_team_id: 3,
      away_team_id: 5,
      match_date: '2024-12-21T19:30:00',
      home_score: null,
      away_score: null,
      status: 'scheduled',
      venue: 'Sân vận động Hàng Đẫy'
    }
  ]
};

// API Endpoints
app.get('/', (req, res) => {
  res.json({
    message: 'Football Giải Đấu API',
    version: '1.0.0',
    endpoints: {
      countries: '/api/countries',
      competitions: '/api/competitions',
      teams: '/api/teams',
      matches: '/api/matches',
      matchDetail: '/api/matches/:id'
    }
  });
});

// Countries
app.get('/api/countries', (req, res) => {
  res.json({ success: true, data: data.countries });
});

app.get('/api/countries/:id', (req, res) => {
  const country = data.countries.find(c => c.id === parseInt(req.params.id));
  if (country) {
    res.json({ success: true, data: country });
  } else {
    res.status(404).json({ success: false, message: 'Country not found' });
  }
});

// Competitions
app.get('/api/competitions', (req, res) => {
  res.json({ success: true, data: data.competitions });
});

app.get('/api/competitions/:id', (req, res) => {
  const competition = data.competitions.find(c => c.id === parseInt(req.params.id));
  if (competition) {
    res.json({ success: true, data: competition });
  } else {
    res.status(404).json({ success: false, message: 'Competition not found' });
  }
});

// Teams
app.get('/api/teams', (req, res) => {
  let teams = [...data.teams];
  
  // Filter by country if query parameter exists
  if (req.query.country_id) {
    teams = teams.filter(t => t.country_id === parseInt(req.query.country_id));
  }
  
  res.json({ success: true, data: teams });
});

app.get('/api/teams/:id', (req, res) => {
  const team = data.teams.find(t => t.id === parseInt(req.params.id));
  if (team) {
    res.json({ success: true, data: team });
  } else {
    res.status(404).json({ success: false, message: 'Team not found' });
  }
});

// Matches
app.get('/api/matches', (req, res) => {
  let matches = data.matches.map(match => {
    const homeTeam = data.teams.find(t => t.id === match.home_team_id);
    const awayTeam = data.teams.find(t => t.id === match.away_team_id);
    const competition = data.competitions.find(c => c.id === match.competition_id);
    
    return {
      ...match,
      home_team: homeTeam,
      away_team: awayTeam,
      competition: competition
    };
  });

  // Filter by status if query parameter exists
  if (req.query.status) {
    matches = matches.filter(m => m.status === req.query.status);
  }

  res.json({ success: true, data: matches });
});

app.get('/api/matches/:id', (req, res) => {
  const match = data.matches.find(m => m.id === parseInt(req.params.id));
  if (match) {
    const homeTeam = data.teams.find(t => t.id === match.home_team_id);
    const awayTeam = data.teams.find(t => t.id === match.away_team_id);
    const competition = data.competitions.find(c => c.id === match.competition_id);
    
    res.json({
      success: true,
      data: {
        ...match,
        home_team: homeTeam,
        away_team: awayTeam,
        competition: competition
      }
    });
  } else {
    res.status(404).json({ success: false, message: 'Match not found' });
  }
});

// Statistics endpoint
app.get('/api/stats', (req, res) => {
  res.json({
    success: true,
    data: {
      total_countries: data.countries.length,
      total_competitions: data.competitions.length,
      total_teams: data.teams.length,
      total_matches: data.matches.length,
      completed_matches: data.matches.filter(m => m.status === 'completed').length,
      scheduled_matches: data.matches.filter(m => m.status === 'scheduled').length
    }
  });
});

app.listen(PORT, () => {
  console.log(`🚀 Football Giải Đấu API running on http://localhost:${PORT}`);
  console.log(`📊 Access API at http://localhost:${PORT}/api`);
});
