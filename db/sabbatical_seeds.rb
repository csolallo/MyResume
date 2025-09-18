co = Company.create(
  name: 'Self'
)

role = co.roles.create(
  title: 'Software Developer',
  start_date: '7/1/2025'.to_date,
)

# MyResume

proj = role.projects.create(
  name: 'MyResume api',
  description: <<-HEREDOC
  Rails application providing RESTful and GraphQL endpoints to power a resume front-end. I built this app years ago. During
  the sabbatical, I have updated gems and added swagger documentation.
  HEREDOC
)

proj.apps.create(
  name: 'Production deployment',
  platform: 'heroku',
  url: 'https://resume.sola-llon.ch/api-docs/index.html',
  comment: 'use resume id 1 in swagger.'
)

proj.apps.create(
  name: 'Source code',
  platform: 'github',
  url: 'https://github.com/csolallo/MyResume'
)

# Android device automation

proj = role.projects.create(
  name: 'Groceries',
  description: <<-HEREDOC
  I built this system to automate the addition of (grocery) items into a Google Keep list. The system 
  leverages several android tools (MacroDroid, Tasker, Termux) and uses a Ruby script that runs on-device. The script 
  uses the official Google Keep API to manage the list.
  HEREDOC
)

proj.apps.create(
  name: 'Source code',
  platform: 'github',
  url: 'https://github.com/csolallo/Groceries'
)

# Water taxi microsite

proj = role.projects.create(
  name: 'Water taxi microsite',
  description: <<-HEREDOC
  A microsite is a combination web crawler and minimal static site. The purpose is to crawl an external
  website and expose its critical data in a minimal static site heavily optimized for a small screen. In this
  implementation, King County water taxi schedules are presented only for the dock nearest the device's 
  location.
  HEREDOC
)

proj.apps.create(
  name: 'Source code',
  platform: 'github',
  url: 'https://github.com/csolallo/Microsites'
)
