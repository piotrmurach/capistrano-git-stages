module Capistrano
  module Git
    module Stages
      extend self

      def load_into(cap_config)

        cap_config.load do

          namespace :git do

            def last_tag_matching(stage)
              matching_tags = `git tag -l '#{stage}'`.split
              tag = `git describe --match '#{stage}' --tags \`git rev-list --tags --max-count=1\``.split
              tag.length > 0 ? tag.first : nil
            end

            def latest_staging_tag
              last_tag_matching('staging/*')
            end

            def latest_production_tag
              last_tag_matching('production/*')
            end

            desc 'Push the latest tag for the given stage'
            task :push_tag do
              refname = case rails_env.to_s
              when 'staging'
                latest_staging_tag
              when 'production'
                latest_production_tag
              end

              run "git push --tags origin #{refname}"
              if $? != 0
                red "git push for #{refname} failed"
              end
            end
          end

        end

      end

    end # Stages
  end # Git
end # Capistrano

if Capistrano::Configuration.instance
  Capistrano::Git::Stages.load_into(Capistrano::Configuration.instance)
end
