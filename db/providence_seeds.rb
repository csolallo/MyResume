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
  title: 'Principal Developer (mobile)',
  start_date: '8/1/2014'.to_date,
  end_date: '4/1/2015'.to_date
)

role = company.roles.find_by_title('Principal Developer (mobile)')
role.projects.create(
  name: 'Indoor way-finding pilot',
  description: 'Developed a sample application to determine viability of indoor navigation within a Providence facility'
)

project = role.projects.find_by_name('Indoor way-finding pilot')
project.accomplishments.create(
  description: 'manged vendor matrix and vendor selection'
)

project.accomplishments.create(
  description: 'Integrated vendor SDK into a proof of concept (POC) iOS application'
)

project.accomplishments.create(
  description: 'Assisted in the iBeacon placment and callibration'
)

role.projects.create(
  name: 'Providence mobile app',
  description: 'Developed initial PhoneGap application, demonstrating how the native harness can enhance the web experience'
)

project = role.projects.find_by_name('Providence mobile app')

project.accomplishments.create(
  description: 'Set up iOS PhoneGap project (embedded webview)'
)

project.accomplishments.create(
  description: 'Used CoreImage to perform facial recognition and create chatheads out of stock provider images'
)

project.accomplishments.create(
  description: 'Set up VirtualBox Debian VMs to host Gitlab and Jira internally'
)
