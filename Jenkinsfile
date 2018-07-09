node {
   def mvnHome
   stage('Preparation') { // for display purposes
      git 'https://github.com/renatodelgaudio/javaFunctionTrigger.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.
      mvnHome = tool 'M3'
   }
   stage('Build') {
     sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
   }
   stage('Test') {
        sh "'${mvnHome}/bin/mvn' verify"
   }
   stage('Results') {
      junit '**/target/surefire-reports/TEST-*.xml'
      archive 'target/*.jar'
   }
}