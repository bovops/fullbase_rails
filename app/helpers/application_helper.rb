module ApplicationHelper
  
  def title
  	base_title = "Fullbase"
  	if @title.nil?
  	  base_title
  	else
  	  "#{base_title} | #{@title}"
    end
  end

  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = :success if type == :notice
      type = :error   if type == :alert
      text = content_tag(:div, link_to("x", "#", :class => "close", "data-dismiss" => "alert") + message, :class => "alert fade in alert-#{type}")
      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end  

  class BootstrapLinkRenderer < ::WillPaginate::ActionView::LinkRenderer
    protected
  
    def html_container(html)
      tag :div, tag(:ul, html), container_attributes
    end
  
    def page_number(page)
      tag :li, link(page, page, :rel => rel_value(page)), :class => ('active' if page == current_page)
    end
  
    def gap
      tag :li, link(super, '#'), :class => 'disabled'
    end
  
    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
    end
  end
  
  def page_navigation_links(pages)
    will_paginate(pages, :class => 'pagination', :inner_window => 2, :outer_window => 0, :renderer => BootstrapLinkRenderer, :previous_label => '&larr;'.html_safe, :next_label => '&rarr;'.html_safe)
  end

end
