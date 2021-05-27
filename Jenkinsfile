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
                        mv wp-content/* ${env.Module}/
                        mv wp-includes/* ${env.Module}/
                        rm -rf  wp-content
                        rm -rf wp-includes
                        mkdir -p ${env.Module}/uploads/2020/04
                        cp ../cropped-* ${env.Module}/uploads/2020/04/
                        uncss ${env.Module}/index.html > ${env.Module}/xy.css
                        cd ${env.Module}
                        find . -type f -name index.html -print0 | xargs -0 sed -i -e "s|/cache/asset-cleanup/css/head-.*\.css|/xy.css|g"
                        find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s/http:/https:/g"
                        find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/appointy.com|/qa-www.appointy.com|g"
                        find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-content|/${env.Module}|g"
                        find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-includes|/${env.Module}|g"
                        chmod 755 xy.css
                        cd ../..
                        # echo 'sync start'
                        rsync -Parv root/${env.Module}/* landing-pages/${env.Module}/
                        sh 'ls -la'                                      
                        sh 'pwd'                                                                      
                    }
                }
            }
        }
    }
}
