List<String> CHOICES = [];

def app = 'Unknown'
pipeline {
    agent { label 'mix' }
    stages {
        stage('build') {
            steps {
                script {
                    container('mix') {
                        CHOICES = ["barbershop-software","black-friday","case-study","education-scheduling-software","enterprise","enterprise-appointment-scheduling-software","enterprise-meeting-scheduling-software","enterprise-ppc","enterprise-scheduling-software","enterprise-solution-thank-you-page","features","fitness-class-scheduling-software","government-scheduling-software","govt-new-temp","health-and-wellness-scheduling-software","integrations","meeting-scheduling-software","online-activity-scheduling-software","online-booking-software","online-class-scheduling-software","online-salon-management-software","online-scheduling-for-implementing-social-distancing-reopening-your-business-covid-19","online-tutoring-software-for-scheduling-tutoring-lessons","professional-services-scheduling-software","retail-scheduling-software","salon-scheduling-software","schedule-livestream-classes-and-virtual-sessions","spa-assetcleanup","spa-assetcleanup-2","spa-assetcleanup-3","spa-assetcleanup-without-flick","spa-assetcleanup-without-flick-preload","spa-assetcleanup-without-preload","spa-page-with-new-fonts","spa-scheduling-software","spa-test","spa-test-js","spa-test2","spa-test5"];    
                        env.Module = input  message: 'What are we deploying today?',ok : 'Deploy',
                                        parameters:[choice(choices: CHOICES, description: 'Select a tag for this build', name: 'TAG')]
                        echo "Deploying ${env.Module}."
                        echo "${Module}"
                        sh 'echo $Module'                        
                        sh "echo '10.0.0.135 appointy.com' >> /etc/hosts"
                        sh 'rm -rf root/*'                    
                        sh "ayna -single http://appointy.com/${env.Module}"
                        sh 'cp sed.sh root/'
                        dir('root'){
                            sh 'pwd'
                            echo "Deploying ${env.Module}."
                            sh 'ls $Module'
                            sh 'mv wp-content/* $Module/'
                            sh 'mv wp-includes/* $Module/'
                            sh 'rm -rf wp-content'
                            sh 'rm -rf wp-includes'
                            sh 'mkdir -p $Module/uploads/2020/04'
                            sh 'cp ../cropped-* $Module/uploads/2020/04/'
                            sh 'uncss $Module/index.html > $Module/xy.css'                                                   
                            sh 'find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s/http:/https:/g"'
                            sh 'find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/appointy.com|/qa-www.appointy.com|g"'
                            sh 'find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-content|/$Module|g"'
                            sh 'find . -type f -name index.html -print0 | xargs -0 sed -i  -e "s|/wp-includes|/$Module|g"'
                            sh 'chmod 755 $Module/xy.css'
                            sh 'ls -a $Module/'
                            sh 'ls -a'
                            sh 'sh sed.sh'
                        
                           
                         }
                            
                            sh 'ls -a'
                            sh 'pwd'
                        sh 'rsync -Parv /home/jenkins/workspace/mani-test/root/$Module/* landing-pages/$Module/'
                        sh 'rm -rf root/*'    
                    }
                }
            }
        }
    }
}