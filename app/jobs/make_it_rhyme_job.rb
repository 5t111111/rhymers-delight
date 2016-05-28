class MakeItRhymeJob < ApplicationJob
  queue_as :default

  def perform(source:)
    ActionCable.server.broadcast 'lyric_channel', rhyme: render_rhyme(source)
  end

  private

  def render_rhyme(source)
    ApplicationController.renderer.render partial: 'lyrics/rhyme', locals: { body: source }
  end
end

