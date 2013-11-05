class ClientMailer < ActionMailer::Base
  default from: "no-reply@bellazita.com"

  def sorted(client)
    @client = client

    mail to: client.email, subject: "Voce foi sorteado(a)!"
  end

end

