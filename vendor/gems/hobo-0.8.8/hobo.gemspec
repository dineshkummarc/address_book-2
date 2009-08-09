# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hobo}
  s.version = "0.8.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Locke"]
  s.date = %q{2009-06-24}
  s.default_executable = %q{hobo}
  s.description = %q{The web app builder for Rails}
  s.email = %q{tom@tomlocke.com}
  s.executables = ["hobo"]
  s.extra_rdoc_files = ["lib/hobo.rb", "lib/hobo/lifecycles/state.rb", "lib/hobo/lifecycles/transition.rb", "lib/hobo/lifecycles/actions.rb", "lib/hobo/lifecycles/creator.rb", "lib/hobo/lifecycles/lifecycle.rb", "lib/hobo/dryml/tag_parameters.rb", "lib/hobo/dryml/template_environment.rb", "lib/hobo/dryml/parser.rb", "lib/hobo/dryml/template_handler.rb", "lib/hobo/dryml/parser/source.rb", "lib/hobo/dryml/parser/tree_parser.rb", "lib/hobo/dryml/parser/attribute.rb", "lib/hobo/dryml/parser/text.rb", "lib/hobo/dryml/parser/base_parser.rb", "lib/hobo/dryml/parser/document.rb", "lib/hobo/dryml/parser/elements.rb", "lib/hobo/dryml/parser/element.rb", "lib/hobo/dryml/taglib.rb", "lib/hobo/dryml/dryml_support_controller.rb", "lib/hobo/dryml/dryml_builder.rb", "lib/hobo/dryml/dryml_doc.rb", "lib/hobo/dryml/part_context.rb", "lib/hobo/dryml/template.rb", "lib/hobo/dryml/dryml_generator.rb", "lib/hobo/dryml/scoped_variables.rb", "lib/hobo/permissions.rb", "lib/hobo/guest.rb", "lib/hobo/user_controller.rb", "lib/hobo/rapid_helper.rb", "lib/hobo/tasks/rails.rb", "lib/hobo/permissions/associations.rb", "lib/hobo/include_in_save.rb", "lib/hobo/hobo_helper.rb", "lib/hobo/scopes/named_scope_extensions.rb", "lib/hobo/scopes/apply_scopes.rb", "lib/hobo/scopes/automatic_scopes.rb", "lib/hobo/scopes/association_proxy_extensions.rb", "lib/hobo/bundle.rb", "lib/hobo/controller.rb", "lib/hobo/find_for.rb", "lib/hobo/lifecycles.rb", "lib/hobo/undefined.rb", "lib/hobo/user.rb", "lib/hobo/dryml.rb", "lib/hobo/undefined_access_error.rb", "lib/hobo/authentication_support.rb", "lib/hobo/dev_controller.rb", "lib/hobo/accessible_associations.rb", "lib/hobo/scopes.rb", "lib/hobo/view_hints.rb", "lib/hobo/generator.rb", "lib/hobo/static_tags", "lib/hobo/model_router.rb", "lib/hobo/model_controller.rb", "lib/hobo/model.rb", "lib/action_view_extensions/helpers/tag_helper.rb", "lib/active_record/association_proxy.rb", "lib/active_record/association_reflection.rb", "lib/active_record/association_collection.rb", "lib/active_record/viewhints_validations_interceptor.rb", "bin/hobo", "tasks/hobo_tasks.rake", "tasks/environments.rake", "LICENSE.txt", "README"]
  s.files = ["lib/hobo.rb", "lib/hobo/lifecycles/state.rb", "lib/hobo/lifecycles/transition.rb", "lib/hobo/lifecycles/actions.rb", "lib/hobo/lifecycles/creator.rb", "lib/hobo/lifecycles/lifecycle.rb", "lib/hobo/dryml/tag_parameters.rb", "lib/hobo/dryml/template_environment.rb", "lib/hobo/dryml/parser.rb", "lib/hobo/dryml/template_handler.rb", "lib/hobo/dryml/parser/source.rb", "lib/hobo/dryml/parser/tree_parser.rb", "lib/hobo/dryml/parser/attribute.rb", "lib/hobo/dryml/parser/text.rb", "lib/hobo/dryml/parser/base_parser.rb", "lib/hobo/dryml/parser/document.rb", "lib/hobo/dryml/parser/elements.rb", "lib/hobo/dryml/parser/element.rb", "lib/hobo/dryml/taglib.rb", "lib/hobo/dryml/dryml_support_controller.rb", "lib/hobo/dryml/dryml_builder.rb", "lib/hobo/dryml/dryml_doc.rb", "lib/hobo/dryml/part_context.rb", "lib/hobo/dryml/template.rb", "lib/hobo/dryml/dryml_generator.rb", "lib/hobo/dryml/scoped_variables.rb", "lib/hobo/permissions.rb", "lib/hobo/guest.rb", "lib/hobo/user_controller.rb", "lib/hobo/rapid_helper.rb", "lib/hobo/tasks/rails.rb", "lib/hobo/permissions/associations.rb", "lib/hobo/include_in_save.rb", "lib/hobo/hobo_helper.rb", "lib/hobo/scopes/named_scope_extensions.rb", "lib/hobo/scopes/apply_scopes.rb", "lib/hobo/scopes/automatic_scopes.rb", "lib/hobo/scopes/association_proxy_extensions.rb", "lib/hobo/bundle.rb", "lib/hobo/controller.rb", "lib/hobo/find_for.rb", "lib/hobo/lifecycles.rb", "lib/hobo/undefined.rb", "lib/hobo/user.rb", "lib/hobo/dryml.rb", "lib/hobo/undefined_access_error.rb", "lib/hobo/authentication_support.rb", "lib/hobo/dev_controller.rb", "lib/hobo/accessible_associations.rb", "lib/hobo/scopes.rb", "lib/hobo/view_hints.rb", "lib/hobo/generator.rb", "lib/hobo/static_tags", "lib/hobo/model_router.rb", "lib/hobo/model_controller.rb", "lib/hobo/model.rb", "lib/action_view_extensions/helpers/tag_helper.rb", "lib/active_record/association_proxy.rb", "lib/active_record/association_reflection.rb", "lib/active_record/association_collection.rb", "lib/active_record/viewhints_validations_interceptor.rb", "bin/hobo", "Rakefile", "tasks/hobo_tasks.rake", "tasks/environments.rake", "CHANGES.txt", "taglibs/rapid_document_tags.dryml", "taglibs/rapid_support.dryml", "taglibs/rapid_navigation.dryml", "taglibs/rapid_generics.dryml", "taglibs/rapid_user_pages.dryml", "taglibs/core.dryml", "taglibs/rapid_lifecycles.dryml", "taglibs/rapid.dryml", "taglibs/rapid_editing.dryml", "taglibs/rapid_pages.dryml", "taglibs/rapid_core.dryml", "taglibs/rapid_forms.dryml", "taglibs/rapid_plus.dryml", "rails_generators/hobo_user_controller/templates/functional_test.rb", "rails_generators/hobo_user_controller/templates/helper.rb", "rails_generators/hobo_user_controller/templates/controller.rb", "rails_generators/hobo_user_controller/USAGE", "rails_generators/hobo_user_controller/hobo_user_controller_generator.rb", "rails_generators/hobo_rapid/templates/IE7.js", "rails_generators/hobo_rapid/templates/reset.css", "rails_generators/hobo_rapid/templates/blank.gif", "rails_generators/hobo_rapid/templates/lowpro.js", "rails_generators/hobo_rapid/templates/ie7-recalc.js", "rails_generators/hobo_rapid/templates/hobo-rapid.js", "rails_generators/hobo_rapid/templates/themes/clean/views/clean.dryml", "rails_generators/hobo_rapid/templates/themes/clean/public/stylesheets/clean.css", "rails_generators/hobo_rapid/templates/themes/clean/public/stylesheets/rapid-ui.css", "rails_generators/hobo_rapid/templates/themes/clean/public/images/fieldbg.gif", "rails_generators/hobo_rapid/templates/themes/clean/public/images/pencil.png", "rails_generators/hobo_rapid/templates/themes/clean/public/images/50-ACD3E6-fff.png", "rails_generators/hobo_rapid/templates/themes/clean/public/images/small_close.png", "rails_generators/hobo_rapid/templates/themes/clean/public/images/100-3B5F87-ACD3E6.png", "rails_generators/hobo_rapid/templates/themes/clean/public/images/300-ACD3E6-fff.png", "rails_generators/hobo_rapid/templates/themes/clean/public/images/spinner.gif", "rails_generators/hobo_rapid/templates/hobo-rapid.css", "rails_generators/hobo_rapid/hobo_rapid_generator.rb", "rails_generators/hobo/templates/dryml-support.js", "rails_generators/hobo/templates/guest.rb", "rails_generators/hobo/templates/application.dryml", "rails_generators/hobo/templates/initializer.rb", "rails_generators/hobo/templates/application.css", "rails_generators/hobo/hobo_generator.rb", "rails_generators/hobo_front_controller/hobo_front_controller_generator.rb", "rails_generators/hobo_front_controller/templates/functional_test.rb", "rails_generators/hobo_front_controller/templates/helper.rb", "rails_generators/hobo_front_controller/templates/controller.rb", "rails_generators/hobo_front_controller/templates/index.dryml", "rails_generators/hobo_front_controller/USAGE", "rails_generators/hobo_user_model/templates/mailer.rb", "rails_generators/hobo_user_model/templates/fixtures.yml", "rails_generators/hobo_user_model/templates/unit_test.rb", "rails_generators/hobo_user_model/templates/forgot_password.erb", "rails_generators/hobo_user_model/templates/model.rb", "rails_generators/hobo_user_model/USAGE", "rails_generators/hobo_user_model/hobo_user_model_generator.rb", "rails_generators/hobo_model/templates/fixtures.yml", "rails_generators/hobo_model/templates/unit_test.rb", "rails_generators/hobo_model/templates/hints.rb", "rails_generators/hobo_model/templates/model.rb", "rails_generators/hobo_model/USAGE", "rails_generators/hobo_model/hobo_model_generator.rb", "rails_generators/hobo_model_controller/templates/functional_test.rb", "rails_generators/hobo_model_controller/templates/helper.rb", "rails_generators/hobo_model_controller/templates/controller.rb", "rails_generators/hobo_model_controller/USAGE", "rails_generators/hobo_model_controller/hobo_model_controller_generator.rb", "rails_generators/hobo_model_resource/templates/functional_test.rb", "rails_generators/hobo_model_resource/templates/helper.rb", "rails_generators/hobo_model_resource/templates/controller.rb", "rails_generators/hobo_model_resource/hobo_model_resource_generator.rb", "rails_generators/hobo_subsite/templates/application.dryml", "rails_generators/hobo_subsite/templates/controller.rb", "rails_generators/hobo_subsite/templates/site_taglib.dryml", "rails_generators/hobo_subsite/hobo_subsite_generator.rb", "init.rb", "LICENSE.txt", "README", "script/destroy", "script/generate", "dryml_generators/rapid/forms.dryml.erb", "dryml_generators/rapid/pages.dryml.erb", "dryml_generators/rapid/cards.dryml.erb", "Manifest", "test/permissions/models/models.rb", "test/permissions/models/schema.rb", "test/permissions/test_permissions.rb", "test/generators/test_hobo_model_controller_generator.rb", "test/generators/test_generator_helper.rb", "test/generators/test_helper.rb", "hobo.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://hobocentral.net/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Hobo", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{hobo}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{The web app builder for Rails}
  s.test_files = ["test/generators/test_generator_helper.rb", "test/generators/test_helper.rb", "test/generators/test_hobo_model_controller_generator.rb", "test/permissions/test_permissions.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hobosupport>, ["= 0.8.8"])
      s.add_runtime_dependency(%q<hobofields>, ["= 0.8.8"])
      s.add_runtime_dependency(%q<rails>, [">= 2.2.2"])
      s.add_runtime_dependency(%q<mislav-will_paginate>, [">= 2.2.1"])
    else
      s.add_dependency(%q<hobosupport>, ["= 0.8.8"])
      s.add_dependency(%q<hobofields>, ["= 0.8.8"])
      s.add_dependency(%q<rails>, [">= 2.2.2"])
      s.add_dependency(%q<mislav-will_paginate>, [">= 2.2.1"])
    end
  else
    s.add_dependency(%q<hobosupport>, ["= 0.8.8"])
    s.add_dependency(%q<hobofields>, ["= 0.8.8"])
    s.add_dependency(%q<rails>, [">= 2.2.2"])
    s.add_dependency(%q<mislav-will_paginate>, [">= 2.2.1"])
  end
end
