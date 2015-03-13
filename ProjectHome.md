Alfresco DeckShare is an Alfresco Web Quick Start site created by [Metaversant](http://www.metaversant.com) and [Tribloom](http://www.tribloom.com). It was originally created for [Alfresco](http://www.alfresco.com) to use as a presentation sharing site for Alfresco DevCon and other events but Alfresco later decided to use SlideShare.

## Functional overview ##

DeckShare is used by anyone who has an Alfresco repository containing presentations or other documents that they want to categorize, associate with other presentations, and then make available to their user base. End-users can find presentations by searching metadata or presentation content, by navigating a hierarchical category structure, or by browsing "featured" or "latest" presentations.

Presentations can be downloaded or viewed within the browser using Alfresco's flash previewer.

People who manage presentations use Alfresco Share to upload and categorize presentations. Alternatively, content managers can use Alfresco's CIFS support to map a share to the repository and move presentations into the repo using drag-and-drop. Alfresco also supports WebDAV, FTP, SMTP, IMAP, and SharePoint's file sharing protocol for getting files into and out of the repository using whatever client makes the most sense.

As presentations are uploaded, Alfresco automatically creates thumbnails of various sizes, PDF renditions of the content, and a Flash-based preview.

## How we built it ##

We started with the starter app that comes out-of-the-box with Web Quick Start, then added a couple of our own components to add things such as:

  * YUI-based carousel for "featured decks"
  * Categorization support
  * Related presentations
  * Supporting materials (such as source code that accompanies a presentation)
  * Presentation-friendly renditions

There are three things that must be deployed. Each is managed in the source code as a separate project:

  * Repository tier customizations
  * Share customizations
  * Web Quick Start starter app

Each project contains a README.txt file with further deployment instructions.

## What's left to do ##

  * Add full support for tags. At the time we wrote this code, a bug in the underlying Alfresco services prevented tags from working in Web Quick Start.
  * Add full support for commenting.
  * Add full support for ratings (like/dislike) using Alfresco's new rating service.
  * De-specialize/remove the ad-serving component. (We added a component that calls Alfresco's OpenX ad server, but obviously that isn't applicable to everyone).