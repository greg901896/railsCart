class SimpleJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
  end
end
