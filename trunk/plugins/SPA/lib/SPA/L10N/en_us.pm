# ===========================================================================
# Copyright Everitz Consulting.  Not for redistribution.
# ===========================================================================
package SPA::L10N::en_us;

use strict;
use base 'SPA::L10N';
use vars qw( %Lexicon );

## If you want to create a new translation, follow these six steps:
##
## - Copy this file to <lowercase language code>.pm
##
## - Replace the "package" line with:
## package SPA::L10N::<lowercase language code>;
##
## - Replace the "use base" line with:
## use base 'SPA::L10N::en_us';
##
## - Change the replacement text as needed (the right side of "=>").
##
## - Send me a copy so I can distribute to others.
##
## - Save and upload to your server.  You're done.

## Tips for a successful translation:
##
## Make sure each line ends with a comma (,)
##
## If a variable such as [_1] is present, do not remove it
##
## Try to use HTML entities where possible (&uuml; instead of ü)
##
## Do not change the English (left) side of the translation string
##
## Any quotes within strings must be "escaped" to be included: 'This is a quote: \''

## The following is the translation table.

%Lexicon = (
	
	## SPA.pl
	'Provide access to Snap Preview Anywhere&trade; via template tag.' => 'Provide access to Snap Preview Anywhere&trade; via template tag.',

	## settings_blog.tmpl - messages
	'Enable MT-SPA for This Blog' => 'Enable MT-SPA for This Blog',
	'Enter Your Snap Preview Anywhere&trade; Key:' => 'Enter Your Snap Preview Anywhere&trade; Key:',
	'Display Snap Preview Anywhere&trade; for All Links (Default)' => 'Display Snap Preview Anywhere&trade; for All Links (Default)',
	'Display Snap Preview Anywhere&trade; for Local Links' => 'Display Snap Preview Anywhere&trade; for Local Links',
	'Display Snap Preview Anywhere&trade; Search Box Below the Thumbnail (Default)' => 'Display Snap Preview Anywhere&trade; Search Box Below the Thumbnail (Default)',
      'Display only PreviewShots&trade; (similar to Snap Preview Anywhere&trade; behavior).' =>'Display only PreviewShots&trade; (similar to Snap Preview Anywhere&trade; behavior).',
	'Add an Icon to Indicate Snap Preview Anywhere&trade; (Default)' => 'Add an Icon to Indicate Snap Preview Anywhere&trade; (Default)',
	'Show Snap Preview Anywhere&trade; When Cursor is Over Both Link and Icon (Default)' => 'Show Snap Preview Anywhere&trade; When Cursor is Over Both Link and Icon (Default)',
	'Show Snap Preview Anywhere&trade; Only When Cursor is Over the Icon' => 'Show Snap Preview Anywhere&trade; Only When Cursor is Over the Icon',
	'Display your custom logo (only select if you have uploaded to the Snap site)' => 'Display your custom logo (only select if you have uploaded to the Snap site)',
	'Choose the theme for your Snap Preview Anywhere&trade; display by clicking the appropriate color below (Default is Silver):' => 'Choose the theme for your Snap Preview Anywhere&trade; display by clicking the appropriate color below (Default is Silver):',

);

1;