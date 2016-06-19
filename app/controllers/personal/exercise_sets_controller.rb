module Personal
  class ExerciseSetsController < ApplicationController
    before_filter :load_context, only: [:new, :index, :create]
    before_filter :get_exercise_set, only: [:train, :check]
    before_filter :load_exercise_context, only: [:train]
    after_filter :load_exercise_context, only: [:check]


    def new; end

    def index; end

    def create
      if @context.form.valid?
        ::Personal::ExerciseSetSaver.perform(current_user, @context.form.attributes)
        redirect_to exercise_sets_path
      else
        render :new
      end
    end

    def train; end

    def check
      form_data = params.fetch(:exercise_form)
      @form = AnswerEvaluationForm.new(form_data)
      @check_answer ||= CheckAnswer.perform(form_data)
      @template_path = @check_answer[:result] ? 'correct_answer' : 'incorrect_answer'
    end

    def save_progress
      form_data = params.fetch(:answer_evaluation_form)
      form = AnswerEvaluationForm.new(form_data)
      if form.valid?
        ur = UserRepetition.find(form.user_repetition_id)
        ur.process_recall_result(form.quality)
      end
      redirect_to train_exercise_sets_path(ur.exercise_set)
    end

    # def edit; end

    # def update; end

    private

    def load_context
      @context = ::Personal::ExerciseSetsContext.new(current_user, params)
    end

    def get_exercise_set
      @exercise_set = current_user.exercise_sets.find(params[:id])
    end

    def load_exercise_context
      @context = ::Personal::ExerciseContext.new(@exercise_set)
    end
  end
end
