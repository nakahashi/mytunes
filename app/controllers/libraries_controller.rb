class LibrariesController < ApplicationController
  before_action :authenticate_user!

  def index
    @libraries ||= current_user.libraries
  end

  def destroy
    library ||= Library.find(params[:id])

    if library.present? and library.destroy
      flash[:notice] = 'ライブラリを削除しました'
    end

    redirect_to libraries_url
  end

  def edit
    @library ||= Library.find(params[:id])
  end

  def update
    flash[:notice] = 'ライブラリを更新しました'

    redirect_to edit_library_url
  end

  def show
    redirect_to libraries_url
  end

  def new
    @library ||= current_user.libraries.build
  end

  def create
    prop = {}.tap do |h|
      if library_params.present?
        h[:content] = library_params[:content].read.force_encoding('utf-8')
        h[:title] = library_params[:title].presence || 'マイライブラリ'
      end
    end

    library = current_user.libraries.build(prop)

    if library.save
      redirect_to libraries_url
    else
      redirect_to new_library_url
    end
  end

  private

  def library_params
    params.require(:library).permit(:title, :content)
  end
end
