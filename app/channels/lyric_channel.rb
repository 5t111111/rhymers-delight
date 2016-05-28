class LyricChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'lyric_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def make_it_rhyme(data)
    MakeItRhymeJob.perform_later(source: data['source'])
  end
end

