These customizations are meant to be deployed into an unzipped Alfresco WAR.

You can either do that manually or use Ant.

To use the Ant build, first create your own build.properties file by copying build.properties.sample. Then, edit build.properties to match your environment.

The only setting needed is repo.web.dir which should point to the root of your Alfresco web application.