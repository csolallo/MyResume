company_name = 'Providence Health & Services'

company = Company.find_by_name(company_name)
if company.nil?
  Company.create(
    name: company_name,
    address1: '2201 Lind Ave SW',
    city: 'Renton',
    state: 'WA',
    zip: '98057'
  )
  company = Company.find_by_name(company_name)
end

company.roles.create(
  title: 'Sr. Software Engineer',
  start_date: '2/1/2016'.to_date,
  end_date: '6/1/2017'.to_date
)

role = company.roles.find_by_title('Sr. Software Engineer')
role.projects.create(
  name: 'iOS ExpressCare mobile app',
  description: 'Served as team lead during the design and development phases'
)

project = role.projects.find_by_name('iOS ExpressCare mobile app')
project.accomplishments.create(
  description: 'Designed and implemented initial RxSwift/Redux architecture'
)

project.accomplishments.create(
  description: 'Lead the Swift 2 to Swift 3 conversion'
)

project.accomplishments.create(
  description: 'Work with the API platform team to ensure core platform services meet the requirements of the mobile apps'
)

project.accomplishments.create(
  description: 'Contributor to the .NET mobile API services'
)

project.apps.create(
    name: 'Swedish EpressCare',
    platform: 'iOS',
    url: 'https://apps.apple.com/us/app/swedish-health-connect/id1131387262',
    image_url: ''
)
