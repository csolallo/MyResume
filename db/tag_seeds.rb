def get_tag(name)
  tag = Tag.find_by_name(name)
  if tag.nil?
    tag = Tag.create(
      name: name
    )
    return tag
  end
end

android = get_tag 'android'
aspnet = get_tag 'ASP.NET' 
aws = get_tag 'AWS'
backbone = get_tag 'backbone.js'
bash = get_tag 'bash'
beacon = get_tag 'iBeacon'
bootstrap = get_tag 'bootstrap'
bindings = get_tag 'Bindings'
ble = get_tag 'Bluetooth LE'
bq = get_tag 'Big Query'
ca = get_tag 'CoreAnimation'
cd = get_tag 'CoreData'
cg = get_tag 'CoreGraphics'
ci = get_tag 'CoreImage'
codeigniter = get_tag 'CodeIgniter'
css = get_tag 'CSS'
dc = get_tag 'Docker Compose'
delphi = get_tag 'Delphi 5/6'
docker = get_tag 'Docker'
dotnet = get_tag '.NET'
flex = get_tag 'Adobe Flex'
gcp = get_tag 'Google Cloud Platform'
gha = get_tag 'Github Actions'
gitlab = get_tag 'GitLab'
graphql = get_tag 'GraphQL'
heroku = get_tag 'Heroku'
html5 = get_tag 'HTML5'
ilog = get_tag 'ILog Rules Engine'
informix = get_tag 'Informix'
instruments = get_tag 'Instruments'
ios = get_tag 'iOS'
java = get_tag 'java'
jaxp = get_tag 'JAXP'
jekyll = get_tag 'Jekyll'
jenkins = get_tag 'Jenkins'
jira = get_tag 'Jira'
jquery = get_tag 'JQuery'
js = get_tag 'JavaScript'
jsp = get_tag 'JSP'
linux = get_tag 'Linux'
lucene = get_tag 'Apache Lucene'
mgmt = get_tag 'Management'
mdm = get_tag 'MDM'
phonegap = get_tag 'Cordova/PhoneGap'
php = get_tag 'PHP'
postgres = get_tag 'Postgresql'
python = get_tag 'Python'
obj_c = get_tag 'objective-c'
rails = get_tag 'Rails'
react =  get_tag 'React'
reactnative = get_tag 'React-Native'
redis = get_tag 'Redis'
redux = get_tag 'Redux'
require = get_tag 'require.js'
ruby = get_tag 'Ruby'
rxswift = get_tag 'RxSwift'
spring = get_tag 'Spring 2'
springboot = get_tag 'Spring Boot'
struts = get_tag 'Struts 2'
svn = get_tag 'Subversion'
swagger = get_tag 'OpenAPI/Swagger'
swift = get_tag 'Swift'
swizzle = get_tag 'swizzling'
tomcat = get_tag 'Tomcat'
typescript = get_tag 'TypeScript'
virtualbox = get_tag 'VirtualBox'
win32 = get_tag 'Win32'
wse3 = get_tag 'WSE 3'
xml = get_tag 'XML'
xquery = get_tag 'XQuery'
xsl = get_tag 'XSL/XSLT'

co = Company.find_by_name('Providence Health & Services')

proj1 = co.roles[0].projects.find_by_name('Indoor way-finding pilot')
[obj_c, beacon].each { |tag| proj1.tags << tag }
proj1.save!

proj2 = co.roles[0].projects.find_by_name('Providence mobile app')
[obj_c, ci, phonegap, android, linux, virtualbox, jira, gitlab].each { |tag| proj2.tags << tag }
proj2.save!

co = Company.find_by_name('HighPoint')

proj1 = co.roles[0].projects[0]
[obj_c, phonegap, android, php, codeigniter, js, jquery, backbone, require, bootstrap, html5, css, jenkins, jira].each { |tag| proj1.tags << tag }
proj1.save!

co = Company.find_by_name('Starbucks')

role = co.roles.find_by_title('Sr. Software Developer')
proj1 = role.projects.find_by_name('Starbucks iOS App')
[obj_c, instruments, cd, cg, ca].each { |tag| proj1.tags << tag }
proj1.save!

proj2 = role.projects.find_by_name('CoreData Importer')
[obj_c, cd, bindings].each { |tag| proj2.tags << tag }
proj2.save!

