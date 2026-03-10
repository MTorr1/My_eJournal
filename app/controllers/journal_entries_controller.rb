class JournalEntriesController < ApplicationController
    def index
        @entries = JournalEntry.all
    end
    def create
        @entry = JournalEntry.create(entry_params)
    end
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
        params.require(:journal_entry).permit(:body, :title, :q1, :q2, :q3, :q4, :entry_date, :mood)
    end

    def update_params
        params.require(:journal_entry).permit(:body, :title, :q1, :q2, :q3, :q4, :mood)
    end
end
