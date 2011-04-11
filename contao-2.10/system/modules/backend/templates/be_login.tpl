<!DOCTYPE html>
<html>
<head>
<meta charset="<?php echo $this->charset; ?>" />
<title><?php echo $this->title; ?> - Contao Open Source CMS <?php echo VERSION; ?></title>
<base href="<?php echo $this->base; ?>" />
<!--[if lt IE 9]><script src="<?php echo TL_PLUGINS_URL; ?>plugins/html5shim/html5.js?<?php echo HTML5SHIM; ?>"></script><![endif]-->
<link rel="stylesheet" href="<?php
  $objCombiner = new Combiner();
  $objCombiner->add('system/themes/'. $this->theme .'/basic.css');
  $objCombiner->add('system/themes/'. $this->theme .'/login.css');
  if ($this->isMac) {
    $objCombiner->add('system/themes/'. $this->theme .'/macfixes.css');
  }
  echo $objCombiner->getCombinedFile();
?>" media="all" />
<!--[if lt IE 8]><link rel="stylesheet" href="<?php echo TL_SCRIPT_URL; ?>system/themes/<?php echo $this->theme; ?>/iefixes.css?<?php echo VERSION .'.'. BUILD; ?>" media="screen" /><![endif]-->
<!--[if gt IE 7]><link rel="stylesheet" href="<?php echo TL_SCRIPT_URL; ?>system/themes/<?php echo $this->theme; ?>/ie8fixes.css?<?php echo VERSION .'.'. BUILD; ?>" media="screen" /><![endif]-->
<script src="<?php
  $objCombiner = new Combiner();
  $objCombiner->add('plugins/mootools/mootools-core.js', MOOTOOLS_CORE);
  $objCombiner->add('plugins/mootools/mootools-more.js', MOOTOOLS_MORE);
  echo $objCombiner->getCombinedFile();
?>"></script>
<!--[if lt IE 9]><script src="<?php echo TL_PLUGINS_URL; ?>plugins/selectivizr/selectivizr.js?<?php echo SELECTIVIZR; ?>"></script><![endif]-->
</head>
<body>
<?php $this->showIE6warning(); ?>

<div id="header">
<h1>Contao Open Source CMS <?php echo VERSION; ?></h1>
</div>

<div id="container">
<div id="main">

<h2><?php echo $this->headline; ?></h2>

<form action="<?php echo $this->action; ?>" class="tl_login_form" method="post">
<div class="formbody">
<input type="hidden" name="FORM_SUBMIT" value="tl_login" />
<?php echo $this->messages; ?>
<?php if ($this->noCookies): ?>

<p class="tl_error"><?php echo $this->noCookies; ?></p>
<?php endif; ?>

<table class="tl_login_table">
<tr>
  <td<?php echo $this->uClass; ?>><label for="username"><?php echo $this->username; ?></label></td>
  <td style="text-align:right;"><input type="text" name="username" id="username" class="tl_text" value="<?php echo $this->curUsername; ?>" maxlength="64" /></td>
</tr>
<tr>
  <td<?php echo $this->pClass; ?>><label for="password"><?php echo $this->password; ?></label></td>
  <td style="text-align:right;"><input type="password" name="password" id="password" class="tl_text" value="" maxlength="64" /></td>
</tr>
<tr>
  <td><label for="language"><?php echo $this->userLanguage; ?></label></td>
  <td style="text-align:right;">
    <select name="language" id="language" class="tl_select">
<?php foreach ($this->languages as $key=>$lang): ?>
      <option value="<?php echo specialchars($key); ?>"<?php if ($this->curLanguage == $key) echo ' selected="selected"'; ?>><?php echo $lang; ?></option>
<?php endforeach; ?>
    </select>
  </td>
</tr>
</table>

<div class="tl_login_submit_container">
  <input type="submit" name="login" id="login" class="tl_submit" value="<?php echo $this->loginButton; ?>" />
</div>

</div>
</form>

<div id="tl_license">

<p>Contao Open Source CMS (fka TYPOlight) :: Copyright ©2005-<?php echo date('Y'); ?> by
  Leo Feyer :: Extensions are copyright of their respective owners :: Visit
  <a href="http://www.contao.org" onclick="window.open(this.href); return false;">contao.org</a>
  for more information :: Obstructing the appearance of this notice is prohibited by law!</p>

<p>Contao is distributed in the hope that it will be useful but WITHOUT ANY
  WARRANTY. Without even the implied warranty of MERCHANTABILITY or FITNESS FOR
  A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
  details. Contao is free software. You can redistribute it and/or modify it
  under the terms of the GNU/LGPL as published by the Free Software Foundation.</p>

</div>

<p id="go_to_frontend"><a href="<?php echo $this->frontendFile; ?>" class="footer_preview" title="<?php echo $this->feLink; ?>"><?php echo $this->feLink; ?></a></p>

</div>
<?php if (!$this->disableCron): ?>

<!-- indexer::stop -->
<img src="<?php echo $this->base; ?>cron.php" alt="" class="invisible" />
<!-- indexer::continue -->
<?php endif; ?>

</div>

<script>
window.addEvent('domready', function() {
  if (parent.frames[0] && parent.frames[0].name == 'switch') {
    parent.location.reload();
  }
  $('username').focus();
});
</script>

</body>
</html>