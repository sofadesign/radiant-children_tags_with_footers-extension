namespace :radiant do
  namespace :extensions do
    namespace :children_tags_with_footers do
      
      desc "Runs the migration of the Children Tags With Footers extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          ChildrenTagsWithFootersExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          ChildrenTagsWithFootersExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Children Tags With Footers to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[ChildrenTagsWithFootersExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(ChildrenTagsWithFootersExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
