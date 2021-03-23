require 'rails_helper'

RSpec.describe ScheduleProjectJob, type: :job do
  it 'queues the job' do
    ActiveJob::Base.queue_adapter = :test
    expect {ScheduleProjectJob.perform_later('notify')}.to have_enqueued_job
  end

  it "uploads a notify job" do
    ActiveJob::Base.queue_adapter = :test
    ScheduleProjectJob.perform_later('notify')
    expect(ScheduleProjectJob).to have_been_enqueued.exactly(:once)
  end
end