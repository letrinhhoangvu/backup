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
- Custom view content type admin use modue admin_view
- Custom views collection  to use module Field Collection views

- Render images styless
	
	```php

	{% set node = build['#node'] %}
	<div class="content-type {{node.type}}">
	  <div class="post_date"> {{ node.created | fn__convert_to_unixtime}} </div
	  <div class="content">
	      <div class="image">
	        <img src="{{ fn__image_style_url('desk_newsletter_thumb', node.field_image['und'][0]['uri']) }}"/>
	      </div>
	      <div class="body">
	        {{ build['body']|render}}
	      </div>
	  </div>
	</di>

	```
- Search all your field collection
	
	```
	/**
	* search all your field_collection
	* @param $node the loaded node
	* @param $collection the machine name of your field collection
	* 
	* @return array of objects FieldCollectionItemEntity
	*/
	function getFieldCollection($node, $collection) {
	  foreach($node->{$collection}[LANGUAGE_NONE] as $collectionItem) {
	    $entity = entity_load('field_collection_item', array($collectionItem['value']));
	    $fieldCollection[] = $entity[(int)$collectionItem['value']];
	  }
	  return $fieldCollection;
	}
	```
