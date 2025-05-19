from django.test import TestCase, Client
from django.urls import reverse
from django.apps import apps


class UtilityAppTestCase(TestCase):
    """Test case for the utility_app."""

    def setUp(self):
        """Set up the test environment."""
        self.client = Client()

    def test_app_installed(self):
        """Test that the utility_app is installed."""
        self.assertTrue(apps.is_installed('utility_app'))

    def test_home_view(self):
        """Test that the home view returns a 200 status code."""
        response = self.client.get(reverse('utility_app:home'))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, 'Welcome to the Utility App!')
        self.assertTemplateUsed(response, 'utility_app/home.html')
