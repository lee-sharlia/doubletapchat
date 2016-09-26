class MessagesController < ApplicationController
    def index
        @messages = Message.all
    end
    
    def new
        @message = Message.new
    end
  
    def create
  	    @message = Message.new(message_params)
        if @message.save
            redirect_to '/messages'
        else
            render 'new'
        end
    end
    
    def update
    end

    def destroy
        if @message.destroy
            redirect_to messages_path, notice: "Oops! Say something wrong? Confirm you'd like to delete this message"
        else 
            render 'new', notice: "Oh no! I was unable to delete your post"
        end 
    end
  
    private
        def message_params
  	        params.require(:message).permit(:content)
        end
end
