class CUWebLoginPage < BasePage
  page_url "#{$base_url}"

  element(:username) { |b| b.text_field(id: "username") }
  element(:password) { |b| b.text_field(id: "password") }
  button 'Sign In'

end