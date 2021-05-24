module QuestionsHelper
  def question_header(question)
    title = question.test.title
    if question.new_record?
      t('admin.questions.create.header', title: title)
    else
      t('admin.questions.edit.header', title: title)
    end
  end
end
