module ChildrenTags
  include Radiant::Taggable
  
  desc %{
    Cycles through each of the children. Inside this tag all page attribute tags
    are mapped to the current child page.
  
    *Usage:*
    <pre><code><r:children:each [offset="number"] [limit="number"] [by="attribute"] [order="asc|desc"] 
     [status="draft|reviewed|published|hidden|all"]>
     ...
    </r:children:each>
    </code></pre>
  }
  tag 'children:each' do |tag|
    options = children_find_options(tag)
    result = []
    children = tag.locals.children
    tag.locals.previous_headers = {}
    tag.locals.previous_footers = {}
    children.find(:all, options).each do |item|
      tag.locals.child = item
      tag.locals.page = item
      result << tag.expand
    end 
    result
  end

  desc %{
    Renders the tag contents only if the contents do not match the previous header. This
    is extremely useful for rendering date headers for a list of child pages.
  
    If you would like to use several header blocks you may use the @name@ attribute to
    name the header. When a header is named it will not restart until another header of
    the same name is different.
  
    Using the @restart@ attribute you can cause other named headers to restart when the
    present header changes. Simply specify the names of the other headers in a semicolon
    separated list.
  
    *Usage:*
    <pre><code><r:children:each>
      <r:header [name="header_name"] [restart="name1[;name2;...]"]>
        ...
      </r:header>
    </r:children:each>
    </code></pre>
  }
  tag 'children:each:header' do |tag|
    previous_headers = tag.locals.previous_headers
    previous_footers = tag.locals.previous_footers
    name = tag.attr['name'] || :unnamed
    restart = (tag.attr['restart'] || '').split(';')
    header = tag.expand
    unless header == previous_headers[name]
      previous_headers[name] = header
      unless restart.empty?
        restart.each do |n|
          previous_headers[n] = nil
        end
      end
      if previous_footers[name]
        header = previous_footers[name] + header
      end
      header
    end
  end

  desc %{
    Store the tag content. It will be rendered before the corresponding header 
    tag when it do not match the previous header.
  
    *Usage:*
    <pre><code><r:children:each>
      <r:footer [name="header_name"]>
        ...
      </r:footer>
    </r:children:each>
    </code></pre>
  }
  tag 'children:each:footer' do |tag|
    tag.globals.last_footers ||= {}
    previous_footers = tag.locals.previous_footers
    name = tag.attr['name'] || :unnamed
    previous_footers[name] = tag.expand
    tag.globals.last_footers[name] = previous_footers[name]
    return
  end

  desc %{
    Renders the tag contents of the last footer tag
  
    *Usage:*
    <pre><code>
      <r:children:last_footer [name="header_name"]>
        ...
      </r:children:last_footer>
    </code></pre>
  }
  tag 'children:last_footer' do |tag|
    last_footers = tag.globals.last_footers
    name = tag.attr['name'] || :unnamed
    last_footers[name] || ''
  end
end