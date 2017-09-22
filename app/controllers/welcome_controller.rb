require 'rest-client'

class WelcomeController < ApplicationController
  STAGE_URL = "https://stage.skipio.com"
  PER_PAGE = 10
  TOKEN = ENV['TOKEN']
  @current_page = 1

  @total_pages

  @meta

  @contacts

  def get_contacts
    response = RestClient.get "#{STAGE_URL}/api/v2/contacts?token=#{TOKEN}&page=#{@current_page}&per=#{PER_PAGE}"
    body = JSON.parse(response.body)
    @meta = body['meta']
    @total_pages = @meta['total_pages']
    @current_page = @meta['current_page']
    body['data']
  end

  def get_dummy
    json_path = Rails.root.join('dummy_contact.json')
    file = File.read(json_path)
    JSON.parse(file)
  end

  def send_sms_message
    @id = params[:id]
    message = params[:message]
    smsMessage = {'recipients' => ["contact-#{@id}"], 'message' => {'body' => message}}
    puts "#{STAGE_URL}/api/v2/messages?token=#{TOKEN}"
    puts smsMessage
    response = RestClient.post "#{STAGE_URL}/api/v2/messages?token=#{TOKEN}", smsMessage.to_json, {content_type: :json, accept: :json} unless message.nil?

    puts response.body unless response.nil?
    puts response.code unless response.nil?
  end

  def index
    page = params['page']
    @current_page = page if page
    @contacts = get_contacts

  end
end
