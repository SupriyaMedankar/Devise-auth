ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "gmail.com",
    :user_name => "sample.kiprosh@gmail.com",
    :password => "salaryapp",
    :authentication => "plain",
    :enable_starttls_auto => true
}
