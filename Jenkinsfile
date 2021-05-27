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
                        sh 'ls -a'
                        sh "ayna -single http://appointy.com/${env.Module}"
                        sh "cat /etc/hosts"
                        sh 'ls root/'                                               
                        echo "url: http://appointy.com/${env.Module}/"
                        cd root/
                        sh 'mv wp-content/* ${env.Module}/'
                        sh 'mv wp-includes/* ${env.Module}/'
                        sh 'rm -rf  wp-content'
                        sh 'rm -rf wp-includes'
                        sh 'mkdir -p ${env.Module}/uploads/2020/04'
                        sh 'cp ../cropped-* ${env.Module}/uploads/2020/04/'
                        sh 'uncss ${env.Module}/index.html > ${env.Module}/xy.css'
                        sh 'cd ${env.Module}'
                        sh 'find . -type f -name index.html -print0 | xargs -0 sed -i -e "s|/cache/asset-cleanup/css/head-.*\.css|/xy.css|g"'
                        sh 'find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s/http:/https:/g"'
                        sh 'find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/appointy.com|/qa-www.appointy.com|g"'
                        sh 'find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-content|/${env.Module}|g"'
                        sh 'find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-includes|/${env.Module}|g"'
                        sh 'chmod 755 xy.css'
                        sh 'cd ../..'                        
                        sh 'rsync -Parv root/${env.Module}/* landing-pages/${env.Module}/'
                        sh 'ls -la'                                      
                        sh 'pwd'                                                                      
                    }
                }
            }
        }
    }
}
