class GadgetSearch
  def initialize(user_id, searched_gadget=nil)
    @criteria = Gadget.criteria
    @user_id = user_id
    @searched_gadget = searched_gadget
  end

  def search
    @criteria = @criteria.by_user_id(@user_id)
    @criteria = @criteria.full_text_search(@searched_gadget) if @searched_gadget
    @criteria
  end
end
