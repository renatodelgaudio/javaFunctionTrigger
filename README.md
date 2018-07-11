# Java Azure Functions
This is an example of Azure Function with Java as runtime.

This is a maven based project and the Azure function can be executed both on local machine or directly on Azure.

The Jenkins pipeline is responsible to build, test and finally deploy the function on Azure.
The deployment is performed through the Maven plugin **azure-functions-maven-plugin**
