These customizations are meant to be deployed into an unzipped WCM Quick Start WAR.

You can either do that manually or use Ant.

To use the Ant build, first create your own build.properties file by copying build.properties.sample. Then, edit build.properties to match your environment.

The only setting needed is wcmqs.web.dir which should point to the root of your WCM QS web application.

After expanding, you might want to:

 1. Create a new Share site called "deckshare"
 
 2. Create a set of categories. Out-of-the-box, DeckShare expects you to have the following categories:

    DeckShare 
    +--Audience
    +--Carousel
    +--Event
    +--Featured
    +--Topic
    
    If you want to use a different set of categories, that's fine, but you'll need to change the categories web script config.
    
 3. Import the bootstrap ACP file that resides in this source under the data directory. There is a separate README.txt file that provides further instructions.
 
 4. Edit the DeckShare Editorial folder that gets created by the import to match the settings for your environment (host name, port number, etc.).

Presentations go in Publications/Decks. Supporting files go in Publications/Supporting Files.

If you want to relate one or more decks to each other, add the Relatable aspect.

If a deck has supporting files, like a source code zip, add the Supportable aspect.