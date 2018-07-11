node {
   def mvnHome
   stage('Preparation') { // for display purposes
      git 'https://github.com/renatodelgaudio/javaFunctionTrigger.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.
      mvnHome = tool 'M3'
      jdk = tool 'JDK8'
      env.JAVA_HOME = "${jdk}"

      sh "${jdk}/bin/java -version"
   }
   stage('Build') {
     sh "'${mvnHome}/bin/mvn' -P build-docker clean package"
     stash includes: 'target/azure-functions/*.zip', name: 'targetfiles'
   }
   stage('Test') {
        sh "'${mvnHome}/bin/mvn' verify"
   }
   stage('Results') {
      junit '**/target/surefire-reports/TEST-*.xml'
      archive 'target/*.jar'
   }
   stage('Deploy') {
         echo "Deploying to Microsoft Azure"
         unstash 'targetfiles'
         sh "az functionapp deployment source config-zip  -g OneMonthBasic -n javafunctiontriggerdocker --src target/azure-functions/javafunctiontrigger-20180702153310658.zip"
         // sh "'${mvnHome}/bin/mvn' azure-functions:deploy"
   }

}