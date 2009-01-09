class ChildrenTagsWithFootersExtension < Radiant::Extension
  version "1.0"
  description "Provides extra footer children tags, in addition to the children header tag"
  url "http://github.com/sofadesign/radiant-children_tags_with_footers-extension/"
  
  def activate
    Page.send :include, ChildrenTags  
  end
  
  def deactivate
  end
  
end