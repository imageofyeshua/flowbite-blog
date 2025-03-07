module Admin
  class PostsController < ApplicationController
    before_action :require_authentication, :require_admin

    def new
      @post = Post.new
    end

    def create
    end

    private

    def require_admin
      if !Current.session.user.admin?
        redirect_to root_path, alert: "You are not authorized to view this page"
      end
    end
  end
end
