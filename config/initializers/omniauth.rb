Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['ae50e68a2852bd760c89'], ENV['cc9a975d843276a52d50eac274dee5d62888f044']
end
