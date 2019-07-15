company_name = 'Starbucks'
Company.create(
  name: company_name,
  address1: '2401 Utah Ave S',
  city: 'Seattle',
  state: 'WA',
  zip: '98134'
)

company = Company.find_by_name(company_name)

company.roles.create(
  title: 'Sr. Software Developer',
  start_date: '1/1/2009'.to_date,
  end_date: '3/1/2013'.to_date
)

role = company.roles.find_by_title('Sr. Software Developer')

role.projects.create(
  name: 'Starbucks iOS App',
  description: 'The official Starbucks app. I worked on versions 1 and 2, the currently available version is 3.'
)

project = role.projects.find_by_name('Starbucks iOS App')

project.accomplishments.create(
  description: 'Designed and implemented the main user interface, including all gestures and interactions.'
)

project.accomplishments.create(
  description: 'Developer on the DrinkBuilder in-app experience.'
)

project.accomplishments.create(
  description: 'Designed and implemented the CoreData based product and loyalty databases.'
)

project.accomplishments.create(
  description: 'Integrated PayPal into the auto-reload process, including all .NET server-side work.'
)

project.accomplishments.create(
  description: 'Contributor to many of the infrastructure components (image downloads, service layer communications, etc).'
)

project.accomplishments.create(
  description: 'Performance and memory usage profiling.'
)

project.accomplishments.create(
  description: 'Assist in coordinating sprints, task breakdowns, task assignments, etc.'
)

project.accomplishments.create(
  description: 'Responsible for our automated build infrastructure (Ruby, Jenkins, bash).'
)

project.accomplishments.create(
  description: 'Implemented iOS automated builds.'
)

project.accomplishments.create(
  description: 'Assisted the Android team in setting up automated builds.'
)

project.apps.create(
  name: 'Starbucks',
  platform: 'iOS',
  url: 'https://itunes.apple.com/us/app/starbucks/id331177714?mt=8',
  image_url: 'http://a2.mzstatic.com/us/r30/Purple5/v4/04/22/ed/0422ed2a-7cce-5117-20e9-76fcf82f5dad/icon175x175.jpeg',
  comment: 'The version currently in the store is not the version I worked on.'
)

role.projects.create(
  name: 'CoreData Importer',
  description: 'Internal Mac app used to build the Sqlite3 product database used by the Starbucks iOS app.'
)

project = role.projects.find_by_name('CoreData Importer')

project.accomplishments.create(
  description: 'Designed and implemented Cocoa user interface.'
)

project.accomplishments.create(
  description: 'Desgined and implemented command line tool.'
)

project.accomplishments.create(
  description: 'Wrote the .NET REST service layer'
)

project.accomplishments.create(
  description: 'Integrated the data importer into the Jenkins automated build'
)

role.projects.create(
  name: 'Drive-thru iPad App',
  description: 'POC iPad app that was used to test drive-thru optimization idea.'
)

project = role.projects.find_by_name('Drive-thru iPad App')

project.accomplishments.create(
  description: 'Designed and implemented the user experience.'  
)
