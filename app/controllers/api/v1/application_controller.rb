module Api::V1
  class ApplicationController < ActionController::API
    include ActionController::MimeResponds

    protected

    def send_response(hash)
      respond_to do |f|
        f.xml  { render :xml => hash.to_xml }
        f.json { render :json => hash.to_json }
      end
    end
  end
end
