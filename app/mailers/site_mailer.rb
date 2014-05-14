  class SiteMailer < ActionMailer::Base
    default from: ENV['EMAIL_FROM_ADDRESS']

    def status_email(site)
      @site = site
      @links = site.links
      mail(to: @site.email, subject: 'Link Checker Status')
    end
  end