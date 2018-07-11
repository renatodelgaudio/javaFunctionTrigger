node {
   def mvnHome
   stage('Preparation') { // for display purposes
     // git 'https://github.com/renatodelgaudio/javaFunctionTrigger.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.
      mvnHome = tool 'M3'
      jdk = tool 'JDK8'
      env.JAVA_HOME = "${jdk}"

      sh "${jdk}/bin/java -version"
   }
   stage('Build') {
     sh "'${mvnHome}/bin/mvn' clean package"
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
         sh "zip -r myfunction.zip target/azure-functions/javafunctiontrigger-20180702153310658"
         sh "az functionapp deployment source config-zip  -g OneMonthBasic -n javafunctiontrigger-20180702153310658 --src myfunction.zip"
         // sh "'${mvnHome}/bin/mvn' azure-functions:deploy"
   }

}