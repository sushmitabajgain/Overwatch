require 'rails_helper'

RSpec.describe ScheduleJob, type: :job do
  it 'queues the job' do
    ActiveJob::Base.queue_adapter = :test
    expect {ScheduleJob.perform_later('notify')}.to have_enqueued_job
  end

  it "uploads a notify job" do
    ActiveJob::Base.queue_adapter = :test
    ScheduleJob.perform_later('notify')
    expect(ScheduleJob).to have_been_enqueued.exactly(:once)
  end
end
