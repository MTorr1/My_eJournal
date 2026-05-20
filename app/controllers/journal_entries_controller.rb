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
            
            render :new, status: :unprocessable_entity
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
        @entry = JournalEntry.includes(responses: { question: :question_options}).find(params[:id]);
        Question.all.each do|question|
            unless @entry.responses.find_by(question_id: question.id)
                @entry.responses.build(question: question)
            end
        end
    end
# the above code was meant to display my questions and responses in the edit menu, even if I hadn't filled them out

    def update
        @entry = JournalEntry.find(params[:id])
        if @entry.update(entry_params)
            redirect_to @entry, notice: "Sucsessul Entry"
        else
        @entry = JournalEntry.includes(responses: { question: :question_options }).find(params[:id])
        render :edit, status: :unprocessed_entity
        end
    end

    def destroy
        @entry = JournalEntry.find(params[:id]);
        @entry.destroy
        flash[:success] = "The to-do item was successfully destroyed."
        redirect_to journal_entries_url, notice: "Entry was removed"

        # respond_to do |format|
        #     format.html {redirect_to journal_entry_url, notice: "Entry was removed"}
        #     # does this need to be journal_entry or journal_entries?
        # end
    end

    private 
    def entry_params
        params.require(:journal_entry).permit(
            :title,
            :body,
            :entry_date,
            responses_attributes: [:id, :question_id, :text_value, :numeric_value, :date_value]
        )
        # Added date value as an attribute. Not sure if tis will work
    end
end

# @journal_entry = JournalEntry.includes(responses: { question: :question_options }).find(params[:id])