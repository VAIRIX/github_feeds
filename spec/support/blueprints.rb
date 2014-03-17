require 'machinist/active_record'

  GithubFeedEntry.blueprint do
    entry_id  { 'tag:github.com,2008:CreateEvent/1946558445' }
    published { Time.now }
    updated   { Time.now }
    url       { 'https://github.com/vairix-garbeletche/vairix_test/compare/mvillero' }
    title     { 'vairix-mvillero created branch mvillero at vairix-garbeletche/vairix_test' }
    author    { 'vairix-mvillero' }
    content   { '<div> <span> </span> </div>' }
  end
