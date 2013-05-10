Feature: Manage Memoids
	In order to store my notes
	As a student
	I want to create and manage memoids

	Scenario: Memoids List
		Given I have memoids titled Git, Continuum
		When I am on the user profile page
		Then I should see "Git"
		And I should see "Continuum"