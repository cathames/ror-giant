class JobMailer < ActionMailer::Base
  #default from: "from@example.com"

  def email_address_for_resumes
    "resumes@#{default_url_options[:host]}"
  end

  def mail_application(job_application)
    @job_application = job_application
    @job = @job_application.job
    puts "## @job_application==#{job_application}"
    @subject = "Application for #{reference_to_job}"
    mail from: @job_application.email,
           to: email_address_for_resumes,
      subject: @subject
  end

  def mail_referral(job_referral)
    @job_referral = job_referral
    @job = @job_referral.job
    @subject = "??? wants to you know about #{reference_to_job}"
    mail from: email_address_for_resumes,
           to: @job_referral.email,
      subject: @subject
  end

private
  def reference_to_job
     "job ##{@job.id_scheme_ext}: #{@job.title}"
  end
end