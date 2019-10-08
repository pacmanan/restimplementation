# Saisatdaan: Traslation for the word Politician in Urdu and Hindi


Requirements:
- Rubymine IDE
- Ruby version 2.5.1
- Cucumber (https://cucumber.io/docs/installation/ruby/)
- Bundler (https://bundler.io/)

Summary:
These test are written using a framework created using Cucumber and Rest-Client Gem in Ruby language.

Assumptions Made: 
Assuming that the API is called InfoAPI.

Test Cases:
Scenarios covered are:

- Add Politician to the data pool
- Retrieve 5 latest politicians and verify that they are returned in decending order of date
- Retreive Politician data using ID

How to Run Tests:

- Open the project in Rubymine and wait for the automatic indexation to completed by Rubymine.
- Once indexation has been completed, in the terminal window within Rubymine (located at the bottem left) run the command 'bundle install'. This will install the gems if they werent installed with the indexation. If this happens correctly you will see a 'gemlock' file at the root of the project.
- Once that is completed, open the .feature file and right click on any Scenario you would like to run by right-clicking on the "scenario outline" line and clicking Run tests.
- You will see the test results in the IDE console.

