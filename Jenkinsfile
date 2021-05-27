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
                        sh 'pwd'
                        sh 'ls -a'
                        sh 'qa-run.sh'                        
                        sh 'ls -la'                                      
                        sh 'pwd'                                                                      
                    }
                }
            }
        }
    }
}
