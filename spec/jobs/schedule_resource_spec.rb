require 'rails_helper'

RSpec.describe ScheduleResourceJob, type: :job do
  it 'queues the job' do
    ActiveJob::Base.queue_adapter = :test
    expect {ScheduleResourceJob.perform_later('notify')}.to have_enqueued_job
  end

  it "uploads a notify job" do
    ActiveJob::Base.queue_adapter = :test
    ScheduleResourceJob.perform_later('notify')
    expect(ScheduleResourceJob).to have_been_enqueued.exactly(:once)
  end
end
