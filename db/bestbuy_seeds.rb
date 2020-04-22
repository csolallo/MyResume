company_name = 'Best Buy'

Company.create(
  name: company_name,
  address1: '1000 Denny Way',
  address2: 'floor 8',
  city: 'Seattle',
  state: 'WA',
  zip: '98109'
)
company = Company.find_by_name(company_name)

company.roles.create(
  title: 'Sr. Software Engineer',
  start_date: '6/1/2017'.to_date,
  end_date: '11/1/2019'.to_date
)

company.roles.create(
  title: 'Manager, Software Development',
  start_date: '11/1/2019'.to_date,
)

# as software engineer

role = company.roles.find_by_title('Sr. Software Engineer')

role.projects.create(
  name: 'Insignia iOS app',
  description: 'Insignia branded IoT managment app'
)

role.projects.create(
    name: 'Home iOS app',
    description: 'App to manage all your Best Buy purchases'
)

role.projects.create(
    name: 'GreatCall Link app',
    description: 'Link is part of the Best Buy health initiative'
)

proj = role.projects.find_by_name('Insignia iOS app')

proj.accomplishments.create(
    description: 'Worked closely with hardware vendor to include smart camera'
)

proj.accomplishments.create(
    description: 'Introduced BDD unit testing'
)

proj.apps.create(
  name: 'Insignia',
  platform: 'iOS',
  url: '',
  image_url: '',
  comment: 'The app is no longer available.'
)

proj = role.projects.find_by_name('Home iOS app')

proj.accomplishments.create(
    description: 'Added React-Native for cross-platform development'
)

proj.accomplishments.create(
    description: 'Implemented semantic versioning for Artifactory packages'
)

proj.apps.create(
  name: 'Best Buy Home',
  platform: 'iOS',
  url: '',
  image_url: '',
  comment: 'The app is no longer available. Features were merged into the retail app'
)

proj = role.projects.find_by_name('GreatCall Link app')

proj.accomplishments.create(
    description: 'Created app architecture, incorporating react native, redux, redux-sagas'
)

proj.accomplishments.create(
    description: 'Established a cross platform development team'
)

proj.accomplishments.create(
    description: 'Introduced Detox for UI automation'
)

proj.apps.create(
  name: 'GreatCall Link',
  platform: 'iOS',
  url: 'https://apps.apple.com/us/app/greatcall-link/id584004617',
  image_url: '',
)

proj.apps.create(
  name: 'GreatCall Link',
  platform: 'android',
  url: 'https://play.google.com/store/apps/details?id=com.greatcall.link&hl=en_US',
  image_url: '',
)

# as development manager

role = company.roles.find_by_title('Manager, Software Development')

role.accomplishments.create(
  description: 'Established a web development competency within Best Buy Health'
)

role.accomplishments.create(
  description: 'Manage a team of two web developers and seven app developers'
)

role.accomplishments.create(
  description: 'Responsible for staff planning and projections'
)

role.accomplishments.create(
  description: 'Facilitate collaboration between remote teams'
)
