- https://www.drupal.org/project/backstretch module provide set backgroud full page
- [hook_process_page custom logo any page, etc]( http://drupal.stackexchange.com/questions/74708/what-is-the-difference-between-hook-preprocess-page-and-hook-preprocess-html)
- https://www.drupal.org/project/views_merge_rows
- Render data via single template in module:
	Used hook_theme defined template then used function call it, for example:

	```
	function lbi_theme($existing, $type, $theme, $path) {
	 	 return array(
	    	 'print_order_template' => array(
			'template'  => 'templates/print_order',
			'variables' => array('order' => NULL)
			)
		);
	}
	print theme('print_order_template', array('order' => $order));
	```
- [Submit webform programmaticaly Drupal 7:] (http://drupal.stackexchange.com/questions/51826/submit-webform-programmaticaly-drupal-7)
