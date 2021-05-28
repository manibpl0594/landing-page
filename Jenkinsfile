List<String> CHOICES = [];

def app = 'Unknown'
pipeline {
    agent { label 'agent' }
    stages {
        stage('build') {
            steps {
                script {
                    container('docker-go') {

                        CHOICES = ["barbershop-software", "black-friday", "case-study", "education-scheduling-software", "enterprise", "enterprise-appointment-scheduling-software", "enterprise-meeting-scheduling-software", "enterprise-ppc", "enterprise-scheduling-software", "enterprise-solution-thank-you-page", "features", "fitness-class-scheduling-software", "government-scheduling-software", "health-and-wellness-scheduling-software", "integrations", "meeting-scheduling-software", "online-booking-software", "online-class-scheduling-software", "online-salon-management-software", "online-scheduling-for-implementing-social-distancing-reopening-your-business-covid-19", "online-tutoring-software-for-scheduling-tutoring-lessons", "professional-services-scheduling-software", "salon-scheduling-software", "schedule-livestream-classes-and-virtual-sessions", "spa-scheduling-software"];    
                        env.Module = input  message: 'What are we deploying today?',ok : 'Deploy',
                                        parameters:[choice(choices: CHOICES, description: 'Select a tag for this build', name: 'TAG')]
                        echo "Deploying ${env.Module}."
                        sh 'go get github.com/srikrsna/ayna'
                        sh "echo '10.0.0.135 appointy.com' >> /etc/hosts"  
                        sh 'rm -rf root/*'                      
                        sh "ayna -single http://appointy.com/${env.Module}"
                        sh "cat /etc/hosts"
                        sh 'ls root/'                       
                        sh 'pwd'
                        dir('root'){
                            sh 'pwd'
                            sh 'ls -a'
                            sh 'mv wp-content/* $x/'
                            sh 'mv wp-includes/* $x/'
                            sh 'rm -rf  wp-content'
                            sh 'rm -rf wp-includes'
                            sh 'mkdir -p $x/uploads/2020/04'
                            sh 'cp ../cropped-* $x/uploads/2020/04/'
                            sh 'uncss $x/index.html > $x/xy.css'
cd $x
find . -type f -name index.html -print0 | xargs -0 sed -i -e "s|/cache/asset-cleanup/css/head-.*\.css|/xy.css|g"
#find . -type f -name index.html -print0 | xargs -0 sed -i '' -e "s|/cache/asset-cleanup/css/head-f85fcedc95322507df634d2a73b50423d6319bd2.css|/xy.css|g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s/http:/https:/g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/appointy.com|/qa-www.appointy.com|g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-content|/$x|g"
find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-includes|/$x|g"
                           
                        }
                        
                        sh 'pwd'                                                                      
                    }
                }
            }
        }
    }
}

