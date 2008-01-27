# ===========================================================================
# Copyright Everitz Consulting.  Not for redistribution.
#
# Based loosely on the Wordpress Snap Preview Anywhere plugin:
# http://ajaydsouza.com/wordpress/plugins/snap-preview-anywhere/
# ===========================================================================
package MT::Plugin::SPA;

use base qw(MT::Plugin);
use strict;

use MT;

my $SPA;
my $about = {
  name => 'MT-SPA',
  description => "<MT_TRANS phrase=\"Provide access to SnapShots&trade; via template tag.\">",
  author_name => 'Everitz Consulting',
  author_link => 'http://www.everitz.com/',
  plugin_link => 'http://www.everitz.com/sol/mt-spa/index.php',
  doc_link => 'http://www.everitz.com/sol/mt-spa/index.php#install',
  l10n_class => 'SPA::L10N',
  version => '1.1.0',
  blog_config_template => 'settings_blog.tmpl',
  settings => new MT::PluginSettings([
    ['spa_enabled', { Default => 0 }],
    ['spa_key'],
    ['spa_alllinks', { Default => 1 }],
    ['spa_locallinks', { Default => 0 }],
    ['spa_searchbox', { Default => 1 }],
    ['spa_previewshots', { Default => 0 }],
    ['spa_link_icon', { Default => 1 }],
    ['spa_preview_trigger', { Default => 'both' }],
    ['spa_theme', { Default => 'silver' }],
    ['spa_customlogo', { Default => 0 }],
  ])
};
$SPA = MT::Plugin::SPA->new($about);
MT->add_plugin($SPA);

# template tags

require MT::Template::Context;
MT::Template::Context->add_tag(SnapPreviewAnywhere => \&snap_preview_anywhere);

sub snap_preview_anywhere {
  my ($ctx, $args) = @_;
  my $blog_id = $ctx->stash('blog_id');

  # check for spa
  my $enabled = $SPA->get_config_value('spa_enabled', 'blog:'.$blog_id);
  return '' unless ($enabled);

  # check for key
  my $key = $SPA->get_config_value('spa_key', 'blog:'.$blog_id);
  return '' unless ($key);

  # check for blog
  require MT::Blog;
  my $blog = MT::Blog->load($blog_id);
  return '' unless ($blog);

  # trim url
  my $blog_url = $blog->site_url;
  $blog_url =~ s|^http://||;
  $blog_url =~ s|/$||;

  my ($cfg, $str);

  # all links
  $cfg = $SPA->get_config_value('spa_alllinks', 'blog:'.$blog_id);
  $str .= 'ap=';
  $str .= ($cfg) ? '1' : '0';
  $str .= '&amp;key='.$key;

  # search box
  $cfg = $SPA->get_config_value('spa_searchbox', 'blog:'.$blog_id);
  $str .= '&amp;sb=';
  $str .= ($cfg) ? '1' : '0';

  # preview shots
  $cfg = $SPA->get_config_value('spa_previewshots', 'blog:'.$blog_id);
  $str .= '&amp;po=';
  $str .= ($cfg) ? '1' : '0';

  # theme
  $cfg = $SPA->get_config_value('spa_theme', 'blog:'.$blog_id);
  $str .= '&amp;th=';
  $str .= ($cfg) ? $cfg : 'silver';

  # custom logo
  $cfg = $SPA->get_config_value('spa_customlogo', 'blog:'.$blog_id);
  $str .= '&amp;cl=';
  $str .= ($cfg) ? '1' : '0';

  # local links
  $cfg = $SPA->get_config_value('spa_locallinks', 'blog:'.$blog_id);
  $str .= '&amp;si=';
  $str .= ($cfg) ? '1' : '0';

  # user preview iframe
  $str .= '&amp;oi=0';

  # link icon and preview trigger
  $cfg = $SPA->get_config_value('spa_link_icon', 'blog:'.$blog_id);
  if ($cfg) {
    my $lip = '&amp;link_icon=on';
    $cfg = $SPA->get_config_value('spa_preview_trigger', 'blog:'.$blog_id);
    $lip .= ($cfg) ? '&amp;preview_trigger='.$cfg : '';
    $str .= $lip;
  }

  # elements <- not used with SnapShots
  # $cfg = $SPA->get_config_value('spa_elements', 'blog:'.$blog_id);
  # $str .= '&amp;es=all'  if ($cfg && $cfg eq 'all');
  # $str .= '&amp;es=none' if ($cfg && $cfg eq 'none');
  # $cfg eq 'default' not sent (it's the default)

  # url
  $str .= '&amp;domain='.$blog_url;

  return <<HTML;
<script type="text/javascript" src="http://shots.snap.com/snap_shots.js?$str"></script>
HTML
}

1;