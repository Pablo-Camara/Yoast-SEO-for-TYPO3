UPDATE `pages` SET `tx_yoastseo_focuskeyword`='Yoast SEO for TYPO3', `seo_title`='Yoast SEO for TYPO3 demo', `description` = 'This website is a default website setup for TYPO3. We will use it to demonstrate the basic features of Yoast SEO for TYPO3' WHERE uid=1;
UPDATE `tx_bootstrappackage_carousel_item` SET `header` = 'Demonstrating the out-of-the-box SEO features of Yoast SEO for TYPO3' WHERE uid=9;

UPDATE `sys_template` SET `constants` = '[tree.level === 0]
page.theme.navigation.style = default-transition
[end]

page.theme.navigation.type = top
page.theme.meta.enable = 0
page.logo.file = fileadmin/introduction/images/introduction-package.svg
page.logo.fileInverted = fileadmin/introduction/images/introduction-package-inverted.svg
plugin.bootstrap_package.settings.scss.breadcrumb-bg = #FFEB3B
plugin.bootstrap_package.settings.scss.cookieconsent-bg = #F2F2F2
plugin.bootstrap_package.settings.scss.footer-sections = (content:(background: #477608, color: #ffffff, link-color: #ffffff), meta:(background: #ffffff, color: $body-color, link-color: #a4286a))
page.theme.socialmedia.channels.facebook.url = https://www.facebook.com/typo3/
page.theme.socialmedia.channels.twitter.url = https://twitter.com/typo3
page.theme.socialmedia.channels.github.url = https://github.com/TYPO3/TYPO3.CMS
page.theme.socialmedia.channels.youtube.url = https://www.youtube.com/user/typo3
page.theme.cookieconsent.position = bottom-right
page.preloader.backgroundColor = #A4286A
page.preloader.logo.file = fileadmin/introduction/images/introduction-package-inverted.svg

plugin.bootstrap_package.settings.scss.secondary = #a4286a
plugin.bootstrap_package.settings.scss.primary = #477608' where uid=2;


UPDATE `tt_content` SET `header` = 'Yoast SEO for TYPO3', `bodytext` = '<p class="lead text-center">With a rich core feature set out-of-the-box, Yoast SEO for TYPO3 is an ideal choice for building ambitious digital experiences.</p>
<p class="text-center"><a class="btn btn-secondary" href="80">Features</a>&nbsp;<a class="btn btn-secondary" href="79">Customizing</a></p>' WHERE uid=209;

UPDATE `tt_content` SET `bodytext` = '<p><a href="https://maxserv.com" rel="noopener" target="_blank" title="MaxServ">MaxServ</a><br /> <a href="https://yoast.com" rel="noopener" target="_blank" title="Yoast">Yoast</a><br /> <a href="https://extensions.typo3.org/extension/yoast_seo" rel="noopener" target="_blank" title="Link to extension repository">TER</a></p>' WHERE uid=206;

UPDATE `tt_content` SET `header` = 'By MaxServ and Yoast', `bodytext` = '<p>This extension is mainly created by <a href="https://maxserv.com" rel="noopener" target="_blank" title="MaxServ">MaxServ</a> and <a href="https://yoast.com" rel="noopener" target="_blank" title="Yoast">Yoast</a>. Yoast with all the knowledge about SEO and MaxServ with all the knowledge of TYPO3 is the ideal combination to create this plugin. With this extension you can optimize your site quite easily and get better rankings in search engines.</p><p>Do you want even more features? <a rel="noopener" target="_blank" href="https://yoast.com/typo3-extensions-seo/">Buy our premium plugin!</a></p>' WHERE uid=210;
