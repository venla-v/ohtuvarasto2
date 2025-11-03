import unittest
from statistics_service import StatisticsService
from player import Player

class PlayerReaderStub:
    def get_players(self):
        return [
            Player("Semenko", "EDM", 4, 12),
            Player("Lemieux", "PIT", 45, 54),
            Player("Kurri",   "EDM", 37, 53),
            Player("Yzerman", "DET", 42, 56),
            Player("Gretzky", "EDM", 35, 89)
        ]

class TestStatisticsService(unittest.TestCase):
    def setUp(self):
        # annetaan StatisticsService-luokan oliolle "stub"-luokan olio
        self.stats = StatisticsService(
            PlayerReaderStub()
        )

    def test_search_toimii(self):
        search = self.stats.search("Semenko")
        self.assertEqual(search.name, 'Semenko')

    def test_search_toimii2(self):
        search = self.stats.search("moi")
        self.assertEqual(search, None)

    def test_tiimi_filtteröinti(self):
        team = self.stats.team("PIT")
        self.assertEqual(team[0].name, "Lemieux")
        self.assertEqual(team[0].team, "PIT")
        self.assertEqual(team[0].goals, 45)
        self.assertEqual(team[0].assists, 54)
        self.assertEqual(len(team), 1)

    def test_sort(self):
        pelaajat = self.stats.top(2)
        self.assertEqual(pelaajat[0].name, "Gretzky")
        self.assertEqual(pelaajat[1].name, "Lemieux")
        self.assertEqual(pelaajat[2].name, "Yzerman")
        self.assertEqual(len(pelaajat), 3)
