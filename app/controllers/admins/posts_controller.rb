class Admins::PostsController < Admins::AdminsController
	before_action :set_admins_post, only: [:show, :edit, :update, :destroy]

  def index
    @admins_posts = Post.all
  end

	def new
    @admins_post = Post.new
  end

	def create
    @admins_post = Post.new(admins_post_params)

    respond_to do |format|
      if @admins_post.save
        format.html { redirect_to admins_post_path(@admins_post), notice: 'Bài đăng đã được tạo thành công' }
        format.json { render action: 'show', status: :created, location: @admins_post }
      else
        format.html { render action: 'new' }
        format.json { render json: @admins_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @admins_post.update(admins_post_params)
      redirect_to admins_post_path(@admins_post), notice: 'Bài viết đã được cập nhật thành công.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @admins_post.destroy
    respond_to do |format|
      format.html { redirect_to admins_posts_path, notice: 'Bài viết đã được xoá thành công.' }
    end
  end

	private

	def set_admins_post
    @admins_post = Post.find_by(id: params[:id])
  end

	def admins_post_params
    params.require(:post).permit!
  end

end