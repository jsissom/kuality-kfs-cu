Before do
  @config = YAML.load_file("#{File.dirname(__FILE__)}/config.yml")[:basic]
  visit CUWebLoginPage do |page|
    if page.username.exists?
      page.username.set @config[:cuweblogin_user]
      page.password.set @config[:cuweblogin_password]
      page.sign_in
    end
    # Otherwise, we're already logged in (or not actually using CUWebLogin)
    # and we can safely continue on our way. Something else should break if
    # anything is amiss.
  end
end
