require 'pathname'

# Serve out assets for Servlet containers that can't easily be configured to do
# it for us (like Tomcat 7)
class AssetsController < ApplicationController
  set_access_control  :public => [:show]

  def show
    requested_path = "#{params[:path]}.#{params[:format]}"

    ASUtils.find_local_directories("frontend/assets").each do |root_dir|
      full_path = Pathname.new(File.join(root_dir, requested_path)).cleanpath.to_path

      if full_path.start_with?(root_dir) && File.exists?(full_path)
        mime_type = Mime::Type.lookup_by_extension(params[:format])
        content_type = mime_type.to_s unless mime_type.nil?

        if !content_type
          content_type = "application/octet-stream"
        end

        return render :file => full_path, :content_type => content_type
      end
    end

    render :text => "Not found", :status => 404
  end
end
