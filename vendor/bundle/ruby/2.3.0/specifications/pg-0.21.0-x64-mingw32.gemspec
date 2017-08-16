# -*- encoding: utf-8 -*-
# stub: pg 0.21.0 x64-mingw32 lib

Gem::Specification.new do |s|
  s.name = "pg".freeze
  s.version = "0.21.0"
  s.platform = "x64-mingw32".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Granger".freeze, "Lars Kanis".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDPDCCAiSgAwIBAgIBAzANBgkqhkiG9w0BAQUFADBEMQ0wCwYDVQQDDARsYXJz\nMR8wHQYKCZImiZPyLGQBGRYPZ3JlaXotcmVpbnNkb3JmMRIwEAYKCZImiZPyLGQB\nGRYCZGUwHhcNMTcwNDA0MTgyNDE1WhcNMTgwNDA0MTgyNDE1WjBEMQ0wCwYDVQQD\nDARsYXJzMR8wHQYKCZImiZPyLGQBGRYPZ3JlaXotcmVpbnNkb3JmMRIwEAYKCZIm\niZPyLGQBGRYCZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDZb4Uv\nRFJfRu/VEWiy3psh2jinETjiuBrL0NeRFGf8H7iU9+gx/DI/FFhfHGLrDeIskrJx\nYIWDMmEjVO10UUdj7wu4ZhmU++0Cd7Kq9/TyP/shIP3IjqHjVLCnJ3P6f1cl5rxZ\ngqo+d3BAoDrmPk0rtaf6QopwUw9RBiF8V4HqvpiY+ruJotP5UQDP4/lVOKvA8PI9\nP0GmVbFBrbc7Zt5h78N3UyOK0u+nvOC23BvyHXzCtcFsXCoEkt+Wwh0RFqVZdnjM\nLMO2vULHKKHDdX54K/sbVCj9pN9h1aotNzrEyo55zxn0G9PHg/G3P8nMvAXPkUTe\nbrhXrfCwWRvOXA4TAgMBAAGjOTA3MAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0G\nA1UdDgQWBBRAHK81igrXodaDj8a8/BIKsaZrETANBgkqhkiG9w0BAQUFAAOCAQEA\nWbp+grpaqUH+RiXNXmi/5xBfvSYLbxWj+DZpCSnQW+DMfx46RVVko3b7BtKDs2zs\nEtKM6r6s7VbllPgcYUzaP92uzPqCw8FncvqG0+B+Nd4C2jKzPxAQyzYXv/3bQhv1\nsXAzEqLQqKx5V63eBDh1TPvPTEMfJwmjcdcbvMwFSt5EcUkT63W13ZJXX23JYp1K\nKRW+N1WIYz8RSBNaQIP2v5Inb9vUA+jPUOcdyLHoi205lyZ28hE4lcnh9Zs02aHs\nAo8FZozVJz8xVEuYNJsL2k70w0FiwXwoWyvKyekgPBvYNUj4JGDMtBBayJTOpDs7\n3EVmCm5IRuqZ1UcDFouQ9w==\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2017-06-13"
  s.description = "Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/].\n\nIt works with {PostgreSQL 9.1 and later}[http://www.postgresql.org/support/versioning/].\n\nA small example usage:\n\n  #!/usr/bin/env ruby\n\n  require 'pg'\n\n  # Output a table of current connections to the DB\n  conn = PG.connect( dbname: 'sales' )\n  conn.exec( \"SELECT * FROM pg_stat_activity\" ) do |result|\n    puts \"     PID | User             | Query\"\n    result.each do |row|\n      puts \" %7d | %-16s | %s \" %\n        row.values_at('procpid', 'usename', 'current_query')\n    end\n  end".freeze
  s.email = ["ged@FaerieMUD.org".freeze, "lars@greiz-reinsdorf.de".freeze]
  s.extra_rdoc_files = ["Contributors.rdoc".freeze, "History.rdoc".freeze, "Manifest.txt".freeze, "README-OS_X.rdoc".freeze, "README-Windows.rdoc".freeze, "README.ja.rdoc".freeze, "README.rdoc".freeze, "ext/errorcodes.txt".freeze, "POSTGRES".freeze, "LICENSE".freeze, "ext/gvl_wrappers.c".freeze, "ext/pg.c".freeze, "ext/pg_binary_decoder.c".freeze, "ext/pg_binary_encoder.c".freeze, "ext/pg_coder.c".freeze, "ext/pg_connection.c".freeze, "ext/pg_copy_coder.c".freeze, "ext/pg_errors.c".freeze, "ext/pg_result.c".freeze, "ext/pg_text_decoder.c".freeze, "ext/pg_text_encoder.c".freeze, "ext/pg_type_map.c".freeze, "ext/pg_type_map_all_strings.c".freeze, "ext/pg_type_map_by_class.c".freeze, "ext/pg_type_map_by_column.c".freeze, "ext/pg_type_map_by_mri_type.c".freeze, "ext/pg_type_map_by_oid.c".freeze, "ext/pg_type_map_in_ruby.c".freeze, "ext/util.c".freeze]
  s.files = ["Contributors.rdoc".freeze, "History.rdoc".freeze, "LICENSE".freeze, "Manifest.txt".freeze, "POSTGRES".freeze, "README-OS_X.rdoc".freeze, "README-Windows.rdoc".freeze, "README.ja.rdoc".freeze, "README.rdoc".freeze, "ext/errorcodes.txt".freeze, "ext/gvl_wrappers.c".freeze, "ext/pg.c".freeze, "ext/pg_binary_decoder.c".freeze, "ext/pg_binary_encoder.c".freeze, "ext/pg_coder.c".freeze, "ext/pg_connection.c".freeze, "ext/pg_copy_coder.c".freeze, "ext/pg_errors.c".freeze, "ext/pg_result.c".freeze, "ext/pg_text_decoder.c".freeze, "ext/pg_text_encoder.c".freeze, "ext/pg_type_map.c".freeze, "ext/pg_type_map_all_strings.c".freeze, "ext/pg_type_map_by_class.c".freeze, "ext/pg_type_map_by_column.c".freeze, "ext/pg_type_map_by_mri_type.c".freeze, "ext/pg_type_map_by_oid.c".freeze, "ext/pg_type_map_in_ruby.c".freeze, "ext/util.c".freeze]
  s.homepage = "https://bitbucket.org/ged/ruby-pg".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.required_ruby_version = Gem::Requirement.new(["< 2.5".freeze, ">= 2.0".freeze])
  s.rubygems_version = "2.6.12".freeze
  s.summary = "Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/]".freeze

  s.installed_by_version = "2.6.12" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe-mercurial>.freeze, ["~> 1.4"])
      s.add_development_dependency(%q<hoe-deveiate>.freeze, ["~> 0.9"])
      s.add_development_dependency(%q<hoe-highline>.freeze, ["~> 0.2"])
      s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<rake-compiler-dock>.freeze, ["~> 0.6"])
      s.add_development_dependency(%q<hoe-bundler>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 5.1"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 3.16"])
    else
      s.add_dependency(%q<hoe-mercurial>.freeze, ["~> 1.4"])
      s.add_dependency(%q<hoe-deveiate>.freeze, ["~> 0.9"])
      s.add_dependency(%q<hoe-highline>.freeze, ["~> 0.2"])
      s.add_dependency(%q<rake-compiler>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rake-compiler-dock>.freeze, ["~> 0.6"])
      s.add_dependency(%q<hoe-bundler>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 5.1"])
      s.add_dependency(%q<hoe>.freeze, ["~> 3.16"])
    end
  else
    s.add_dependency(%q<hoe-mercurial>.freeze, ["~> 1.4"])
    s.add_dependency(%q<hoe-deveiate>.freeze, ["~> 0.9"])
    s.add_dependency(%q<hoe-highline>.freeze, ["~> 0.2"])
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rake-compiler-dock>.freeze, ["~> 0.6"])
    s.add_dependency(%q<hoe-bundler>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 5.1"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.16"])
  end
end
