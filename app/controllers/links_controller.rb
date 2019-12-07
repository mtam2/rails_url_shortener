class LinksController < ApplicationController
  before_action :validate_link, except: [:new, :create]

  def new
    @link = Link.new
  end

  def create
    link = Link.find_or_initialize_by(
      original_link: params[:link][:original_link],
    )
    if link.save
      redirect_to action: :show, uuid: link.uuid
    else
      @errors = "Error 400: #{link.errors.messages.values[0][0]}"
      redirect_to action: :new, errors: @errors, status: 400
    end
  end

  def show
  end

  def redirect
    redirect_to @link.original_link
  end

  private
    def validate_link
      @link = Link.find_by(uuid: params[:uuid] || params[:unmatched_route])
      if @link.blank?
        @errors = "Error 404: Link not found."
        redirect_to action: :new, status: 404
      else
        @shortened_link = "#{request.base_url}/#{@link.uuid}"
      end
    end
end
