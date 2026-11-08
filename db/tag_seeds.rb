def get_tag(name)
  tag = Tag.find_by_name(name)
  if tag.nil?
    tag = Tag.create(
      name: name
    )
  end
  return tag
end

dotnet = get_tag '.NET'
flex = get_tag 'Adobe Flex'
android = get_tag 'android'
lucene = get_tag 'Apache Lucene'
aspnet = get_tag 'ASP.NET' 
aspnet = get_tag 'ASP.NET'
backbone = get_tag 'backbone.js'
bindings = get_tag 'Bindings'
bootstrap = get_tag 'bootstrap'
codeigniter = get_tag 'CodeIgniter'
docker = get_tag 'Docker'
docker_compose = get_tag 'Docker Compose'
phonegap = get_tag 'Cordova/PhoneGap'
ca = get_tag 'CoreAnimation'
cd = get_tag 'CoreData'
cg = get_tag 'CoreGraphics'
ci = get_tag 'CoreImage'
css = get_tag 'CSS'
linux = get_tag 'Debian'
delphi = get_tag 'Delphi 5/6'
gitlab = get_tag 'GitLab'
heroku = get_tag 'Heroku'
html5 = get_tag 'HTML5'
beacon = get_tag 'iBeacon'
ilog = get_tag 'ILog Rules Engine'
informix = get_tag 'Informix'
instruments = get_tag 'Instruments'
ios = get_tag 'iOS'
java = get_tag 'java'
js = get_tag 'JavaScript'
jaxp = get_tag 'JAXP'
jenkins = get_tag 'Jenkins'
jira = get_tag 'Jira'
jquery = get_tag 'JQuery'
jsp = get_tag 'JSP'
mdm = get_tag 'MDM'
node = get_tag 'Node.js'
obj_c = get_tag 'objective-c'
php = get_tag 'PHP'
postgres = get_tag 'Postgresql'
rails = get_tag 'Rails'
react = get_tag 'React'
reactnative = get_tag 'React-Native'
redis = get_tag 'Redis'
redux = get_tag 'Redux'
require = get_tag 'require.js'
ruby = get_tag 'ruby'
rxswift = get_tag 'RxSwift'
spring = get_tag 'Spring 2/3'
struts = get_tag 'Struts 2'
svn = get_tag 'Subversion'
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
[obj_c, instruments, php, codeigniter, ruby].each { |tag| proj1.tags << tag}
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
[js, ruby, rails, postgres, heroku, redis].each { |tag| proj.tags << tag }

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
[swift, obj_c].each { |tag| proj.tags << tag }

proj = role.projects.find_by_name('Home iOS app')
[swift, obj_c].each { |tag| proj.tags << tag }

proj = role.projects.find_by_name('GreatCall Link app')
[typescript, reactnative, js, android, ios].each { |tag| proj.tags << tag }


co = Company.find_by_name('Populus')

role = co.roles.find_by_title('Software Developer, Full-stack')
proj = role.projects.find_by_name('MyAds')
[java, react, node, typescript, spring, docker, docker_compose, postgres].each { |tag| proj.tags << tag }