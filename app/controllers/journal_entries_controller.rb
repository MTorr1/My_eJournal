class JournalEntriesController < ApplicationController
    def index
        @entries = JournalEntry.all
    end
    def create
        @entry = JournalEntry.create(entry_params)
        if @entry.save
            redirect_to @entry
        else
            puts "--- Save Failed---"
            puts @entry.errors.full_messages
            @entry.responses.each do |r|
                puts "Response Error #{r.errors.full_messages}" if r.errors.any?
            end
            
            render :new, status: :unprocessable_entry
        end
    end
    # remove the IF statment after I have fixed saving bug
    def new   
        @entry = JournalEntry.new(entry_date: Date.today)
        Question.order(:position).each do |q|
         @entry.responses.build(question: q)
     end
    end

    def show
        @entry = JournalEntry.find(params[:id])
    end

    def edit
        @entry = JournalEntry.find(params[:id])
    end

    def update
        @entry = JournalEntry.find(params[:id]);
        @entry.update(entry_params)
    end

    def destroy
        @entry = JournalEntry.find(params[:id]);
        @entry.destroy
    end

    private 
    def entry_params
        params.require(:journal_entry).permit(
            :title,
            :body,
            :entry_date,
            responses_attributes: [:id, :question_id, :text_value, :numeric_value]
        )
    end
end