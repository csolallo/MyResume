company_name = 'Populus'

company = Company.create(
  name: 'Populus',
  address1: '3380 146th Pl SE',
  address2: '#340',
  city: 'Bellevue',
  state: 'WA',
  zip: '98007'
)

role = company.roles.create(
  title: 'Software Developer, Full-stack',
  start_date: '29/9/2025'.to_date
)

proj = role.projects.create(
  name: 'MyAds',
  description: 'Ad campaign management and reporting platform'
)

proj.accomplishments.create(
    description: 'Spring boot api development'
)

proj.accomplishments.create(
    description: 'Node api development'
)

proj.accomplishments.create(
    description: 'React front-end development using TypeScript and Javascript'
)

proj.accomplishments.create(
    description: 'Docker and Docker Compose setup for containerized development environment'
)
