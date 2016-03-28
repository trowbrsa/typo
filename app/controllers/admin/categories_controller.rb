class Admin::CategoriesController < Admin::BaseController
  cache_sweeper :blog_sweeper

  def index; redirect_to :action => 'new' ; end
  def edit; new_or_edit;  end

  def new
    respond_to do |format|
      format.html { new_or_edit }
      format.js {
        @category = Category.new
      }
    end
  end

  def destroy
    @record = Category.find(params[:id])
    return(render 'admin/shared/destroy') unless request.post?

    @record.destroy
    redirect_to :action => 'new'
  end

  private

  # not sure if this is necessary
  # def category_params
  #   params.permit(category:[:id])
  # end

  def new_or_edit
    @categories = Category.find(:all)
    # params[:id] is nil currently. Do we need a private save method?
    # the @category in the above 'new' method is not getting passed to here,
    # so there are no params.
    @category = Category.find(params[:id])
    # what does params[:category] do?
    @category.attributes = params[:category]
    if request.post?
      respond_to do |format|
        format.html { save_category }
        format.js do
          @category.save
          @article = Article.new
          @article.categories << @category
          return render(:partial => 'admin/content/categories')
        end
      end
      return
    end
    render 'new'
  end

  def save_category
    if @category.save!
      flash[:notice] = _('Category was successfully saved.')
    else
      flash[:error] = _('Category could not be saved.')
    end
    redirect_to :action => 'new'
  end

end