proj3 = role.projects.find_by_name('Drive-thru iPad App')
[obj_c, swizzle].each { |tag| proj3.tags << tag }
proj3.save!

co = Company.find_by_name('Yorder')

proj1 = co.roles[0].projects[0]
[obj_c, instruments, php, codeigniter].each { |tag| proj1.tags << tag}
proj1.save!

co = Company.find_by_name('ALLDATA/Autozone')

proj1 = co.roles[0].projects.find_by_name('AllData/DiY')
[java, spring, struts, informix, jenkins, svn, tomcat].each { |tag| proj1.tags << tag }
proj1.save!

proj2 = co.roles[0].projects.find_by_name('Technical Services Bulletin Site')
[java, lucene, jsp, tomcat].each { |tag| proj2.tags << tag }
proj2.save!

proj3 = co.roles[0].projects.find_by_name('iShop 3 Enterprise Web Service')
[java, jaxp, xml, xsl, informix, flex].each { |tag| proj3.tags << tag }
proj3.save!

proj4 = co.roles[0].projects.find_by_name('Tire data web crawler')
[ruby, linux].each { |tag| proj4.tags << tag }

co = Company.find_by_name('ISingleton, Inc.')

proj1 = co.roles.find_by_title('Software Developer/Architect').projects.find_by_name('Multimedia content management system')
[win32, dotnet, wse3, aspnet].each { |tag| proj1.tags << tag }
proj1.save!

proj2 = co.roles.find_by_title('Lead Developer').projects.find_by_name('Automated visual editor tool')
[dotnet, ilog, xml, xsl, xquery].each { |tag| proj2.tags << tag }
proj2.save!

proj3 = co.roles.find_by_title('Technical Lead/Architect').projects.find_by_name('Eureka')
[dotnet, win32, delphi, aspnet, xsl].each { |tag| proj3.tags << tag }
proj3.save!

co = Company.find_by_name('Requested')
role = co.roles.find_by_title('Software Engineer/Technologist')

proj = role.projects.find_by_name('Support and on-boarding web application')
[js,html5, css, bootstrap, ruby, rails, postgres, heroku, redis].each { |tag| proj.tags << tag }

proj = role.projects.find_by_name('Merchant app')
[swift, obj_c, mdm].each { |tag| proj.tags << tag }

proj = role.projects.find_by_name('Consumer app')
[swift, obj_c, phonegap, js].each { |tag| proj.tags << tag }

co = Company.find_by_name('Providence Health & Services')
role = co.roles.find_by_title('Sr. Software Engineer')

proj = role.projects.find_by_name('iOS ExpressCare mobile app')
[swift, redux, rxswift, aspnet].each { |tag| proj.tags << tag } 

co = Company.find_by_name('Best Buy')
role = co.roles.find_by_title('Sr. Software Engineer')

proj = role.projects.find_by_name('Insignia iOS app')
[swift, obj_c, ble].each { |tag| proj.tags << tag }

proj = role.projects.find_by_name('Home iOS app')
[ios, swift, obj_c, graphql, ruby, reactnative, typescript].each { |tag| proj.tags << tag }

proj = role.projects.find_by_name('Lively Link app')
[typescript, reactnative, js, android, ios].each { |tag| proj.tags << tag }

proj = role.projects.find_by_name('Lively Health and Safety app')
[swift, obj_c, ios].each { |tag| proj.tags << tag }

role = co.roles.find_by_title('Manager, Software Engineering')
proj = role.projects.find_by_name('Humana Health POC app')
[android, ios, mgmt].each { |tag| proj.tags << tag }

role = co.roles.find_by_title('Sr. Manager, Software Engineering')
proj = role.projects.find_by_name('MyAds Platform')
[mgmt, aws, bash, python, bq, docker, dc, gcp].each { |tag| proj.tags << tag }

co = Company.find_by_name('Self')

proj = co.roles[0].projects.find_by_name('MyResume api')
[ruby, rails, postgres, graphql, heroku, swagger].each { |tag| proj.tags << tag }

proj = co.roles[0].projects.find_by_name('Groceries')
[ruby, gha, android, bash].each { |tag| proj.tags << tag }

proj = co.roles[0].projects.find_by_name('Water taxi microsite')
[ruby, jekyll, heroku].each { |tag| proj.tags << tag }

