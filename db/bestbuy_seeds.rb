company_name = 'Best Buy'

company = Company.create(
  name: company_name,
  address1: '1000 Denny Way',
  address2: 'floor 8',
  city: 'Seattle',
  state: 'WA',
  zip: '98109'
)

role = company.roles.create(
  title: 'Sr. Software Engineer',
  start_date: '1/6/2017'.to_date,
  end_date: '1/11/2019'.to_date
)

# as software engineer

proj = role.projects.create(
  name: 'Insignia iOS app',
  description: 'Insignia branded IoT management app'
)

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

proj = role.projects.create(
  name: 'Home iOS app',
  description: 'App to manage all your Best Buy purchases'
)

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

proj = role.projects.create(
  name: 'Lively Link app',
  description: 'Link is part of the Best Buy health initiative'
)

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
  name: 'Lively Link',
  platform: 'iOS',
  url: 'https://apps.apple.com/us/app/lively-link/id584004617',
  image_url: '',
)

proj = role.projects.create(
  name: 'Lively Health and Safety app',
  description: 'Lively app and backing service assist people with living independently longer'
)

# Lively watch app and accomplishments

proj.accomplishments.create(
  description: 'Worked with Product on initial watch app feature set'
)

proj.accomplishments.create(
  description: 'Integrated pre-release version fall detection API. Reported findings to Apple'
)

proj.apps.create(
  name: 'Lively Health and Safety app',
  platform: 'iOS',
  url: 'https://apps.apple.com/us/app/lively-link/id584004617',
  image_url: '',
  comment: 'Apple watch app was removed from after several iterations'
)

role = company.roles.create(
  title: 'Manager, Software Engineering',
  start_date: '1/11/2019'.to_date,
  end_date: '1/8/2021'.to_date
)

# as engineering manager

role.accomplishments.create(
  description: 'Established a web development competency within Best Buy Health'
)

role.accomplishments.create(
  description: 'Established a web development competency within Best Buy Health'
)

role.accomplishments.create(
  description: 'Managed a team of two web developers and seven app developers'
)

role.accomplishments.create(
  description: 'Assisted with staff planning and projections'
)

role.accomplishments.create(
  description: 'Facilitated collaboration between remote teams'
)

proj = role.projects.create(
  name: 'Humana Health POC app',
  description: 'App to facilitate remote telemetry readings using BLE devices'
)

proj.accomplishments.create(
  description: 'Delivered Humana iOS and android apps with integrations for numerous BLE devices'
)

proj.apps.create(
  name: 'Humana POC app',
  platform: 'iOS',
  url: '',
  image_url: '',
  comment: 'The pilot program ended and app is no longer available.'
)

proj.apps.create(
  name: 'Humana POC app',
  platform: 'android',
  url: '',
  image_url: '',
  comment: 'The pilot program ended and app is no longer available.'
)

role = company.roles.create(
  title: 'Sr. Manager, Software Engineering',
  start_date: '1/8/2021'.to_date,
  end_date: '30/6/2025'.to_date
)

# as senior engineering manager

proj = role.projects.create(
  name: 'MyAds Platform',
  description: 'MyAds is a web application that allows users to manage their advertising campaigns across multiple platforms. The application provides a unified dashboard for tracking performance metrics, optimizing ad spend, and generating reports.'
)

proj.accomplishments.create(
  description: 'Oversaw the migration from GCP to AWS, coinciding with a re-architecture of the MyAds back-end'
)

proj.accomplishments.create(
  description: 'Oversaw the roll-out of the website to external (non Best Buy) users'
)

proj.accomplishments.create(
  description: 'Worked with the infrastructure and security teams, as well as the architecture review board, to ensure compliance with Best Buy policies and best practices'
)

proj.accomplishments.create(
  description: 'Oversaw the roll-out of campaign sharing across organizations for advertising agencies'
)

proj.accomplishments.create(
  description: 'Contributed to the application database design needed to fully support campaign sharing'
)

proj = role.projects.create(
  name: 'Ad campaign Reporting',
  description: 'Data processing pipelines that power advertising campaign performance reporting, including the MyAds website.'
)

proj.accomplishments.create(
  description: 'Standardized alerting and monitoring across data processing pipelines'
)

proj.accomplishments.create(
  description: 'Established a data quality check framework'
)

proj.accomplishments.create(
  description: 'Worked with leadership to augment the team with offshore resources'
)

proj.accomplishments.create(
  description: 'Improved production support'
)

proj.accomplishments.create(
  description: 'Refactored data processing pipelines to improve code reuse'
)

