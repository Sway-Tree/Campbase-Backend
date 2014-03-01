class SessionsController < Devise::SessionsController
  # def create
  #   resource = warden.authenticate!(:scope => resource_name, :recall => '#{controller_path}#failure')
  #   sign_in_and_redirect(resource_name, resource)
  # end
 
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    return render :json => {:success => true}
  end
 
  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_to do |format|
      format.html {respond_with(resource, serialize_options(resource))}
      format.json { render json: {status:'fail'}}
    end
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_to do |format|
      format.html { respond_with resource, :location => after_sign_in_path_for(resource)}
      format.json {render json: {status:'ok'} }
    end
  end

  def failure
    return render :json => {:success => false, :errors => ['Login failed.']}
  end
end
