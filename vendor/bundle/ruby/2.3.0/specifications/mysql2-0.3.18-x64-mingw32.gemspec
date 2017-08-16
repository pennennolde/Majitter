# -*- encoding: utf-8 -*-
# stub: mysql2 0.3.18 x64-mingw32 lib

Gem::Specification.new do |s|
  s.name = "mysql2".freeze
  s.version = "0.3.18"
  s.platform = "x64-mingw32".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Brian Lopez".freeze]
  s.date = "2015-02-17"
  s.email = "seniorlopez@gmail.com".freeze
  s.homepage = "http://github.com/brianmario/mysql2".freeze
  s.licenses = ["MIT".freeze]
  s.post_install_message = "\n======================================================================================================\n\n \\ You've installed the binary version of mysql2.\n  It was built using MySQL Connector/C version 6.1.5.\n  It's recommended to use the exact same version to avoid potential issues.\n\n  At the time of building this gem, the necessary DLL files were retrieved from:\n  http://cdn.mysql.com/Downloads/Connector-C/mysql-connector-c-6.1.5-winx64.zip\n\n \\ This gem *includes* vendor/libmysql.dll with redistribution notice in vendor/README.\n\n======================================================================================================\n\n".freeze
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.rubygems_version = "2.6.12".freeze
  s.summary = "A simple, fast Mysql library for Ruby, binding to libmysql".freeze

  s.installed_by_version = "2.6.12" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 0.9.5"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 0.9.3"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.8.0"])
    else
      s.add_dependency(%q<rake-compiler>.freeze, ["~> 0.9.5"])
      s.add_dependency(%q<rake>.freeze, ["~> 0.9.3"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.8.0"])
    end
  else
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 0.9.5"])
    s.add_dependency(%q<rake>.freeze, ["~> 0.9.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.8.0"])
  end
end
