class RemoveUrlsJob < ApplicationJob
  def perform
    urls = Url.where('created_at < ?', Time.current - 15.days)
    urls.destroy_all
  end

  private

  def add_next_job(job)
    run_at = job.run_at + 1.days
    Delayed::Job.create handler: RemoveUrlsJob.new.to_yaml, run_at: run_at
  end
end
