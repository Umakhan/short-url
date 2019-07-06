class ApplicationJob < ActiveJob::Base
  def max_attempts
    3
  end

  def success(job)
    add_next_job(job)
  end
end
