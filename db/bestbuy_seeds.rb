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

# roles at best buy

company.roles.create(
  title: 'Sr. Software Engineer',
  start_date: '6/1/2017'.to_date,
  end_date: '11/1/2019'.to_date
)

company.roles.create(
  title: 'Manager, Software Engineering',
  start_date: '11/1/2019'.to_date,
  end_date: '11/1/2021'.to_date
)

company.roles.create(
  title: 'Sr. Manager, Software Engineering',
  start_date: '11/1/2021'.to_date,
  end_date: '6/1/2025'.to_date
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
  name: 'Lively Link app',
  description: 'Link allows caregivers ones to monitor loved ones in a privacy respecting way'
)

role.projects.create(
  name: 'Lively Health and Safety app',
  description: 'Lively app and backing service assist people with living independently longer'
)

# Insignia app and accomplishments

proj = role.projects.find_by_name('Insignia iOS app')

proj.accomplishments.create(
    description: 'Worked closely with hardware vendor to integrate smart camera'
)

proj.accomplishments.create(
  description: 'Introduced hardware abstraction layer to standardize app/device interactions'
)

proj.accomplishments.create(
    description: 'Introduced BDD testing'
)

proj.apps.create(
  name: 'Insignia',
  platform: 'iOS',
  url: '',
  image_url: '',
  comment: 'The app is no longer available.'
)

# Home app and accomplishments

proj = role.projects.find_by_name('Home iOS app')

proj.accomplishments.create(
  description: 'Added React-Native for cross-platform development'
)

proj.accomplishments.create(
  description: 'Leveraged Ruby to implement semantic versioning for Artifactory packages'
)

proj.accomplishments.create(
  description: 'Integrated device information discovery SDK'
)

proj.apps.create(
  name: 'Best Buy Home',
  platform: 'iOS',
  url: '',
  image_url: '',
  comment: 'The app is no longer available. Features were merged into the retail app'
)

# Link app and accomplishments

proj = role.projects.find_by_name('Lively Link app')

proj.accomplishments.create(
    description: 'Created app architecture, incorporating react native, redux, redux-sagas'
)

proj.accomplishments.create(
    description: 'Introduced Detox for UI test automation'
)

proj.apps.create(
  name: 'Lively Link',
  platform: 'iOS',
  url: 'https://apps.apple.com/us/app/lively-link/id584004617',
  image_url: '',
)

proj.apps.create(
  name: 'Lively Link',
  platform: 'android',
  url: 'https://play.google.com/store/apps/details?id=com.greatcall.link&hl=en_US',
  image_url: '',
)

# Lively watch app and accomplishments

proj = role.projects.find_by_name('Lively Health and Safety app')

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

# as development manager

role = company.roles.find_by_title('Manager, Software Engineering')

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

# as senior manager

role = company.roles.find_by_title('Sr. Manager, Software Engineering')

proj = role.projects.create(
  name: 'MyAds Platform',
  description: <<HEREDOC
I managed up to sixteen engineers and QA spread across two teams, one full-stack and one
data engineering. The teams built and supported the MyAds advertising reporting platform and
were part of the larger Marketing and Advertising organization at Best Buy.
HEREDOC
)

proj.accomplishments.create(
  description: 'Led successful platform modernization effort for the MyAds advertising reporting website'
)
proj.accomplishments.create(
  description: 'Led the public rollout of MyAds'
)
proj.accomplishments.create(
  description: 'Ensured MyAds adhered to Best Buy security policies'
)
proj.accomplishments.create(
  description: 'Oversaw the expansion of the MyAds development team to double its original size'
)
proj.accomplishments.create(
  description: 'Led the data engineering team on major process improvement initiatives'
)
proj.accomplishments.create(
  description: 'Integrated offshore resources into the data engineering team'
)
proj.accomplishments.create(
  description: 'Core member of the team building the internal CLI (command line interface) for MyAds'
)
