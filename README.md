Living Hisory
=============

This web app is an experiment in narrative storytelling.

The end result is intended to be HTML5-based "stories" which anyone can play.
A story is envisioned as:

 A set of pages created by an author. Pages appear in sequence, and contain media elements to 
 tell their story. Media can include text, images, video, and audio. 

Functionally a story will work like a Powerpoint presentation: a sequence of full-screen pages
that you move through one at a time. However, where presentations are oriented towards text,
LivingHistory is oriented towards telling engaging stories. I imagine that good stories
will include:
# Voice narration on each page
# Images and video - Ideally from original sources
# timed transitions so that elements may appear according to timing with the narration

Another analogy for the application is basically giving people a tool to create
"Ken Burns"-style documentaries. 

Story metadata
------------------

I have started to define a schema for storing a single "story". Look at public/kittinger_story.yml
for an example. Basically a story has story-level metadata (title, author, etc..) and then
it defines a set of pages. Each page defines a set of elements that appear on that page
(text, images, video) and give timing cues as to when those elements should appear or
disappear. There is also the beginnings of some "transition animation" rules.

Story player
----------------

This story player is an HTML5/Javascript application which knows how to render a given
story. Currently the player is contained in public/player.html. The player works by
requesting a story in JSON format from the backend (/story/<name>). The current backend
does nothing but look for a YAML file with the right name and serve it back as JSON.

Inside player.html, it reads the story metadata and generates DOM elements according
to the pages and elements of the story. The current code has very basic support
for pages, text elements, images, and audio.

Story editor
-----------------

It is envisioned to eventually have a full story editor. This editor would allow you
to register an account, create stories, and edit stories via a drag-and-drop interface
that would support text, images, and video. Elements on a page could be resized and
relocated, and other attributes could be controlled (appearance settings or timing
settings, like "show after 5 secs", "fade out after 12 secs").

Finally I would like the editor to support recording voice narration via the browser
(probably using Flash). Probably the user would write their narration copy as a text
note first (which could be used later for accessibility), and then they would record
their narration. The idea would be to then synchronize the appearance or playback of 
media elements on the page with the narration.

For now however, stories can only be edited by editing the yaml file stored on the server.

Getting started
=====================

Download the Rails app. You need at least Rails 3.1.3. Run with "rails server", then
just go to: http://localhost:3000/player.html. The Kittinger story is currently
hard-coded in.

A note on browser support
--------------------------

Currently I am doing development solely in Chrome, and not worrying about support for any
other browser. I prefer to push the limits of HTML5 to see what is possible, and we can
worry about supporting other browsers later.

Next steps
--------------------------

Next steps basically fall into 2 buckets:
* Player work
* Editor

The player needs to add support for:
*video
*visual themes via a switching the CSS file
*Playback control. Autoplay, pause, stop, full-screen, mute
*Image transitions (fade in, fade out)

The Editor is really the big project. This needs a basic user reg/authentication system
in the rails app. Then it needs Story and Page models so that users can create and
edit new stories. And it needs a Story editor, which is probably a two pane
editor (left side control panel /item gallery and right side preview panel). The
preview panel should support drag-and-drop of lots of different media types, and
the user should be able to move and resize items dynamically on the preview. Each item
should have an object inspector where you can change attributs of the object.






