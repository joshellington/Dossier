class LinkMailer < ActionMailer::Base
  default from: "josh@roundhouseagency.com"

  def weekly_newsletter(links, email)
    @links = links

    mail(
      :subject => 'Dossier - Weekly Newsletter',
      :to      => email
    )
  end

end