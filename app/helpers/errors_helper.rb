module ErrorsHelper
  def set_error(err_msg)
    session[:error] = err_msg
  end

  def display_error
    error = session[:error]
    session[:error] = nil
    error
  end

  def get_ar_errors(ar_obj)
    # I think something like this would be better...what ou don't want to see
    # is something like
    #
    # something
    # enumerable.each do
    #   adjust something
    # end
    # something
    #
    # There's always an enumerable that's better..usu. map or each_with_object

    err_msg = ar_obj.errors.messages.each_with_object("") do |memo, elem|
      memo += "#{elem}, #{elem.join(', ')}"
    end
    set_error("Error: #{err_msg}")

  end
end
