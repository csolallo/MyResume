def get_tag(name)
  tag = Tag.find_by_name(name)
  if tag.nil?
    tag = Tag.create(
      name: name
    )
  end
  return tag
end

obj_c = get_tag 'objective-c'
swift = get_tag 'Swift'
mdm = get_tag 'MDM'
android = get_tag 'android'
php = get_tag 'android'
codeigniter = get_tag 'CodeIgniter'
js = get_tag 'JavaScript'
jquery = get_tag 'JQuery'
backbone = get_tag 'backbone.js'
require = get_tag 'require.js'
bootstrap = get_tag 'bootstrap'
html5 = get_tag 'HTML5'
css = get_tag 'CSS'
phonegap = get_tag 'Cordova/PhoneGap'
jenkins = get_tag 'Jenkins'
jira = get_tag 'Jira'
gitlab = get_tag 'GitLab'
virtualbox = get_tag 'VirtualBox'
linux = get_tag 'Debian'
beacon = get_tag 'iBeacon'
instruments = get_tag 'Instruments'
ci = get_tag 'CoreImage'
cd = get_tag 'CoreData'
cg = get_tag 'CoreGraphics'
ca = get_tag 'CoreAnimation'
bindings = get_tag 'Bindings'
swizzle = get_tag 'swizzling'
ruby = get_tag 'ruby'
rails = get_tag 'Rails'
postgres = get_tag 'Postgresql'
heroku = get_tag 'Heroku'
redis = get_tag 'Redis'
java = get_tag 'java'
spring = get_tag 'Spring 2'
struts = get_tag 'Struts 2'
informix = get_tag 'Informix'
svn = get_tag 'Subversion'
tomcat = get_tag 'Tomcat'
lucene = get_tag 'Apache Lucene'
jsp = get_tag 'JSP'
jaxp = get_tag 'JAXP'
xml = get_tag 'XML'
xsl = get_tag 'XSL/XSLT'
flex = get_tag 'Adobe Flex'
win32 = get_tag 'Win32'
wse3 = get_tag 'WSE 3'
dotnet = get_tag '.NET'
aspnet = get_tag 'ASP.NET'
ilog = get_tag 'ILog Rules Engine'
xquery = get_tag 'XQuery'
delphi = get_tag 'Delphi 5/6'


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
