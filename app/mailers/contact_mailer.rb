class ContactMailer < ApplicationMailer
    def say_hello_to(user)
        @greg = user
        mail to:@greg.email, subject:"你好!!"
      end
end
